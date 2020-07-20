<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/*
		- 세션에 저장된 데이터는 브라우저 창이 종료될 때까지 혹은
			세션에 유효시간이 만료되기 전까지 웹 어플리케이션의 모든
			jsp페이지에서 사용할 수 있습니다.
			
		- 세션에 저장된 데이터를 가져오려면 session객체의
			getAttribute()메서드를 사용하여 매개밧으로 가져올 
			데이터의 세션명을 적습니다.
	*/
	String nick =(String)session.getAttribute("nickname");
	String [] hobbys=(String [])session.getAttribute("hobbys");
	
	out.println(nick+"<br/>");
	out.println(Arrays.toString(hobbys)+"<br/>");
	out.println("====================<br/>");
	
	//세션의 유효시간 설정.
	
	int sTime = session.getMaxInactiveInterval();
	out.println("세션유효시간"+sTime+"초<br/>");
	out.println("==================<br/>");
	
	//특정 세션 데이터 삭제
	session.removeAttribute("nick");
	nick = (String)session.getAttribute("nick");
	out.println("삭제 후 nick의 값"+nick+"<br/>");
	out.println("=====================");
	
	//모든 세션 데이터 삭제
	session.invalidate();
	
	if(request.isRequestedSessionIdValid()){
		out.println("유효한 세션이 중요함.");
		
	}else{
		out.println("유효한 세션이 존재하지 않음.");
	}
	
%>