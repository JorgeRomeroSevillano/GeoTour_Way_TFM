package com.tfm.patrimonio.data.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.MapsId;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "patrimonio_cultural")
public class PatrimonioCulturalEntity {

    @Id
    private Integer id;

    @OneToOne
    @MapsId
    @JoinColumn(name = "id")
    private PatrimonioEntity patrimonio;

    @Column(nullable = false, length = 50)
    private String epoca;

    @Column(nullable = false, length = 50)
    private String anio;

    public Integer getId() {
        return id;
    }

    public String getEpoca() {
        return epoca;
    }

    public String getAnio() {
        return anio;
    }
}
