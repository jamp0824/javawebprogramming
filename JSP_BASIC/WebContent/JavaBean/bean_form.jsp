<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form action="bean_make.jsp" method="post">
		<div align="center">
			<table border="1" align="center">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" size="10"></td>
					<td>비밀번호</td>
					<td><input type="password" name="pw" size="10"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" size="10"></td>
					<td>이메일</td>
					<td><input type="email" name="email" size="10"></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="submit"
						value="회원가입"></td>
				</tr>

			</table>
		</div>
	</form>
</body>
</html>
