<%@page import="vo.PaggingVo"%>
<%@page import="dao.BoardDao"%>
<%@page import="service.BoardService"%>
<%@page import="dto.BoardDto"%>
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
	});
</script></head>
<body>
	<jsp:include page="/template/header.jsp" flush="false"/>
	<div id="main">
		<p style="font-size: 44px">Board List</p>
<%		
		// 페이징
		int pageNo = 1;
		if(request.getParameter("pageNo") != null)		
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		// mode
		String mode = "bno";
		if(request.getParameter("mode") != null)
			mode = request.getParameter("mode");
		// 리스트 받아오기 + 페이징 처리 + mode 처리
		ArrayList<BoardDto> list = BoardService.getInstance().getBoardDtoList(pageNo, mode);

		// 댓글 수
		BoardDao dao = BoardDao.getInstance();
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
					<th><a href="<%=request.getContextPath()%>/board/board_list_view.jsp?mode=blike&pageNo=<%=pageNo%>">좋아요</a></th>
					<th><a href="<%=request.getContextPath()%>/board/board_list_view.jsp?mode=bhate&pageNo=<%=pageNo%>">싫어요</a></th>
				</tr>
<%
			for(int i=0;i<list.size();i++){
%>
				<tr>
					<td><%=list.get(i).getBno() %></td>
					<td><a href="<%=request.getContextPath()%>/board/board_view.jsp?bno=<%=list.get(i).getBno()%>"><%=list.get(i).getTitle() %> [<%=dao.getBoardCommentCount(list.get(i).getBno()) %>]</a></td>
					<td><%=list.get(i).getWriter() %></td>
					<td><%=list.get(i).getBdate() %></td>
					<td><%=list.get(i).getBcount() %></td>
					<td><%=list.get(i).getBlike() %></td>
					<td><%=list.get(i).getBhate() %></td>
				</tr>					
<%
			}
			
			// 페이징 정보를 읽어옴
			int count = BoardDao.getInstance().getCount();	// 전체 글 개수
			PaggingVo pageVo = new PaggingVo(count, pageNo);
%>

			<tr>
				<td colspan="7">
					<div class="page_bar">
						<!-- 페이징 처리 시작 -->
<%
						if(pageVo.isPreviousPageGroup()){
%>
						<!-- 현재 페이지 그룹의 첫번째 페이지 -1 == 이전 페이지 그룹의 마지막 페이지 -->
						<a href="<%=request.getContextPath()%>/board/board_list_view.jsp?pageNo=<%=pageVo.getStartPageOfPageGroup()-1 %>">◀</a>
<%
						}
%>
<%
						int start = pageVo.getStartPageOfPageGroup();
						int end = pageVo.getEndPageOfPageGroup();
						for(int i=start; i<=end; i++){
							if(i == pageNo){
%>
								<a style="font-weight:bold;color:blue;"><%=i%></a>
<%
							}else{
%>
								<!-- loop start -->
								<a href="<%=request.getContextPath()%>/board/board_list_view.jsp?pageNo=<%=i%>"><%=i%></a>
<%
							}
						}
						if(pageVo.isNextPageGroup()){
%>
						<a href="<%=request.getContextPath()%>/board/board_list_view.jsp?pageNo=<%=pageVo.getEndPageOfPageGroup()+1 %>">▶</a>
<%
						}
%>
						<!-- 페이징 처리 종료 -->
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