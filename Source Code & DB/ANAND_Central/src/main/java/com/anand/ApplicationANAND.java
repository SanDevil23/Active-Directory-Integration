package com.anand;

import org.springframework.boot.SpringApplication;		
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;


@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
@SpringBootApplication
@Controller
public class ApplicationANAND extends SpringBootServletInitializer {


	@RequestMapping("/webapp/dashboard.jsp")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("dashboard");
		return mv;
	}

	public static void main(String[] args) {
		SpringApplication.run(ApplicationANAND.class, args);
		System.out.println("Project Started.");
	}
}
