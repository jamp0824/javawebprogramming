package com.spring.basic;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {

		/*
		 * Chef chef = new Chef(); Restaurant res = new Restaurant(chef); Hotel hotel
		 * =new Hotel(res); hotel.reserveRestaurant();
		 */
		
		GenericXmlApplicationContext ct = new GenericXmlApplicationContext("classpath:test-configure.xml");
		
		Hotel hotel = ct.getBean("hotel",Hotel.class);
		hotel.reserveRestaurant();
		
	}

}
