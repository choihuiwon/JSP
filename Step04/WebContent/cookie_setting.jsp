<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 셋팅 페이지</title>
</head>
<body>
	<!-- 쿠키에 쓸수 있는 문자는 알파벳, 한글, 숫자 : _ , 공백 X-->
	<%
		Cookie cookie = new Cookie("test","쿠키테스트값");
		cookie.setMaxAge(120);
		cookie.setPath("/");
		response.addCookie(cookie);	
	%>
	<a href="cookie_result.jsp">쿠키 조회 페이지 이동</a>
</body>
</html>