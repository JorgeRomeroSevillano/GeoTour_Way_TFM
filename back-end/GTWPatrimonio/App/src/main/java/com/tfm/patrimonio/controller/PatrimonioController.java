package com.tfm.patrimonio.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tfm.patrimonio.controller.model.ClimaProvinciaResponse;
import com.tfm.patrimonio.controller.model.GastronomiaProvinciaResponse;
import com.tfm.patrimonio.controller.model.PatrimonioDetalleResponse;
import com.tfm.patrimonio.controller.model.PatrimonioGeneralResponse;
import com.tfm.patrimonio.controller.model.ValoracionPatchRequest;
import com.tfm.patrimonio.service.PatrimonioService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping
@RequiredArgsConstructor
public class PatrimonioController {

    private final PatrimonioService patrimonioService;

    @GetMapping("/patrimonios")
    public ResponseEntity<List<PatrimonioGeneralResponse>> getPatrimonios(
            @RequestParam(required = false) List<String> ids,
            @RequestParam(required = false) List<String> nombre,
            @RequestParam(required = false) List<String> tipo,
            @RequestParam(required = false) List<String> valoracion,
            @RequestParam(required = false) List<String> localidades,
            @RequestParam(required = false) List<String> provincias,
            @RequestParam(required = false) List<String> comunidades) {
        return ResponseEntity.ok(patrimonioService.getPatrimonios(
                ids,
                nombre,
                tipo,
                valoracion,
                localidades,
                provincias,
                comunidades));
    }

    @GetMapping("/patrimonios/{id}")
    public ResponseEntity<PatrimonioDetalleResponse> getPatrimonioDetalle(@PathVariable Integer id) {
        return ResponseEntity.ok(patrimonioService.getPatrimonioDetalle(id));
    }

    @GetMapping("/provincias/{provinciaId}/gastronomia")
    public ResponseEntity<GastronomiaProvinciaResponse> getGastronomiaByProvincia(@PathVariable Integer provinciaId) {
        return ResponseEntity.ok(patrimonioService.getGastronomiaByProvincia(provinciaId));
    }

    @GetMapping("/provincias/{provinciaId}/clima")
    public ResponseEntity<ClimaProvinciaResponse> getClimaByProvincia(@PathVariable Integer provinciaId) {
        return ResponseEntity.ok(patrimonioService.getClimaByProvincia(provinciaId));
    }

    @PatchMapping("/patrimonios/{id}/valoracion")
    public ResponseEntity<PatrimonioGeneralResponse> updateValoracion(
            @PathVariable Integer id,
            @RequestBody ValoracionPatchRequest request) {
        if (request == null) {
            throw new IllegalArgumentException("La valoracion es obligatoria");
        }
        return ResponseEntity.ok(patrimonioService.updateValoracion(id, request.valoracion()));
    }
}
