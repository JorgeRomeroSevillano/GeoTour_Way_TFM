package com.tfm.patrimonio.controller.model;

import java.util.List;

public record GastronomiaProvinciaResponse(
        ProvinciaResponse provincia,
        List<GastronomiaResponse> platos) {
}
