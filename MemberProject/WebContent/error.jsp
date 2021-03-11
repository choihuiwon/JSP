<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	Exception Message : <%=exception.getMessage() %><br>
	<a href="javascript:history.back();">뒤로가기</a>
	
	<script>
		alert(<%=exception.getMessage() %>)
	</script>
</body>
</html>