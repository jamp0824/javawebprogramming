<%@page import="kr.co.koo.jspbasic.user.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="user" class="kr.co.koo.jspbasic.user.UserBean" scope="request" />
<% //UserBean user = (UserBean)request.getAttribute("user"); %>

# 아이디: <jsp:getProperty name="user" property="id" /> <br/>
# 비밀번호: <jsp:getProperty name="user" property="pw" /> <br/>
# 이름: <jsp:getProperty name="user" property="name" /> <br/>
# 이메일: <jsp:getProperty name="user" property="email" /> <br/>
<%-- # 아이디: <%= user.getId() %> <br/> 
# 비밀번호: <%= user.getPw() %> <br/>
# 이름: <%= user.getName() %> <br/>
# 이메일: <%= user.getEmail() %> <br/> --%>
<%-- 
# 아이디: <%= request.getAttribute("user_id") %> <br/>
# 비밀번호: <%= request.getAttribute("user_pw") %> <br/>
# 이름: <%= request.getAttribute("user_name") %> <br/>
# 이메일: <%= request.getAttribute("user_email") %> <br/>
--%>

</body>
</html>