<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(title.equals("lovelyz4")){
		response.sendRedirect("../JspObjResponse/lovelyz4.jsp");
	}else if(title.equals("secret")){
		response.sendRedirect("../JspObjRsponse/secret.jsp");
	}

%>
	<%--
	<% if(title.equals("lovelyz4")) { %>
	 <div align="center">
		<h2>선택하신 앨범 정보</h2>
		<p>
			당신이 선택한 앨범은 러블리즈 4번째 미니앨범 '치유'입니다.
		</p>
		<hr/>
		<h3>타이틀 곡 MV</h3>
		<iframe width="800" height="600" src="https://www.youtube.com/embed/40Z9-kr504w?rel=0;apm;autoplay=1" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
		
		
	</div>
	<% }else if(title.equals("secret")) { %>
	<div align="center">
		<h2>선택하신 앨범 정보</h2>
		<p>
			당신이 선택한 앨범은 오마이걸 앨범 '비밀정원'입니다.
		</p>
		<hr/>
		<h3>타이틀 곡 MV</h3>
		<iframe width="800" height="600" src="https://www.youtube.com/embed/QIN5_tJRiyY?rel=0;apm;autoplay=1" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
		
	</div>
	<% } %>
	
	--%>
</body>
</html>






