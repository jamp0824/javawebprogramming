<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>forEach 태그</title>
</head>
<body>
<h4>1부터 10까지의 짝수의 합</h4>
<c:set var="sum" value="0"/>
<!-- foreach를 사용할 경우 스크립틀릿 안에서 사용할 수 없고 변수 선언시 jstl에서 사용하는 값은 모두 c:set을 이용해서 사용해야 하며
위의 경우 jsp 4개 영역에 저장할 곳을 명시하지 않았으므로 page영역에 sum이란 변수의 초기값을 0을 준것이다.  -->
<c:forEach var="i" begin="2" end="10" step="2">
<!-- step은 숫자를 증가시킬때 사용하며 증가할 값을 명시해줘야 한다. -->
<c:set var="sum" value="${sum+ i}"/></c:forEach>
<!-- EL은 대입연산자가 없기 때문에 연산을 한뒤 다시 특정 변수(sum)에 넣어줘야 한다. -->
<!-- 위의 경우 sum+i의 결과값을 sum의 변수에 넣어주는 것을 확인할 수 있다. -->

결과=${sum}
</body>
</html>