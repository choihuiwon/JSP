<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="dto.PersonDTO" scope="page"></jsp:useBean>
	<%=person.getName() %> <%=person.getAge() %>
	
	<jsp:useBean id="person1" class="dto.PersonDTO" scope="session"></jsp:useBean>
	<%=person1.getName() %> <%=person1.getAge() %>
	
	<jsp:useBean id="person2" class="dto.PersonDTO" scope="application"></jsp:useBean>
	<%=person1.getName() %> <%=person1.getAge() %>
	
	<hr>
	<a href="javaBeans1.jsp">페이지 이동</a>
</body>
</html>