<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#main{
		height: 400px;
	}
	#login_area{
		width:250px;
		height: 150px;
		margin: 0 auto;
		margin-top: 200px;
	}
</style>
</head>
<body>
<c:if test="${session.login ne null && session.login eq true }">
	<script>
		location.href="../index.jsp";
	</script>
</c:if>
	<jsp:include page="../template/header.jsp" flush="false"/>
	<div id="main">
		<div id="login_area">
			<form action="login.do" method="post">
				아이디 : <input type="text" name="id"><br>
				   암호 : <input type="password" name="pass"><br>
				<button type="submit">로그인</button>
				<input type="button" onclick="location.href='pass_find.jsp'" value="비밀번호 찾기">
				<input type="button" value="회원가입">
			</form>
		</div>
	</div>
	<jsp:include page="../template/footer.jsp" flush="false"/>
</body>
</html>