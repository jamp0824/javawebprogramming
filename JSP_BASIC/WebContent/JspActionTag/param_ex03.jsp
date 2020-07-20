<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String name= request.getParameter("name");
	String email=request.getParameter("email");
	String nick = request.getParameter("nick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<%=name %>
<%=email %>
<%=nick %>
</body>
</html>
