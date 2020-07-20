<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Application/app_basic.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align=center>
	<form action="req_album_result.jsp"> 
		<table border="1" width="700">
			<tr>
				<td></td>
				<td>앨범 커버</td>
				<td>가수</td>
				<td>앨범 제목</td>
				<td>발매일</td>
			</tr>
			<tr>
				<td>
					<input type="radio" name="title" value="lovelyz4">
				</td>
				<td align="center">					
					<img src="01.jpg" width="100" height="100">					
				</td>
				<td>러블리즈</td>
				<td>					
					Lovelyz 4th Mini Album 治癒(치유)					
				</td>
				<td>2018-04-23</td>
			</tr>
			<tr>
			    <td>
					<input type="radio" name="title" value="secret">
				</td>
				<td align="center">					
					<img src="02.jpg" width="100" height="100"/>					
				</td>
				<td>오마이걸</td>
				<td>					
					비밀정원					
				</td>
				<td>2018-01-09</td>
			</tr>
			
			<tr>
				<td colspan="5">
				<input type="submit" value="확인">
				</td>
			</tr>		
		</table>		
</form> 	

</div>
<hr/><h3>방문자 수:<%=count %></h3><hr/>
</body>
</html>