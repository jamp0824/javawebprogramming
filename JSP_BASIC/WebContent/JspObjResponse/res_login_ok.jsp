<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%--
	- 이 페이지에서는 넘어온 아이디값과 비밀번호값을
	받아서 처리합니다.
	만약 아이디가 'abc1234'이고 비밀번호가 'xyz9876'이라면
	아이디가 일치 하지 않았을 경우
	'res_id fail.jsp'로 리다이렉팅해서 
	'존재하지 않는 회원입니다'를 브라우저에 출력하세요.
	아이디가 일치할 경우 비밀번호도 확인해서 틀렸을 경우
	'res_pw fail.jsp'로 리다이렉팅해서
	'비밀번호가 틀렸습니다'를 브라우저에 출력하세요.
	ID와 PW가 전부 일치했을 경우 'res_welcome.jsp'로
	리다이렉팅하여 '회원님 반갑습니다.'를 출력하세요.
--%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals("abc1234")){
		if(pw.equals("xyz9876")){
			response.sendRedirect("../JspObj/res_welcome.jsp");
		}else{
			response.sendRedirect("../JspObj/res_pw_fail.jsp");
		}
			
	}else{
			response.sendRedirect("../JspObj/res_id_fail.jsp");
	}
	
%>
