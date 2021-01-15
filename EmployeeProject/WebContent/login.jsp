<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin:0;
		padding:0;
	}
	div{
		width:500px;
		margin:200px auto;
	}
</style>
</head>
<body>
<div>
	<form action="emp_login.brd" method="get">
		xx회사 인사관리프로그램<br>
		이름 : <input type="text" name="name"><br>
		사번 : <input type="text" name="eno"><br>
		<button>로그인</button>
	</form>
</div>
</body>
</html>