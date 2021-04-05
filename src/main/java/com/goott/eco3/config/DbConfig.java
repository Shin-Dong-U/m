package com.goott.eco3.config;

import javax.sql.DataSource;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@MapperScan(basePackages= {"com.goott.eco3.mapper"})

@Configuration
public class DbConfig {
	
	@Autowired private DataSource ds;
	
	@Bean
	public PlatformTransactionManager txManager() throws Exception{
		return new DataSourceTransactionManager(ds);
	}
}
