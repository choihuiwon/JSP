<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호 찾기</title>
<style>
.container{
	width:300px;
	margin:0px auto;
	height: 600px;
	padding-top:200px;
	box-sizing: border-box;
}
</style>
</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>
	
	<div class="container">
		<form method="post" action="pass_update.jsp">
			<label for="id">아이디 : </label><input type="text" name="id" id="id"><br>
			<label for="name">이름 : </label><input type="text" name="name" id="name"><br> 
			<button type="submit">비밀번호 찾기</button>
		</form>
	</div>
		
	<jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>