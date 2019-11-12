package com.want2play.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

@SpringBootApplication
@EnableZuulProxy
@EnableDiscoveryClient
public class Want2PlayGatewayApplication {

	public static void main(String[] args) {
		SpringApplication.run(Want2PlayGatewayApplication.class, args);
	}

}
