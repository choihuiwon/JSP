<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#main{
		width: 100%;
		height: 600px;
	}
	#login_area{
		width:250px;
		height: 150px;
		margin: 0 auto;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false"/>
	<div id="main">
		<div id="login_area">
			<form action="" method="post">
				아이디 : <input type="text" name="id"><br>
				   암호 : <input type="password" name="passwd"><br>
				<button type="submit">로그인</button>
				<button>회원가입</button>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>