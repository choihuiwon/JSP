<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="obj.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Person p = (Person)request.getAttribute("obj");
		String msg = (String)request.getAttribute("msg");
	%>
	
	Person 처리 결과<br>
	이름 : <%=p.getId() %><br>
	나이 : <%=p.getAge() %><br>
	<%=msg %>
</body>
</html>