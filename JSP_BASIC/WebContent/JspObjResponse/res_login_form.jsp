<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<%-- 
	-태그에 내부 스타일 시트 방식으로 디자인을 적용하려면 선택지를 이용합니다.
	-클래스 선택지:.[클래스이름]
	-아이디 선택자:#[아이디이름]
	-태그 선택자: [태그 이름]
 --%>
<style type="text/css">
.Login_btn {
		background-color: yellow;
		width: 50px;
		height: 50px;
		font-family:cursive;
		padding: 2px;
}
</style>
</head>
<body>
<%--
	*CSS(Cascade Style Sheet)
	-HTML에 디자인요소를 적용하는 언어는 CSS입니다.
	1.인라인 스타일 시트 - 태그 내부에 해당 태그에만 적용하는 스타일을 지정
	2.내부 스타일 시트 - 태그의 스타일을 head태그에서 따로 지정.
	3.외부 스타일 시트 - 외부에 .css파일을 따로 만들어 디자인소스만 모두 지정한 뒤
	HTML에서 링크를 통해 로딩시킴
	
	-CSS 우선적용 순위: 인라인> 내부> 외부
 --%>
 <!--  div태그에 인라인 스타일 적용 -->
<div align="center" style="border: 2px dashed blue; width:80%; padding:15px;">
	<h3>sendRedirect 로그인 연습</h3> <hr/>
	<form action="res_login_ok.jsp" method="post">
	<table border="1">
	<tr>
	<td><input type="text" name="id" size="10px" placeholder="ID를 입력!" /></td>
	<td rowspan="2"><input class="Login_btn" type="submit" value="로그인" /></td>
	</tr>
	<tr>
	<td><input type="password" name="pw" size="10px"  placeholder="PW를 입력!">
	</td>
	</tr>
	</table>
	</form>
</div>
</body>
</html>
