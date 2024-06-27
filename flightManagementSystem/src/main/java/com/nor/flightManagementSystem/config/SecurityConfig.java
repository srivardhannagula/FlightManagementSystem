package com.nor.flightManagementSystem.config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.session.SessionManagementFilter;

import com.nor.flightManagementSystem.dao.AirportDaoImpl;
import com.nor.flightManagementSystem.service.FlightUserService;
 
@SuppressWarnings("deprecation")
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	private FlightUserService service;
	 
	
	@Autowired
	private EncoderConfig config;
	
	@Autowired
	@Override
	protected void configure(AuthenticationManagerBuilder authority) throws Exception {
			authority.userDetailsService(service).passwordEncoder(config.passwordEncoder());
	}
	@Override
	public void configure(HttpSecurity http) throws Exception{
	http.authorizeRequests().antMatchers("/register").permitAll().anyRequest().authenticated().and().formLogin().loginPage("/loginpage")
	.failureUrl("/loginerror").loginProcessingUrl("/login")
	.permitAll().and().logout().logoutSuccessUrl("/index");
 http.csrf().disable();		
	}
	 
	
}