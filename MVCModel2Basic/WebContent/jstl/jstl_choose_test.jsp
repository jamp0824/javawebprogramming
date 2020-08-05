<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<c:choose>
<c:when test="${param.grade>=90 }">
<p>당신의 학점은 A입니다.</p>
</c:when>
<c:when test="${param.grade>=80 }">
<p>당신의 학점은 B입니다</p>
</c:when>
<c:when test="${param.grade>=70 }">
<p>당신의 학점은 C입니다</p>
</c:when>
<c:when test="${param.grade>=60 }">
<p>당신의 학점은 D입니다</p>
</c:when>
<c:otherwise>
<p>F</p>
</c:otherwise>
</c:choose>
</body>
</html>
