package com.tfm.patrimonio.data.utils;

import com.tfm.patrimonio.controller.model.ClimaResponse;
import com.tfm.patrimonio.controller.model.GastronomiaResponse;
import com.tfm.patrimonio.controller.model.PatrimonioCulturalResponse;
import com.tfm.patrimonio.controller.model.PatrimonioDetalleResponse;
import com.tfm.patrimonio.controller.model.PatrimonioGeneralResponse;
import com.tfm.patrimonio.controller.model.PatrimonioNaturalResponse;
import com.tfm.patrimonio.controller.model.ProvinciaResponse;
import com.tfm.patrimonio.data.model.ClimaProvinciaEstacionalEntity;
import com.tfm.patrimonio.data.model.GastronomiaEntity;
import com.tfm.patrimonio.data.model.PatrimonioCulturalEntity;
import com.tfm.patrimonio.data.model.PatrimonioEntity;
import com.tfm.patrimonio.data.model.PatrimonioNaturalEntity;
import com.tfm.patrimonio.data.model.ProvinciaEntity;

public final class PatrimonioMapper {

    private PatrimonioMapper() {
    }

    public static ProvinciaResponse toProvinciaResponse(ProvinciaEntity provincia) {
        return new ProvinciaResponse(provincia.getId(), provincia.getNombre(), provincia.getComunidad());
    }

    public static PatrimonioGeneralResponse toGeneralResponse(PatrimonioEntity patrimonio) {
        return new PatrimonioGeneralResponse(
                patrimonio.getId(),
                patrimonio.getNombre(),
                patrimonio.getDescripcion(),
                patrimonio.getUrlImagen(),
                patrimonio.getTipo(),
                patrimonio.getValoracion(),
                patrimonio.getLocalidad(),
                patrimonio.getCodIne(),
                patrimonio.getLatitud(),
                patrimonio.getLongitud(),
                toProvinciaResponse(patrimonio.getProvincia()));
    }

    public static PatrimonioDetalleResponse toDetalleResponse(
            PatrimonioEntity patrimonio,
            PatrimonioCulturalEntity cultural,
            PatrimonioNaturalEntity natural) {
        return new PatrimonioDetalleResponse(
                patrimonio.getId(),
                patrimonio.getNombre(),
                patrimonio.getDescripcion(),
                patrimonio.getUrlImagen(),
                patrimonio.getTipo(),
                patrimonio.getValoracion(),
                patrimonio.getLocalidad(),
                patrimonio.getCodIne(),
                patrimonio.getLatitud(),
                patrimonio.getLongitud(),
                toProvinciaResponse(patrimonio.getProvincia()),
                cultural == null ? null : new PatrimonioCulturalResponse(cultural.getEpoca(), cultural.getAnio()),
                natural == null ? null : new PatrimonioNaturalResponse(natural.getEcosistema(), natural.getExtension()));
    }

    public static GastronomiaResponse toGastronomiaResponse(GastronomiaEntity gastronomia) {
        return new GastronomiaResponse(
                gastronomia.getId(),
                gastronomia.getNombre(),
                gastronomia.getUrlImagen(),
                gastronomia.getDescripcion());
    }

    public static ClimaResponse toClimaResponse(ClimaProvinciaEstacionalEntity clima) {
        return new ClimaResponse(
                clima.getId(),
                clima.getEstacion(),
                clima.getTemMin(),
                clima.getTemMax(),
                clima.getPrecipitacionMedia());
    }
}
