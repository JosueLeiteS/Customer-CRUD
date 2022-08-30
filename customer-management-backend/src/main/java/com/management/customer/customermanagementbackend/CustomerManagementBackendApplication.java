package com.management.customer.customermanagementbackend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class CustomerManagementBackendApplication {

  public static void main(String[] args) {
    SpringApplication.run(CustomerManagementBackendApplication.class, args);
  }

  @Bean
  public WebMvcConfigurer corsConfigurer() {
    return new WebMvcConfigurer() {
      @Override
      public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**").allowedOrigins("http://localhost:4200/").allowedMethods("GET", "PUT", "POST",
            "DELETE", "PATCH", "OPTIONS", "HEAD");
      }
    };

  }

}
