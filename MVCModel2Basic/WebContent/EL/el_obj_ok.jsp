<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<%-- 
<%
	String name= request.getParameter("name");
	String nick= request.getParameter("nick");
%>

이름: <%=name %> <br/>
별명: <%=nick %>
--%>

이름:${param.name}<br/>
별명:${param.nick} 
</body>
</html>
