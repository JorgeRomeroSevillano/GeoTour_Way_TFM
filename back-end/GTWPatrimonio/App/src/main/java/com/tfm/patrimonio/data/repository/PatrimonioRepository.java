package com.tfm.patrimonio.data.repository;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tfm.patrimonio.data.model.PatrimonioEntity;

public interface PatrimonioRepository extends JpaRepository<PatrimonioEntity, Integer> {

    @Query("""
            select p
            from PatrimonioEntity p
            join fetch p.provincia provincia
            where (:id is null or p.id = :id)
              and (:nombre is null or lower(p.nombre) like lower(concat('%', :nombre, '%')))
              and (:tipo is null or lower(p.tipo) = lower(:tipo))
              and (:valoracion is null or p.valoracion >= :valoracion)
              and (:localidad is null or lower(p.localidad) like lower(concat('%', :localidad, '%')))
              and (:provincia is null or lower(provincia.nombre) like lower(concat('%', :provincia, '%')))
              and (:comunidad is null or lower(provincia.comunidad) like lower(concat('%', :comunidad, '%')))
            order by p.nombre
            """)
    List<PatrimonioEntity> findByFilters(
            @Param("id") Integer id,
            @Param("nombre") String nombre,
            @Param("tipo") String tipo,
            @Param("valoracion") BigDecimal valoracion,
            @Param("localidad") String localidad,
            @Param("provincia") String provincia,
            @Param("comunidad") String comunidad);

    @Query("""
            select p
            from PatrimonioEntity p
            join fetch p.provincia
            where p.id = :id
            """)
    java.util.Optional<PatrimonioEntity> findByIdWithProvincia(@Param("id") Integer id);
}
