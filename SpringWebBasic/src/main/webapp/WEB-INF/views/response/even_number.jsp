<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>forEach �±�</title>
</head>
<body>
<h4>1���� 10������ ¦���� ��</h4>
<c:set var="sum" value="0"/>
<!-- foreach�� ����� ��� ��ũ��Ʋ�� �ȿ��� ����� �� ���� ���� ����� jstl���� ����ϴ� ���� ��� c:set�� �̿��ؼ� ����ؾ� �ϸ�
���� ��� jsp 4�� ������ ������ ���� ������� �ʾ����Ƿ� page������ sum�̶� ������ �ʱⰪ�� 0�� �ذ��̴�.  -->
<c:forEach var="i" begin="2" end="10" step="2">
<!-- step�� ���ڸ� ������ų�� ����ϸ� ������ ���� �������� �Ѵ�. -->
<c:set var="sum" value="${sum+ i}"/></c:forEach>
<!-- EL�� ���Կ����ڰ� ���� ������ ������ �ѵ� �ٽ� Ư�� ����(sum)�� �־���� �Ѵ�. -->
<!-- ���� ��� sum+i�� ������� sum�� ������ �־��ִ� ���� Ȯ���� �� �ִ�. -->

���=${sum}
</body>
</html>