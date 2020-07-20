<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<%--
	--전송방식을 post로 사용하기 위해서는 반드시 form태그가 필요합니다.
	form태그의 method라는 속성을 "post"로 설정하면 요청방식이 
	post방식으로 전송됩니다. 그렇게 안하면 자동으로 get방식으로 처리된다.
 --%>
<form action="./req_post_take.jsp" method="post">
-아이디:<input type="text" name="id" size="10px" /><br/>
-비밀번호:<input type="password" name="pw" size="10px" /><br/>
-이름:<input type="text" name="name" size="10px" /><br/>
<input type="submit" value="전송"/>
</form>
</body>
</html>
