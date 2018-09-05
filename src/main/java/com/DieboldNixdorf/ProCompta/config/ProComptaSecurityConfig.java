package com.DieboldNixdorf.ProCompta.config;
 
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
 
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
 

@Configuration
@EnableWebSecurity
 
public class ProComptaSecurityConfig extends WebSecurityConfigurerAdapter {

	
	 @Autowired
	    @Qualifier("customUserDetailsService")
	    UserDetailsService userDetailsService;
	 
	 @Autowired
	 PersistentTokenRepository tokenRepository;
	
	// add a reference to our security data source
	@Autowired
	private DataSource securityDataSource;
	
	
	 //authentifaction from the data base based on name , password , role 
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		 auth.jdbcAuthentication().dataSource(securityDataSource)
		 .usersByUsernameQuery(
		 "select username,password, enabled from account where username=?")
				  .authoritiesByUsernameQuery(
		 " select  username , role_name from account_role AR " + 
		 " inner join role R on R.role_id = AR.role_id "+
		  " where username=?");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
			.antMatchers("/").hasRole("EMPLOYEE")
		.and()
			.formLogin()
				.loginPage("/showMyLoginPage")
				.loginProcessingUrl("/authenticateTheUser")
				.permitAll()
		.and()
			.logout().permitAll()
		.and()
			.exceptionHandling().accessDeniedPage("/access-denied");
		
	}
	
	@Bean
	public UserDetailsManager userDetailsManager() {
		
		JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager();
		
		jdbcUserDetailsManager.setDataSource(securityDataSource);
		
		return jdbcUserDetailsManager; 
	}
		
}






