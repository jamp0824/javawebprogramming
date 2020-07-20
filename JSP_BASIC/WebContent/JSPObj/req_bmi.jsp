<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	bmi지수 계산 공식 [체중(kg) / 신장(m) * 신장(m)]
	* bmi지수가 23을 초과한다면 "당신은 과체중입니다."를 출력,
	18.5 미만이라면 "당신은 저체중입니다."를 출력,
	나머지는 "당신은 정상체중입니다."를 출력하세요.
	
	* 문자열 내부에 들어있는 데이터를 기본데이터 타입으로 변환하는 방법
	 포장 클래스에 들어있는 parse+기본타입이름()메서드 활용.
	 ex) String -> int
		Integer.parseInt(문자열);
	 	 String -> double
	 	Double.parseDouble(문자열);
 --%>
<%
	String strCm = request.getParameter("cm");
	String strKg = request.getParameter("kg");
	
	double cm = Double.parseDouble(strCm);
	double kg = Double.parseDouble(strKg);
	
	//bmi지수 계산 공식 [체중 / 신장(m) * 신장(m)]
	double bmi = kg / (cm/100 * cm/100);
	System.out.println(bmi);
	bmi = Math.round(bmi*1000) / 1000.0;
	System.out.println(bmi);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>체질량 지수(BMI) 계산</h2>
	<hr/>
	<p>
		- 신장: <%= strCm %>cm <br/>
		- 체중: <%= strKg %>kg <br/>
	</p>
	<p>
		BMI 지수: <b><%= bmi %></b> <br/>
		
		<%if(bmi > 23) { %>
			당신은 과체중입니다.
		<%}else if(bmi < 18.5) { %>
			당신은 저체중입니다.
		<%}else { %>
			당신은 정상체중입니다.
		<%} %>
		
	</p>
</body>
</html>