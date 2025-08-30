package com.xypay.xypay;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class XypayApplication {

	public static void main(String[] args) {
		SpringApplication app = new SpringApplication(XypayApplication.class);
		app.run(args);
	}

}