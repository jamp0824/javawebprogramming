<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%!
	List<String> party= new ArrayList<>();
%>
<%
	String[] jobs = {"전사","도적","사냥꾼","마법사","사제"};
	//int r = 인덱스 난수 발생
	//String job = jobs[r];
	int r = (int)(Math.random()*jobs.length);
	String job = jobs[r];
	party.add(job);
	
	
	//저장된 list에 현재 선택된 작업이 몇 개 존재하는지 확인하는 작업
	int cnt = 0;
	/*for문으로 list를 순회해서 현재 선택된 작업의 문자열과
	리스트 내부에 들어있는 문자열 중에 같은 문자열이 발견될 때마다
	cnt수를 1올립니다.*/
	for(String player: party){
		if(job.equals(player)){
			cnt+=1;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<h1>당신의 역활</h1>
<p>
당신에게 부여된 역할은<strong>[<%=job %>]</strong>입니다.<br/>
현재 파티에 당신과 같은 역할을 가진 플레이어는 <%=cnt %>명입니다.<br><br>
</p>
<p>
현재파티 구성<br>
[<%=party %>](<%=party.size() %>명 참가중)
</p>
<%
	if(party.size()==10){
		party.clear();
	}
%>
</body>
</html>
