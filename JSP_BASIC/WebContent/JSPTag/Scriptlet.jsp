<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>

<% for(int i=0;i<3;i++){ %>
<h2>이클립스와 톰캣으로 jsp파일 렌더링하기</h2>
<p>안녕하세요. 오늘은 2019년 4월 17일 수요일입니다.<br/>
<i>스크립트릿 연습을 하고 있습니다.</i>
</p><hr/>
<%} %>

<h2>구구단2단</h2><hr/>
<%
for(int hang=1; hang<=9; hang++){
	//out.println메서드는 브라우저에 출력을 실행하는 메서드입니다.
	out.println("2x"+hang+"="+(2*hang)+"<br/>");
}
%>
<%--자바코드는 실행시 보안으로 인해 보여지지 않는다. --%>
</body>
</html>
