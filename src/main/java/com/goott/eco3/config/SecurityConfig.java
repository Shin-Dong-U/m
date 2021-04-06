package com.goott.eco3.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.goott.eco3.security.CustLoginFailHandler;
import com.goott.eco3.security.CustomLoginSuccessHandler;
import com.goott.eco3.security.CustomUserDetailsService;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Setter(onMethod_ = {@Autowired})
	private DataSource dataSource;
	
	/* Login Success Handler */
	@Bean
	public AuthenticationSuccessHandler loginSuccessHandler() {
		return new CustomLoginSuccessHandler("/home/index");
	}
	
	/* password Encoder */
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	/* Login Fail Handler */
	@Bean
	public AuthenticationFailureHandler CustLoginFailHandler() {
		return new CustLoginFailHandler();
	}
	
	/* Access Denied Handler */
//	@Bean
	//public AccessDeniedHandler accessDeniedHandler() {
	//	return new CustomAccessDeniedHandler();	
	//}
	
	/* user Detail Service 실행 */
	@Bean
	public UserDetailsService cusomUserServcie() {
		return new CustomUserDetailsService();
	}
	
	/* remember-me */
	private PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}
	
	/* Authentication */
	@Override
	public void configure(HttpSecurity http) throws Exception{
		http.authorizeRequests()
			.antMatchers("/home/login").anonymous()
			.antMatchers("/home/register").anonymous();
			

		http.authorizeRequests()
			.antMatchers("/cust/account").authenticated()
			.antMatchers("/orders/basket/list").authenticated()
			.antMatchers("/orders/order/checkout").authenticated()
			.antMatchers("/home/my-account-order").authenticated()
			.antMatchers("/orders/ship/writeShipInfo").authenticated()
			.antMatchers("/orders/order/orderCheck").authenticated()
			.antMatchers("/orders/basket/wishlist").authenticated()
			.antMatchers("/cust/my-account").authenticated();
			
			//.antMatchers("/order/list").authenticated();
			//.exceptionHandling().accessDeniedHandler(accessDeniedHandler())		
			//.antMatchers("/orders/ship/writeShipInfo").authenticated()
			//.antMatchers("/orders/order/orderCheck").authenticated()
			//.antMatchers("/orders/basket/list").authenticated()
			//.antMatchers("/cust/account","/cust/account1").authenticated();
			//.antMatchers("/order/list").authenticated();
			//.exceptionHandling().accessDeniedHandler(accessDeniedHandler())


		/* 로그인 */
		http.formLogin()
			.loginPage("/home/login")
			.loginProcessingUrl("/home/login")
			.failureUrl("/home/login?error=true")
			.successHandler(loginSuccessHandler())
			.failureHandler(CustLoginFailHandler())
			.usernameParameter("username")
			.passwordParameter("password");
		
		/* 로그아웃 */
		http.logout()
			.logoutUrl("/sample/logout")
			.logoutSuccessUrl("/home/index")
			.invalidateHttpSession(true)
			.deleteCookies("remember-me","JSESSION_ID");
		
		/* 자동로그인 */
		http.rememberMe()
			.key("goott")
			.tokenRepository(persistentTokenRepository())
			.tokenValiditySeconds(604800);
		
		/* naver smart editor 설정 */
		http.headers().frameOptions().sameOrigin();
		http.csrf()
	        .ignoringAntMatchers("/goods/rest/**")
	        .and();
//		http.csrf().disable();
	}

	/* Authorization */
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
		log.info("security Config 실행....");
		auth.userDetailsService(cusomUserServcie()).passwordEncoder(passwordEncoder());	
	}

	
	/* BCrypt하기전 Authorization */
	/*
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
		log.info("configure................");

		auth.inMemoryAuthentication().withUser("admin").password("{noop}admin").roles("ADMIN");
		auth.inMemoryAuthentication().withUser("member").password("{noop}member").roles("MEMBER");
	
	}
	 */


}
