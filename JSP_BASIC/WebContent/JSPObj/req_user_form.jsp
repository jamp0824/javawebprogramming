<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
	* 사용자의 입력값을 서버로 전송하는 방법.
	1. 사용자의 입력데이터를 서버로 전송하려면 HTML의 form태그를 사용합니다.
	2. form태그의 action속성에 데이터를 받을 페이지의 URL주소를 적습니다.
	3. input태그의 name속성으로 요청파라미터의 이름을 지정할 수 있습니다.
	4. 입력창이나 버튼체크에 의해 작성된 값이 요청파라미터의 값으로 처리됩니다.
	5. submit버튼을 사용하여 서버로 데이터를 전송합니다.
 --%>
<form action="req_user_info.jsp">
	<p>
	- 이름: <input type="text" name="user_name" size="10px" /><br/>   
	- ID: <input type="text" name="user_id" size="10px" /><br/>   
	- PW: <input type="password" name="user_pw" size="10px" /><br/>   
	
	- 성별: <input type="radio" name="gender" value="남자"/> 남성 &nbsp;&nbsp;
	       <input type="radio" name="gender" value="여자"/> 여성 <br/>
	       
	- 취미: 
	<input type="checkbox" name="hobby" value="soccer"/>축구 &nbsp;
	<input type="checkbox" name="hobby" value="reading"/>독서 &nbsp;
	<input type="checkbox" name="hobby" value="rest"/>수면 &nbsp;
	<input type="checkbox" name="hobby" value="music"/>음악감상 <br/>
	
	- 지역:
	<select name="region">
		<option>서울</option>
		<option>경기</option>
		<option>제주</option>
		<option>강원</option>
	</select> <br/>
	
	<!-- 서버로 데이터를 전송하는 버튼 -->
	<input type="submit" value="확인" />
	</p>	
</form>


</body>
</html>






