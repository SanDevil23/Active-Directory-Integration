/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Sheshadhri Iyer
 */
package com.anand;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;
//import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig {

	@Autowired private DataSource dataSource;

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		return bCryptPasswordEncoder;
	}

	/** Ignore these folders and allow the spring boot app to read files from these */
	/** *************************************************************************** */
	@Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
		System.out.println("Web Security Configuration");
        return (web) -> web.ignoring().antMatchers("/images/**","/plugins/**","/dist/**","/usedStaticFiles/**");
    }

	/** Basic Project Configuration which will affect the basic mapping load of the project */
	/** *********************************************************************************** */
	// @Bean
	// protected SecurityFilterChain httpSecurityConfig(HttpSecurity http) throws Exception {
	// 	System.out.println("Basic Project Configuration");
	// 	http.headers().cacheControl().disable();
	// 	http
	// 		.headers().frameOptions().disable()
	// 		.and().authorizeRequests().antMatchers("/","/login","/signup","/registerUser","/signup-verification",
	// 				"/checkUserExists","/session-timeout","/deny","/forgot-password").permitAll()
	// 		.anyRequest().authenticated()
	// 		.and().formLogin().loginPage("/login").failureUrl("/login?error=true")
	// 		.defaultSuccessUrl("/main").permitAll()
	// 		.usernameParameter("email")
	// 		.passwordParameter("password")
	// 		/** ********************* */
	// 		/** logout configuration* */
	// 		/*.and().logout()
	// 		.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
	// 		.logoutSuccessUrl("/")*/
	// 		/** ********************* */
	// 		.successHandler(new SuccessLoginHandler())
	// 		/*.and().logout().logoutSuccessUrl("/logoutPage")*/
	// 		.and().exceptionHandling().accessDeniedPage("/deny")
	// 		.and().rememberMe().rememberMeParameter("remember-me")
	// 		.tokenRepository(persistentTokenRepository()).tokenValiditySeconds(60*60)
	// 		.and().exceptionHandling().accessDeniedPage("/deny");

	// 	//http.sessionManagement().maximumSessions(1).expiredUrl("/deny");
	// 	/*http.sessionManagement().invalidSessionUrl("/")*/
	// 	http.sessionManagement().maximumSessions(1);

		/*Cross-Site Request Forgery*/
	// 	http.csrf().disable();
		
	// 	return http.build();
	// }

	/** Used to store the persistent login tokens for a user. */
	/** ***************************************************** */
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		System.out.println("Persistent Token Repository");
		JdbcTokenRepositoryImpl tokenRepository = new JdbcTokenRepositoryImpl();
		tokenRepository.setDataSource(dataSource);
		return tokenRepository;
	}

	@Bean
    public UserDetailsManager users(DataSource dataSource) {
		System.out.println("User Detail Configuration");
        JdbcUserDetailsManager users = new JdbcUserDetailsManager(dataSource);
        users.setUsersByUsernameQuery("select user_login_id as username, user_password as password, user_active as enable from m_user where user_login_id = ?");
        users.setAuthoritiesByUsernameQuery("select ium.user_login_id as username, irm.role_name as role from m_user ium "
				   + "join m_user_role_map iurm on iurm.m_user_id = ium.m_user_id "
				   + "join m_role irm on irm.m_role_id = iurm.m_role_id "
				   + "where ium.user_login_id = ?");
        return users;
    }

	/** Setup Manual EntityManagerFactory */
	/** ********************************* */
	/** Just Kept for reference */
	/*@Bean(name="entityManagerFactory")
	public LocalSessionFactoryBean sessionFactory() {
	    LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
	    return sessionFactory;
	} */
}
