<%@page import="ko.co.koo.el.Thermometer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/*
		- EL 태그로 자바의 객체를 활용하려면 request, session, application
		객체에 자바의 객체를 저장시켜야 합니다.
	*/
	request.setAttribute("t", new Thermometer());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>

<%--el에서 객체의 메서드 호출 시 매개값으로 문자열을 전달할 떄는 홀따옴표 사용 --%>
${t.setDegrees('서울',22.5)}
서울 온도: 섭씨 ${t.getDegrees('서울')}도 //화씨${t.change('서울')}도
<br/>
${t.setDegrees('알레스카',19.8)}
알레스카 온도: 섭씨 ${t.getDegrees('알레스카')}도 //화씨 ${t.change('알레스카')}도
</body>
</html>
