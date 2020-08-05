<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<%--<%
	int sum = 0;
	for(int n=1;n<=100; n++)
		sum+=n;
	out.print("<h4>1부터 100까지 누적합: "+sum+"</h4>");
%>--%>
	<h4>1부터 100까지의 합</h4>
	<hr />
	<%-- jstl변수 선언태그 c:set -> EL 변수로 활용가능 --%>
	<c:set var="sum" value="0" />
	<c:forEach var="n" begin="1" end="100" step="1">
		<c:set var="sum" value="${sum+n}" />
	</c:forEach>
	<p>1~100까지의 누적합:${sum}</p>

	<h4>구구단 4단</h4>
	<hr />
	<c:forEach var="hang" begin="1" end="9">
	4x${hang}=${4*hang}<br />
	</c:forEach>
	<hr/>

	<%--
	for(int dan=2; dan<=9; dan++){
	for(int hang=1; hang<=9; hang++){
	out.println(dan+"x"
	+ hang+"="+dan*hang +"<br/>");
}
}
 --%>
 <h4>2단부터9단까지</h4>
 <c:forEach var="dan" begin="2" end="9">
   구구단:${dan}단<hr/>
 <c:forEach var="hang" begin="1" end="9">
${dan}x${hang}=${dan*hang} <br/>
 </c:forEach>
 <hr/>
 </c:forEach>
</body>
</html>
