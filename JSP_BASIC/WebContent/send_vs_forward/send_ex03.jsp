<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
#아이디 :<%=id %> 
#비번:<%=pw %>
</body>
</html>
