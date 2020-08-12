package com.spring.basic.ex02;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		/*
		 * DataBaseInfo dbInfo = new DataBaseInfo(); dbInfo.setUid("week");
		 * dbInfo.setUpw("week"); dbInfo.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		 */
		
		GenericXmlApplicationContext ct = 
				new GenericXmlApplicationContext("classpath:db-config.xml");
		DataBaseInfo db1 =ct.getBean("db1",DataBaseInfo.class);
		System.out.println("URL:"+db1.getUrl());
		System.out.println("URL:"+db1.getUid());
		System.out.println("URL:"+db1.getUpw());
		
		System.out.println("--------------------------");
		
		MemberDAO dao = new MemberDAO();
		dao.setDbInfo(db1);
		dao.showDBInfo();
	}

}
