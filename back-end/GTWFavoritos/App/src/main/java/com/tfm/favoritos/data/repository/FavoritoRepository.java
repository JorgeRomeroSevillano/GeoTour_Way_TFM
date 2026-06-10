package com.tfm.favoritos.data.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tfm.favoritos.data.model.FavoritoEntity;

public interface FavoritoRepository extends JpaRepository<FavoritoEntity, Integer> {

    boolean existsByIdPatrimonio(Integer idPatrimonio);

    void deleteByIdPatrimonio(Integer idPatrimonio);

    List<FavoritoEntity> findAllByOrderByIdPatrimonioAsc();
}
