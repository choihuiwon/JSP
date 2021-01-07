<%@page import="service.MemberService"%>
<%@page import="vo.MemberVo"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#main{
		height: 400px;
	}
	#pass_update_area{
		width:250px;
		margin: 0 auto;
		margin-top: 200px;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	
	MemberService.getInstance().findMemberVo(id, name);
%>
	<jsp:include page="/template/header.jsp" flush="false"/>
	<div id="main">
		<div id="pass_update_area">
			<form action="<%=request.getContextPath()%>/member/pass_update_process.jsp">
				아이디 : <input type="text" name="id" value="<%=id %>" readonly><br>
				새비밀번호 : <input type="text" name="pass" required="required"><br>
				<button>암호수정</button>
			</form>
		</div>
	</div>
	<jsp:include page="/template/footer.jsp" flush="false"/>
</body>
</html>