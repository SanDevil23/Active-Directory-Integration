package com.anand;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
@RequestMapping("/api")
public class SpringBootAzureAuthApp {

	@GetMapping("/login")
	public String welcome(){
		return "Spring Boot + Azure Active Directory auth example !!! DEMO";
	}

	public static void main(String[] args) {
		SpringApplication.run(SpringBootAzureAuthApp.class, args);
        System.out.println("Project Started. Check for browser");
	}

}