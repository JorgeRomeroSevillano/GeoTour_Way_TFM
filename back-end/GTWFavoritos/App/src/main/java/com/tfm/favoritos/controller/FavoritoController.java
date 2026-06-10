package com.tfm.favoritos.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tfm.favoritos.controller.model.FavoritoRequest;
import com.tfm.favoritos.controller.model.FavoritosResponse;
import com.tfm.favoritos.service.FavoritoService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/favoritos")
@RequiredArgsConstructor
public class FavoritoController {

    private final FavoritoService favoritoService;

    @GetMapping
    public ResponseEntity<FavoritosResponse> getFavoritos() {
        return ResponseEntity.ok(favoritoService.getFavoritos());
    }

    @PostMapping
    public ResponseEntity<FavoritosResponse> addFavorito(@RequestBody FavoritoRequest request) {
        if (request == null) {
            throw new IllegalArgumentException("El idPatrimonio es obligatorio");
        }
        return ResponseEntity.ok(favoritoService.addFavorito(request.idPatrimonio()));
    }

    @DeleteMapping("/{idPatrimonio}")
    public ResponseEntity<FavoritosResponse> deleteFavorito(@PathVariable Integer idPatrimonio) {
        return ResponseEntity.ok(favoritoService.deleteFavorito(idPatrimonio));
    }

    @DeleteMapping
    public ResponseEntity<FavoritosResponse> deleteFavoritos() {
        return ResponseEntity.ok(favoritoService.deleteFavoritos());
    }
}
