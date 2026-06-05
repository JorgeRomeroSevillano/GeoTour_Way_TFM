package com.tfm.patrimonio.data.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tfm.patrimonio.data.model.PatrimonioCulturalEntity;

public interface PatrimonioCulturalRepository extends JpaRepository<PatrimonioCulturalEntity, Integer> {
}
