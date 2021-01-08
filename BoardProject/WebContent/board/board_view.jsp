<%@page import="dto.BoardDto"%>
<%@page import="service.BoardService"%>
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
		height: 500px;
	}
	#board_view_area{
		width: 800px;
		margin: 30px auto;
	}
	table{
		width: 800px;
		border-collapse: collapse;
	}
	td{
		width: 150px;
		border-bottom: 1px solid lightgray;
		padding: 5px;
	}
	textarea{
		width: 800px;
		height: 300px;
		resize: none;
		border: 1px solid gray;
	}
	img{
		width:40px;
		height: 40px;
		margin:0 30px;
	}
	.hate{
		transform: rotate(0.5turn);
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
		margin:0 30px;
		text-align: center;
	}
	.btn:hover {
		background-color: #282828;
		color:#ffffff;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$(".btn_like").click(function(){
			// 0 - hate, 1 - like
			mode = $(this).index();
			d = "bno="+<%=request.getParameter("bno")%>+"&mode="+mode;
			$.ajax({
				url : "process/board_like_hate_process.jsp",
				data : d,
				method : "get",
				success : function(result){
					result = result.trim();
					if(mode == 0)
						$("#hate").text(result);
					else
						$("#like").text(result);
				}
			});
		});
	});
</script>
</head>
<body>
	<%
		int bno = Integer.parseInt(request.getParameter("bno"));
	
		BoardDto dto = BoardService.getInstance().viewBoardDto(bno);
	%>
	<jsp:include page="/template/header.jsp" flush="false"/>
	<div id="main">
		<div id="board_view_area">
			<table>
				<tbody>
					<tr>
						<td>글번호 <%=dto.getBno() %></td>
						<td></td>
						<td></td>
						<td colspan="2">작성일 <%=dto.getBdate() %></td>
					</tr>
					<tr>
						<td>조회수 <%=dto.getBcount() %></td>
						<td>좋아요</td>
						<td id="like"><%=dto.getBlike() %></td>
						<td>싫어요</td>
						<td id="hate"><%=dto.getBhate() %></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><%=dto.getTitle() %></td>
						<td></td>
						<td>작성자</td>
						<td><%=dto.getWriter() %></td>
					</tr>
					<tr>
						<td colspan="5">내용</td>
					</tr>
					<tr>
						<td colspan="5"><textarea readonly><%=dto.getContent() %></textarea></td>
					</tr>
					<tr style="text-align: center">
						<td><a href="#" class="btn">이전글</a></td>
					<%	// 작성자일 경우
					if(session.getAttribute("login") != null && (boolean)session.getAttribute("login") && session.getAttribute("id").equals(dto.getWriter())){	
					%>
						<td><a href="#" class="btn">수정</a></td>
						<td><a href="#" class="btn">삭제</a></td>
					<%}else{ // 작성자가 아닐경우 %>
						<td colspan="2"><a href="#" class="btn_like"><img src="<%=request.getContextPath()%>/img/like.png" class="hate"></a>
						<a href="#" class="btn_like"><img src="<%=request.getContextPath()%>/img/like.png"></a></td>
					<%} %>
						<td><a href="#" class="btn">다음글</a></td>
						<td><a href="<%=request.getContextPath() %>/board/board_list_view.jsp" class="btn">목록보기</a></td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
	<jsp:include page="/template/footer.jsp" flush="false"/>
</body>
</html>