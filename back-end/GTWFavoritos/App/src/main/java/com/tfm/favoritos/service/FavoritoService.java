package com.tfm.favoritos.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tfm.favoritos.controller.model.FavoritosResponse;
import com.tfm.favoritos.data.model.FavoritoEntity;
import com.tfm.favoritos.data.repository.FavoritoRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FavoritoService {

    private final FavoritoRepository favoritoRepository;
    private final PatrimonioClient patrimonioClient;

    @Transactional(readOnly = true)
    public FavoritosResponse getFavoritos() {
        List<Integer> idsPatrimonio = favoritoRepository.findAllByOrderByIdPatrimonioAsc()
                .stream()
                .map(FavoritoEntity::getIdPatrimonio)
                .toList();

        return new FavoritosResponse(idsPatrimonio);
    }

    @Transactional
    public FavoritosResponse addFavorito(Integer idPatrimonio) {
        validarIdPatrimonio(idPatrimonio);

        if (!patrimonioClient.existePatrimonio(idPatrimonio)) {
            throw new ResourceNotFoundException("No existe patrimonio con id " + idPatrimonio);
        }

        if (!favoritoRepository.existsByIdPatrimonio(idPatrimonio)) {
            FavoritoEntity favorito = new FavoritoEntity();
            favorito.setIdPatrimonio(idPatrimonio);
            favoritoRepository.save(favorito);
        }

        return getFavoritos();
    }

    @Transactional
    public FavoritosResponse deleteFavorito(Integer idPatrimonio) {
        validarIdPatrimonio(idPatrimonio);

        if (!favoritoRepository.existsByIdPatrimonio(idPatrimonio)) {
            throw new ResourceNotFoundException("No existe favorito con idPatrimonio " + idPatrimonio);
        }

        favoritoRepository.deleteByIdPatrimonio(idPatrimonio);
        return getFavoritos();
    }

    @Transactional
    public FavoritosResponse deleteFavoritos() {
        favoritoRepository.deleteAll();
        return getFavoritos();
    }

    private static void validarIdPatrimonio(Integer idPatrimonio) {
        if (idPatrimonio == null || idPatrimonio <= 0) {
            throw new IllegalArgumentException("El idPatrimonio debe ser mayor que 0");
        }
    }
}
