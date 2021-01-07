<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
boolean flag = false;
	if(session.getAttribute("login") != null)
		flag = (boolean)session.getAttribute("login");
	if(flag){
		// 로그인 상태일때
		response.sendRedirect(request.getContextPath()+"index.jsp");	
	}
	else{
		// 로그인 상태가 아닐때 로그인 정보 입력받기
%>
	<jsp:include page="/template/header.jsp" flush="false"/>
	<div id="main">
		<div id="login_area">
			<form action="<%=request.getContextPath() %>/member/login_process.jsp" method="post">
				아이디 : <input type="text" name="id"><br>
				   암호 : <input type="password" name="pass"><br>
				<button type="submit">로그인</button>
				<input type="button" onclick="location.href='<%=request.getContextPath() %>/member/find_pass.jsp'" value="비밀번호 찾기">
				<input type="button" onclick="location.href='<%=request.getContextPath() %>/member/register.jsp'" value="회원가입">
			</form>
		</div>
	</div>
	<jsp:include page="/template/footer.jsp" flush="false"/>
<%
	}
%>
</body>
</html>