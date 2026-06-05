package com.tfm.patrimonio.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

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

@Service
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

    public PatrimonioService(
            PatrimonioRepository patrimonioRepository,
            PatrimonioCulturalRepository patrimonioCulturalRepository,
            PatrimonioNaturalRepository patrimonioNaturalRepository,
            ProvinciaRepository provinciaRepository,
            GastronomiaRepository gastronomiaRepository,
            ClimaProvinciaEstacionalRepository climaRepository) {
        this.patrimonioRepository = patrimonioRepository;
        this.patrimonioCulturalRepository = patrimonioCulturalRepository;
        this.patrimonioNaturalRepository = patrimonioNaturalRepository;
        this.provinciaRepository = provinciaRepository;
        this.gastronomiaRepository = gastronomiaRepository;
        this.climaRepository = climaRepository;
    }

    @Transactional(readOnly = true)
    public List<PatrimonioGeneralResponse> getPatrimonios(
            Integer id,
            String nombre,
            String tipo,
            BigDecimal valoracion,
            String localidad,
            String provincia,
            String comunidad) {
        return patrimonioRepository.findByFilters(
                        id,
                        clean(nombre),
                        clean(tipo),
                        valoracion,
                        clean(localidad),
                        clean(provincia),
                        clean(comunidad))
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

    private static String clean(String value) {
        if (value == null || value.isBlank()) {
            return null;
        }
        return value.trim();
    }
}
