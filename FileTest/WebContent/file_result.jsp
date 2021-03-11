<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="dto" items="${requestScope.file }">
		${dto.path }<br>
		<a href="filedownload.jsp?file=${dto.fileName}&writer=${requestScope.user}">
		${dto.fileName }</a>${dto.type }<hr>
	</c:forEach>
</body>
</html>





