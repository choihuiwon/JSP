<%@page import="vo.MemberVo"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Update View</title>
<style>
	#main{
		height: 400px;
	}
	#register_area{
		width:400px;
		margin: 0 auto;
		margin-top:200px;
		text-align: center;
	}
	table, td{
		border-collapse: collapse;
		font-size: 22px;
		font-size: 22px;
		text-align: left;
		padding: 5px;
	}
	input, button{
		font-size: 22px;
	}
</style>
</head>
<body>
	<%
		// 세션 유효 처리
		if(session.getAttribute("login") == null || !(boolean)session.getAttribute("login")) {
			// 로그아웃 상태일때
			// sendRedirect 해도 바로 페이지 이동 하지 않는다. 따라서 return; 해서 바로 끊어줘야 500에러 안난다.
			response.sendRedirect("login.jsp");
			return;
		}
		
		// 로그인 상태일때
		// 수정전 정보를 셋팅하기 위해 불러옴
		MemberVo vo = MemberDao.getInstance().selectMemberVo((String)session.getAttribute("id"));
	%>
	<jsp:include page="header.jsp" flush="false"/>
	<div id="main">
		<div id="register_area">
			<form action="member_update_process.jsp" method="post">
			<table>
				<tr>
					<td><label for="id">아이디</label></td>
					<td><input type="text" name="id" id="id" value="<%=vo.getId()%>" readonly></td>
				</tr>
				<tr>
					<td><label for="passwd">암호</label></td>
					<td><input type="password" name="passwd" id="passwd"></td>
				</tr>
				<tr>
					<td><label for="name">이름</label></td>
					<td><input type="text" name="name" id="name" value="<%=vo.getName()%>"></td>
				</tr>
				<tr>
					<td><label for="age">나이</label></td>
					<td><input type="text" name="age" id="age" value="<%=vo.getAge()%>"></td>
				</tr>
				<tr>
					<td><button type="submit">수정</button></td>
					<td style="text-align: right;"><button type="button" onclick="history.back()">뒤로가기</button></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>