package com.project.myurlshortener;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EntityScan(basePackages = {"com.project.myurlshortener.entity"})
@SpringBootApplication
public class MyUrlShortenerApplication {

	public static void main(String[] args) {
		SpringApplication.run(MyUrlShortenerApplication.class, args);
	}

}
