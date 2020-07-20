<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<style type="text/css">
fieldset {
	width:50%;
}
</style>
</head>
<body>
<%@ include file="../Application/app_basic.jsp" %>

<%
	if(session.getAttribute("user_id")!=null){
		String nick=(String)session.getAttribute("user_nick");
%>
	<p><%=nick %>님이 현재 로그인중입니다.</p>
	<a href="session_welcome.jsp">메인페이지로</a>
<%} else{ %>

<form action="session_login_ok.jsp" method="post">
	<fieldset>
		<legend>로그인 폼</legend>
	<input type="text" name="id" size="10" placeholder="id"/><br/>
	<input type="password" name="pwd" size="10" placeholder="pwd"/><br/>
	<input type="text" name="nick" size="10" placeholder="별명"/><br/>
	<input type="submit" value="로그인"/>
	</fieldset>
</form>
<%} %>

<hr/><h3>방문자 수:<%=count %></h3><hr/>


</body>
</html>
