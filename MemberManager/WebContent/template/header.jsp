<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<style>
	*{
		padding:0;
		margin:0;
	}
	nav{
		width: 1000px;
		margin: 0 auto;
		border: 1px solid black;
		text-align: center;
	}
	nav ul{
		list-style: none;
	}
	nav li {
		display: inline-block;
		margin: 15px 20px;
	}
	nav a:link, nav a:visited{
		text-decoration: none;
		color: black;
		font-size: 28px;
	}
	nav a:hover {
		font-weight: bold;
	}
	
	#main{
		width: 100%;
	}
	#status{
		text-align: right;
	}
	#logout{
		font-size:18px;
	}
	#update{
		font-size:18px;
	}
	#grade_img{
		width:60px;
		height: 60px;
		margin-bottom: -30px;
	}
	
</style>

<nav>
	<ul>
		<li><a href="main.jsp">HOME</a>
		<li><a href="#">회사소개</a>
		<li><a href="qnaView.do">문의하기</a>
		<%
			boolean flag = false;
			String name = "";
			String id = "";
			if(session.getAttribute("login") != null){
				flag = (boolean)session.getAttribute("login");
				name = (String)session.getAttribute("name");
				id = (String)session.getAttribute("id");
			}
			if(flag){
				String grade_name = MemberDao.getInstance().memberGradeName(id);
				String path = "src/grade_icon/" + grade_name.toLowerCase() + ".png";
				if(id.equals("admin")){
				%>
					<li><a href="manage_member_view.jsp">회원관리</a></li>
				<%} %>
				<li id="status"><img id="grade_img" src="src/grade_icon/${sessionScope.grade }.png">${sessionScope.name }님 로그인 하셨습니다.<br><a href="logout.do" id="logout">로그아웃</a> | <a href="update_view.do" id="update">정보수정</a></li>
				
			<% 
			}else{
			%>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="register.jsp">회원가입</a></li>
			<%
			}
			%>			
	</ul>		
</nav>