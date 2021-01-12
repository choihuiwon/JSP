<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<form action="../RouteTest" method="get"> -->
	<form action="<%=request.getContextPath() %>/RouteTest" method="get">
		<input type="text" name="txt">
		<button>전송</button>
	</form>
</body>
</html>