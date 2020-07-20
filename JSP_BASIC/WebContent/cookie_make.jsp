<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/*
	 * 쿠키 생성방법
	 *	쿠키 객체를 생성 - 생성자의 매개값으로 쿠키의 이름과 저장할 데이터를 입력
	 */
	 Cookie apple = new Cookie("apple_cookie","사과맛 쿠키");
	 Cookie peanut = new Cookie("peanut_cookie","땅콩맛 쿠키");
	 
	 //2. 쿠키 클래스의 setter메서드로 쿠키의 속성들을 설정
	 apple.setMaxAge(60*60); //쿠키의 유효시간 설정(초): 60초x60초
	 peanut.setMaxAge(20);
	 
	 //3. http응답시 response객체에 생성된 쿠키를 탑재하여 클라이언트로 전송.
	 response.addCookie(apple);
	 response.addCookie(peanut);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<a href="cookie_check.jsp">쿠키 확인하기~</a>
</body>
</html>
