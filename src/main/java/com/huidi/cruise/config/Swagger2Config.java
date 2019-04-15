package com.huidi.cruise.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class Swagger2Config {
    /**
     * create Rest Api description
     * @return api
     */
    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()                       //按条件指定生成文档接口
                .paths(PathSelectors.any())
                .build();
    }
    /**
     * api description
     * @return api information
     */
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("cruise_management")
                .description("cruise_management system restful api")
                .version("1.0")
                .build();
    }
}
