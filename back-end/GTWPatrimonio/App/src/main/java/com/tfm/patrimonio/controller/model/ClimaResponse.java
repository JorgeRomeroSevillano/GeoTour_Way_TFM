package com.tfm.patrimonio.controller.model;

import java.math.BigDecimal;

public record ClimaResponse(
        Integer id,
        String estacion,
        BigDecimal temMin,
        BigDecimal temMax,
        BigDecimal precipitacionMedia) {
}
