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
		height: 900px;
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
	.page_bar{
		position:relative;
		text-align: center;
	}
	.page_bar a:link,.page_bar a:visited {
		color:black;
		text-decoration: none;
		font-size : 18px;
		margin-left: 10px;
		margin-right: 10px;
	}
	.page_bar a:hover{
		font-weight: bold;
		color:red;
	}
	.btn_writer{
		position:absolute;
		right:0px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$(".board tr").click(function(){
			if($(this).index() == 0) return;
			var bno = $(this).find("td").first().html();
			location.href = "<%=request.getContextPath()%>/board/board_view.jsp?bno="+bno;
			console.log($(this).find("td").first().html());
		});
		$(".btn_writer").click(function(){
			if(<%=session.getAttribute("login")%> == null)
				alert("로그인 후 이용하실 수 있습니다.");
		});
	});
</script></head>
<body>
	<jsp:include page="/template/header.jsp" flush="false"/>
	<div id="main">
		<p style="font-size: 44px">Board List</p>
<%
		// 리스트 받아오기
		ArrayList<BoardDto> list = BoardService.getInstance().getBoardDtoList();
%>
		<div id="content">
			<hr>
			<table class="board">
				<tr>
					<th>글번호</th>
					<th class="title">제목</th>
					<th class="writer">작성자</th>
					<th class="date">작성일</th>
					<th>조회수</th>
					<th>좋아요</th>
					<th>싫어요</th>
				</tr>
<%
			for(int i=0;i<list.size();i++){
%>
				<tr>
					<td><%=list.get(i).getBno() %></td>
					<td><a href="<%=request.getContextPath()%>/board/board_view.jsp?bno=<%=list.get(i).getBno()%>"><%=list.get(i).getTitle() %></a></td>
					<td><%=list.get(i).getWriter() %></td>
					<td><%=list.get(i).getBdate() %></td>
					<td><%=list.get(i).getBcount() %></td>
					<td><%=list.get(i).getBlike() %></td>
					<td><%=list.get(i).getBhate() %></td>
				</tr>					
<%
			}
%>

			<tr>
				<td colspan="7">
					<div class="page_bar">
						<a href="#">◀</a>
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						<a href="#">▶</a>
						<a href="<%=request.getContextPath()%>/board/board_write_view.jsp" class="btn_writer">글쓰기</a>
					</div>
				</td>
			</tr>
			</table>
		</div>
	</div>
	<jsp:include page="/template/footer.jsp" flush="false"/>
</body>
</html>