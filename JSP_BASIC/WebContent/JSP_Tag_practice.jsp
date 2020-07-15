<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%--소스 코드 흔적 지우는법 --%>
<%! 
	public static int result;
	static int s;
	public String a(){
		if(result==10){
			return "당첨되셨습니다";
		}else{
			return "";
		}
	}	
	public int randomNumber(){
		//랜덤 정수 1~10까지를 발생시켜서 리턴해주세요
		//return (int)(Math.random())*10+1;
		Random r = new Random();
		return r.nextInt(9)+1;
	}
	

%>
<%
	result++;
	String r=a();
	s=randomNumber();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<p>
페이지 누적 요청 수:<%=result %><br>
매 10번째 방문자에게는 기프트콘을 드립니다.<br>
</p>
<%=r %><hr>
<p>
<h1>랜덤 구구단(<%=s %>단)</h1>
이번에 나오는 구구단은 <%=s %>단입니다.<br><br>
</p>
<p>
<% for(int i=1;i<=9;i++) {%>
<%=s %>*<%=i %>=<%=s*i %><br/>
<%} %>
</p>
</body>
</html>
