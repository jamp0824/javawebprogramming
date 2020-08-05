
<%@page import="kr.co.koo.jdbc.user.model.*"%>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	UserDAO dao=UserDAO.getInstance();
	List<UserVO> userList = dao.userSelectAll();
	
	for(UserVO user:userList){
		String name = user.getName();
		String id = user.getId();
		String pw =user.getPw();
		String phone = user.getPhone1()
				+"-"+user.getPhone2()
				+"-"+user.getPhone3();
		String gender = user.getGender();
		
		out.println("이름:" +name+",아이디:"+id
				+",비번:"+pw+",전화번호:"+phone
				+",성별:"+gender+"<br/>");
	}
%>