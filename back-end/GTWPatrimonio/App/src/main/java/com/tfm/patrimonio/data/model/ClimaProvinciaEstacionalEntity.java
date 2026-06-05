package com.tfm.patrimonio.data.model;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "clima_provincia_estacional")
public class ClimaProvinciaEstacionalEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, length = 20)
    private String estacion;

    @Column(name = "tem_min", nullable = false, precision = 4, scale = 1)
    private BigDecimal temMin;

    @Column(name = "tem_max", nullable = false, precision = 4, scale = 1)
    private BigDecimal temMax;

    @Column(name = "precipitacion_media", nullable = false, precision = 6, scale = 2)
    private BigDecimal precipitacionMedia;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_provincia", nullable = false)
    private ProvinciaEntity provincia;
}
