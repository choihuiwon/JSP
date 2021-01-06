<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++)
			out.write(cookies[i].getName() + " : " + cookies[i].getValue()+"<br>");
		out.write(session.getId()+"<br>"); //현재 웹 브라우저 세션 ID값
	%>
	<br>
	<a href="cookie_setting.jsp">쿠키 생성 페이지로 이동</a>
</body>
</html>