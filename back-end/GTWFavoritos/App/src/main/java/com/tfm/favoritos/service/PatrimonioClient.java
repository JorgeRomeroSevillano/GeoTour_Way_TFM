package com.tfm.favoritos.service;

import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class PatrimonioClient {

    private final RestClient patrimonioRestClient;

    public boolean existePatrimonio(Integer idPatrimonio) {
        List<Object> patrimonios = patrimonioRestClient.get()
                .uri(uriBuilder -> uriBuilder.path("/patrimonios")
                        .queryParam("ids", idPatrimonio)
                        .build())
                .retrieve()
                .body(new ParameterizedTypeReference<>() {
                });

        return patrimonios != null && !patrimonios.isEmpty();
    }
}
