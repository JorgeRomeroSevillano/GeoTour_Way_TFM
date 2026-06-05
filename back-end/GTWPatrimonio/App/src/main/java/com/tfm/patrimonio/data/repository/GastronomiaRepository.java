package com.tfm.patrimonio.data.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tfm.patrimonio.data.model.GastronomiaEntity;

public interface GastronomiaRepository extends JpaRepository<GastronomiaEntity, Integer> {

    List<GastronomiaEntity> findByProvinciaIdOrderByNombre(Integer provinciaId);
}
