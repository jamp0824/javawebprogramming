<%@page import="java.util.Collections"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true"%>
<%!public int num() {
		Random ran = new Random();
		return ran.nextInt(45) + 1;
	}%>
<%
	List<Integer> lotto = new ArrayList<>();
	while (lotto.size() < 6) {
		int rn = num();
		//contains(): 리스트 내부에 해당 객체가 존재하면 true를 리턴.
		if (!lotto.contains(rn)) {
			lotto.add(rn);
		}
	}
	//리스트의 오름차 정렬방법
	Collections.sort(lotto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>로또번호 생성 결과</h1>
	<h4>이번주 로또는 이 번호다!!</h4>
	<p>
	<%
	for(int num:lotto){ //Integer->int 자동으로 언박싱
		out.println(num+"&nbsp;");
		Thread.sleep(700); //CPU를 잠시 멈추는 메서드
		//java.lang 700밀리초 0.7초씩 쉬면서 프린트
		out.flush(); //브라우저의 출력 버퍼를 비우는 메서드
		//
	}
	%>
</p>
</body>
</html>
