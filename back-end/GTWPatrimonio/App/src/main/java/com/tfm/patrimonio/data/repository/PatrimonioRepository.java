package com.tfm.patrimonio.data.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tfm.patrimonio.data.model.PatrimonioEntity;

public interface PatrimonioRepository extends JpaRepository<PatrimonioEntity, Integer>,
        JpaSpecificationExecutor<PatrimonioEntity> {

    @Query("""
            select p
            from PatrimonioEntity p
            join fetch p.provincia
            where p.id = :id
            """)
    java.util.Optional<PatrimonioEntity> findByIdWithProvincia(@Param("id") Integer id);
}
