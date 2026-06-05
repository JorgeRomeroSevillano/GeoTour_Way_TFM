package com.tfm.patrimonio.data.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tfm.patrimonio.data.model.PatrimonioNaturalEntity;

public interface PatrimonioNaturalRepository extends JpaRepository<PatrimonioNaturalEntity, Integer> {
}
