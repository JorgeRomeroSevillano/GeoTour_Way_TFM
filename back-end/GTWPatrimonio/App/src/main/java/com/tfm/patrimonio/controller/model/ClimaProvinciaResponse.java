package com.tfm.patrimonio.controller.model;

import java.util.List;

public record ClimaProvinciaResponse(
        ProvinciaResponse provincia,
        List<ClimaResponse> clima) {
}
