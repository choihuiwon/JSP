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
		width: 1200px;
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
		<li><a href="<%=request.getContextPath() %>/index.jsp">HOME</a>
		<li><a href="#">회사소개</a>
		<li><a href="#">문의하기</a>
		<li><a href="<%=request.getContextPath() %>/board/board_list_view.jsp">게시판</a>
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
				String path = request.getContextPath()+"/img/grade_icon/" + grade_name.toLowerCase() + ".png";
				if(id.equals("admin")){
				%>
					<li><a href="<%=request.getContextPath() %>/admin/manage_member_view.jsp">회원관리</a></li>
				<%} %>
				<li id="status"><img id="grade_img" src=<%=path %>><%=name %>님 로그인 하셨습니다.<br><a href="<%=request.getContextPath() %>/member/logout.jsp" id="logout">로그아웃</a> | <a href="<%=request.getContextPath() %>/member/member_update_view.jsp" id="update">정보수정</a></li>
				
			<% }else{%>
				<li><a href="<%=request.getContextPath() %>/member/login.jsp">로그인</a></li>
				<li><a href="<%=request.getContextPath() %>/member/register.jsp">회원가입</a></li>
			<%
			}
			%>			
	</ul>		
</nav>