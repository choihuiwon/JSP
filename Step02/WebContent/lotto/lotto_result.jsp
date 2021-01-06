<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table, td{
		border-collapse: collapse;
		border: 1px solid black;
		text-align: right;
		padding:5px;
		font-size: 14px;
	}
</style>
</head>
<body>
	<table>
		<caption>로또 번호 생성 결과</caption>
		<%=request.getAttribute("html") %>
	</table>
</body>
</html>