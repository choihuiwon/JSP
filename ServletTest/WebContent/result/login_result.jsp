<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>
	<%=request.getAttribute("id") %> 님 로그인
	<%=session.getAttribute("text") %>
</body>
</html>