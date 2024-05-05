package com.lynmarket;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

//@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class}) //db 설정 안보겠다
@ComponentScan(basePackages = "com.lynmarket") //패키지 아래에 있는 스프링빈들을 탐색 
@SpringBootApplication // spring 구동을 위한 필수 어노테이션
public class LynmarketApplication {

	public static void main(String[] args) {
		SpringApplication.run(LynmarketApplication.class, args);
	}

}
