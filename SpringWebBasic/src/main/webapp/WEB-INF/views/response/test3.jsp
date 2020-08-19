<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원가입 정보 출력하기</h2>
<p>
	# 회원정보: ${user}<br>
	# 아이디: ${user.getUserId()} <br>
	# 비밀번호:${user.userPw} <br>
	# 이름 ${user.userName}<br>
	
	# 취미 
	<c:if test="${user.hobby.size() !=0 }">
	<c:forEach var="h" items="{user.hobby">
	${h} &nbsp;
	</c:forEach>
	</c:if>
	<c:if test="${empty user.hobby}">
	이 사람은 취미가 없는 사람입니다
	</c:if>
	<br>
</p>

</body>
</html>