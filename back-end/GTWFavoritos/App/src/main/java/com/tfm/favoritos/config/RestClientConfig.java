package com.tfm.favoritos.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestClient;

@Configuration
public class RestClientConfig {

    @Bean
    public RestClient patrimonioRestClient(@Value("${patrimonio.service.url}") String patrimonioServiceUrl) {
        return RestClient.builder()
                .baseUrl(patrimonioServiceUrl)
                .build();
    }
}
