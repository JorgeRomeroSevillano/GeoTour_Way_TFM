package com.tfm.patrimonio.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Locale;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tfm.patrimonio.controller.model.ClimaProvinciaResponse;
import com.tfm.patrimonio.controller.model.GastronomiaProvinciaResponse;
import com.tfm.patrimonio.controller.model.PatrimonioDetalleResponse;
import com.tfm.patrimonio.controller.model.PatrimonioGeneralResponse;
import com.tfm.patrimonio.data.model.PatrimonioCulturalEntity;
import com.tfm.patrimonio.data.model.PatrimonioEntity;
import com.tfm.patrimonio.data.model.PatrimonioNaturalEntity;
import com.tfm.patrimonio.data.model.ProvinciaEntity;
import com.tfm.patrimonio.data.repository.ClimaProvinciaEstacionalRepository;
import com.tfm.patrimonio.data.repository.GastronomiaRepository;
import com.tfm.patrimonio.data.repository.PatrimonioCulturalRepository;
import com.tfm.patrimonio.data.repository.PatrimonioNaturalRepository;
import com.tfm.patrimonio.data.repository.PatrimonioRepository;
import com.tfm.patrimonio.data.repository.ProvinciaRepository;
import com.tfm.patrimonio.data.utils.PatrimonioMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PatrimonioService {

    private static final BigDecimal PESO_VALOR_ANTERIOR = new BigDecimal("0.90");
    private static final BigDecimal PESO_VALOR_ENTRANTE = new BigDecimal("0.10");
    private static final BigDecimal VALORACION_MINIMA = BigDecimal.ZERO;
    private static final BigDecimal VALORACION_MAXIMA = new BigDecimal("10.00");

    private final PatrimonioRepository patrimonioRepository;
    private final PatrimonioCulturalRepository patrimonioCulturalRepository;
    private final PatrimonioNaturalRepository patrimonioNaturalRepository;
    private final ProvinciaRepository provinciaRepository;
    private final GastronomiaRepository gastronomiaRepository;
    private final ClimaProvinciaEstacionalRepository climaRepository;

    @Transactional(readOnly = true)
    public List<PatrimonioGeneralResponse> getPatrimonios(
            List<String> ids,
            List<String> nombre,
            List<String> tipo,
            List<String> valoracion,
            List<String> localidades,
            List<String> provincias,
            List<String> comunidades) {
        Specification<PatrimonioEntity> filtros = buildSpecification(java.util.Arrays.asList(
                inIds(parseIntegers(ids)),
                likeValue("nombre", firstCleanValue(nombre)),
                equalLowercase("tipo", firstCleanValue(tipo)),
                greaterThanOrEqualTo("valoracion", firstBigDecimal(valoracion)),
                likeAny("localidad", cleanValues(localidades)),
                likeAnyProvincia("nombre", cleanValues(provincias)),
                likeAnyProvincia("comunidad", cleanValues(comunidades))));

        List<PatrimonioEntity> patrimonios = filtros == null
                ? patrimonioRepository.findAll(Sort.by("nombre"))
                : patrimonioRepository.findAll(filtros, Sort.by("nombre"));

        return patrimonios
                .stream()
                .map(PatrimonioMapper::toGeneralResponse)
                .toList();
    }

    @Transactional(readOnly = true)
    public PatrimonioDetalleResponse getPatrimonioDetalle(Integer id) {
        PatrimonioEntity patrimonio = getPatrimonioEntity(id);
        PatrimonioCulturalEntity cultural = null;
        PatrimonioNaturalEntity natural = null;

        if ("cultural".equalsIgnoreCase(patrimonio.getTipo())) {
            cultural = patrimonioCulturalRepository.findById(id).orElse(null);
        } else if ("natural".equalsIgnoreCase(patrimonio.getTipo())) {
            natural = patrimonioNaturalRepository.findById(id).orElse(null);
        }

        return PatrimonioMapper.toDetalleResponse(patrimonio, cultural, natural);
    }

    @Transactional(readOnly = true)
    public GastronomiaProvinciaResponse getGastronomiaByProvincia(Integer provinciaId) {
        ProvinciaEntity provincia = getProvinciaEntity(provinciaId);
        List<com.tfm.patrimonio.controller.model.GastronomiaResponse> platos = gastronomiaRepository
                .findByProvinciaIdOrderByNombre(provinciaId)
                .stream()
                .map(PatrimonioMapper::toGastronomiaResponse)
                .toList();

        return new GastronomiaProvinciaResponse(PatrimonioMapper.toProvinciaResponse(provincia), platos);
    }

    @Transactional(readOnly = true)
    public ClimaProvinciaResponse getClimaByProvincia(Integer provinciaId) {
        ProvinciaEntity provincia = getProvinciaEntity(provinciaId);
        List<com.tfm.patrimonio.controller.model.ClimaResponse> clima = climaRepository
                .findByProvinciaIdOrderById(provinciaId)
                .stream()
                .map(PatrimonioMapper::toClimaResponse)
                .toList();

        return new ClimaProvinciaResponse(PatrimonioMapper.toProvinciaResponse(provincia), clima);
    }

    @Transactional
    public PatrimonioGeneralResponse updateValoracion(Integer patrimonioId, BigDecimal valoracionEntrante) {
        if (valoracionEntrante == null) {
            throw new IllegalArgumentException("La valoracion es obligatoria");
        }
        if (valoracionEntrante.compareTo(VALORACION_MINIMA) < 0 || valoracionEntrante.compareTo(VALORACION_MAXIMA) > 0) {
            throw new IllegalArgumentException("La valoracion debe estar entre 0 y 10");
        }

        PatrimonioEntity patrimonio = getPatrimonioEntity(patrimonioId);
        BigDecimal nuevaValoracion = patrimonio.getValoracion()
                .multiply(PESO_VALOR_ANTERIOR)
                .add(valoracionEntrante.multiply(PESO_VALOR_ENTRANTE))
                .setScale(2, RoundingMode.HALF_UP);

        patrimonio.setValoracion(nuevaValoracion);
        return PatrimonioMapper.toGeneralResponse(patrimonioRepository.save(patrimonio));
    }

    private PatrimonioEntity getPatrimonioEntity(Integer id) {
        return patrimonioRepository.findByIdWithProvincia(id)
                .orElseThrow(() -> new ResourceNotFoundException("No existe patrimonio con id " + id));
    }

    private ProvinciaEntity getProvinciaEntity(Integer id) {
        return provinciaRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("No existe provincia con id " + id));
    }

    private static Specification<PatrimonioEntity> inIds(List<Integer> values) {
        if (values == null) {
            return null;
        }
        return (root, query, criteriaBuilder) -> root.get("id").in(values);
    }

    private static Specification<PatrimonioEntity> greaterThanOrEqualTo(String field, BigDecimal value) {
        if (value == null) {
            return null;
        }
        return (root, query, criteriaBuilder) -> criteriaBuilder.greaterThanOrEqualTo(root.get(field), value);
    }

    private static Specification<PatrimonioEntity> equalLowercase(String field, String value) {
        if (value == null) {
            return null;
        }
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(criteriaBuilder.lower(root.get(field)), value);
    }

    private static Specification<PatrimonioEntity> likeValue(String field, String value) {
        if (value == null) {
            return null;
        }
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(
                criteriaBuilder.lower(root.get(field)),
                "%" + value + "%");
    }

    private static Specification<PatrimonioEntity> likeAny(String field, List<String> values) {
        if (values == null) {
            return null;
        }
        return (root, query, criteriaBuilder) -> criteriaBuilder.or(values.stream()
                .map(value -> criteriaBuilder.like(criteriaBuilder.lower(root.get(field)), "%" + value + "%"))
                .toArray(jakarta.persistence.criteria.Predicate[]::new));
    }

    private static Specification<PatrimonioEntity> likeAnyProvincia(String field, List<String> values) {
        if (values == null) {
            return null;
        }
        return (root, query, criteriaBuilder) -> criteriaBuilder.or(values.stream()
                .map(value -> criteriaBuilder.like(
                        criteriaBuilder.lower(root.get("provincia").get(field)),
                        "%" + value + "%"))
                .toArray(jakarta.persistence.criteria.Predicate[]::new));
    }

    private static List<String> cleanValues(List<String> values) {
        values = splitCsv(values);
        if (values == null) {
            return null;
        }
        List<String> cleanedValues = values.stream()
                .filter(value -> !value.isBlank())
                .map(value -> value.trim().toLowerCase(Locale.ROOT))
                .toList();
        return cleanedValues.isEmpty() ? null : cleanedValues;
    }

    private static List<Integer> parseIntegers(List<String> values) {
        values = splitCsv(values);
        if (values == null) {
            return null;
        }
        return values.stream()
                .map(String::trim)
                .filter(value -> !value.isBlank())
                .map(Integer::valueOf)
                .toList();
    }

    private static List<BigDecimal> parseBigDecimals(List<String> values) {
        values = splitCsv(values);
        if (values == null) {
            return null;
        }
        return values.stream()
                .map(String::trim)
                .filter(value -> !value.isBlank())
                .map(BigDecimal::new)
                .toList();
    }

    private static String firstCleanValue(List<String> values) {
        values = cleanValues(values);
        if (values == null) {
            return null;
        }
        return values.getFirst();
    }

    private static BigDecimal firstBigDecimal(List<String> values) {
        List<BigDecimal> parsedValues = parseBigDecimals(values);
        if (parsedValues == null) {
            return null;
        }
        return parsedValues.getFirst();
    }

    private static List<String> splitCsv(List<String> values) {
        if (values == null) {
            return null;
        }
        List<String> splitValues = values.stream()
                .flatMap(value -> java.util.Arrays.stream(value.split(",")))
                .map(String::trim)
                .filter(value -> !value.isBlank())
                .toList();
        return splitValues.isEmpty() ? null : splitValues;
    }

    private static Specification<PatrimonioEntity> buildSpecification(
            List<Specification<PatrimonioEntity>> specifications) {
        Specification<PatrimonioEntity> result = null;

        for (Specification<PatrimonioEntity> specification : specifications) {
            if (specification == null) {
                continue;
            }
            result = result == null ? specification : result.and(specification);
        }

        return result;
    }
}
