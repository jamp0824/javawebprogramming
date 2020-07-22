<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>

<%--

	액션태그를 사용하여 ScoreBean의 객체를 request범위로 생성하시고 
	setProperty를 사용하여 객체 내부 데이터에 파라미터데이터를 세팅한 뒤
	파라미터데이터 3개와 총점, 평균을 구하여 5개를 모두 객체에 포장하여
	score_bean_use.jsp로 전송(포워딩)하세요.

 --%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="score" class="kr.co.koo.jspbasic.score.ScoreBean" scope="request" />
<jsp:setProperty name="score" property="*" />
<%
	int total = score.getKor() + score.getEng() + score.getMath();
	double avg = (double)total / 3;	
%>
<jsp:setProperty name="score" property="total" value="<%= total %>"/>
<jsp:setProperty name="score" property="average" value="<%= avg %>"/>

<jsp:forward page="score_bean_use.jsp" />
age="score_bean_use.jsp"></jsp:forward>