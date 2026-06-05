package com.tfm.patrimonio.controller.model;

import java.math.BigDecimal;

public record PatrimonioDetalleResponse(
        Integer id,
        String nombre,
        String descripcion,
        String urlImagen,
        String tipo,
        BigDecimal valoracion,
        String localidad,
        String codIne,
        BigDecimal latitud,
        BigDecimal longitud,
        ProvinciaResponse provincia,
        PatrimonioCulturalResponse cultural,
        PatrimonioNaturalResponse natural) {
}
