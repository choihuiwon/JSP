<%@page import="service.BoardService"%>
<%@page import="dto.BoardDto"%>
<%-- <%@page import="vo.BoardVo"%> --%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List Page</title>
<style>
	#main{
		height: 700px;
		text-align: center;
	}
	#content{
		width: 1200px;
		margin: 0 auto;
	}
	.btn{
		text-decoration: none;
		background-color: #e8e8e8;
		width: 100px;
		font-size: 22px;
		display: inline-block;
		padding: 5px 0px;
		box-sizing: border-box;
		border: none;
		color:black;
		margin-right:108px;
		text-align: center;
	}
	.btn:hover {
		background-color: #282828;
		color:#ffffff;
	}
	#title{
		font-size:0px;
		padding:0;
	}
	#title > li{
		width: 200px;
		font-size:16px;
		display: inline-block;
		text-align: center;
		font-weight: bold;
		padding:10px;
		box-sizing: border-box;
	}
	table{
	border-collapse: collapse;
	}
	td{
		width:200px;
		text-align: center;
		padding:10px;
		box-sizing: border-box;
	}
</style>
</head>
<body>
	<jsp:include page="/template/header.jsp" flush="false"/>
	<div id="main">
		<p style="font-size: 44px">Board List</p>
<%
		// 리스트 받아오기
		ArrayList<BoardDto> list = BoardService.getInstance().getBoardDtoList();
%>
		<div id="content">
		
<%		// 로그아웃 상태일때 글쓰기 버튼 보이지 않음
			if(session.getAttribute("login") != null && (boolean)session.getAttribute("login"))
			{
%>
			<div align="right">
				<a href="<%=request.getContextPath() %>/board/board_write_view.jsp" class="btn">글쓰기</a>
			</div>
<%
			}
%>

			<ul id="title">
				<li>글번호</li>
				<li>제목</li>
				<li>작성자</li>
				<li>조회수</li>
				<li>좋아요/싫어요</li>
				<li>작성일</li>
			</ul>
			<hr>
			<table>
<%
			String html = "";
			for(int i=0; i<list.size(); i++){
				html +="<tr><td>"+list.get(i).getBno()+"</td>"
					+ "<td><a href='"+request.getContextPath()+"/board/board_view.jsp?bno="+list.get(i).getBno()+"'>"+list.get(i).getTitle()+"</a></td>"
					+ "<td>"+list.get(i).getWriter()+"</td>"
					+ "<td>"+list.get(i).getBcount()+"</td>"
					+ "<td>"+list.get(i).getBlike()+"/"+list.get(i).getBhate()+"</td>"
					+ "<td>"+list.get(i).getBdate()+"</td></tr>";
			}
%>
			<%=html %>
			</table>
		</div>
	</div>
	<jsp:include page="/template/footer.jsp" flush="false"/>
</body>
</html>