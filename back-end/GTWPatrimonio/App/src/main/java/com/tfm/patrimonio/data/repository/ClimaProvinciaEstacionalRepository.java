package com.tfm.patrimonio.data.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tfm.patrimonio.data.model.ClimaProvinciaEstacionalEntity;

public interface ClimaProvinciaEstacionalRepository extends JpaRepository<ClimaProvinciaEstacionalEntity, Integer> {

    List<ClimaProvinciaEstacionalEntity> findByProvinciaIdOrderById(Integer provinciaId);
}
