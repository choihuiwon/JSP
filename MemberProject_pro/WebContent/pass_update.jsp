<%@page import="service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		System.out.println("pass_update.jsp "+ name);
		MemberService.getInstance().findMemberVO(id,name);
	
	%>
	<jsp:include page="template/header.jsp"></jsp:include>
	
	<div class="container">
	<form action="pass_update_process.jsp">
		아이디 : <input type="text" name="id" value="<%=id %>" readonly><br>
		새비밀번호 : <input type="password" name="pass" required><br>
		<button>암호 수정</button>
	</form>
	</div>
		
	<jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>







