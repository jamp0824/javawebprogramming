package com.spring.web.model;

public class BirthVO {

	private String year;
	private String month;
	private String day;
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		System.out.println("setYear() 호출됨");
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		System.out.println("setMonth() 호출됨");
		
		if(Integer.parseInt(month) <10) {
			this.month = "0"+month;
		}
		this.month = month;
	}
	public String getDay() {
		System.out.println("setDay() 호출됨");
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
	
}
