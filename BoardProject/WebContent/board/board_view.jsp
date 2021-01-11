<%@page import="dto.CommentDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.BoardDto"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board View Page</title>
<style>
	#main{
		height: 1000px;
	}
	#board_view_area{
		width: 800px;
		margin: 30px auto;
	}
	#comment_view_area{
		width: 800px;
		margin: 30px auto;
	}
	#comment_write, #comment_list{
		width: 99.9%;
		margin: 0 auto;
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
	.btn, .btn_write_cmt{
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
	.btn:hover, .btn_write_cmt:hover {
		background-color: #282828;
		color:#ffffff;
	}
	#comment_write{
		border: 1px solid gray;
		box-sizing: border-box;
		margin-bottom: 20px;
	}
	.comment{
		width:99.9%;
		height: 60px;
		border: none;
	}
	.comment_item{
		height: 90px;	
		margin-top: 20px;
	}
	.comment_item div{
		margin-top: 5px;
	}
	.cmt_date{
		margin-right: 445px;
	}
	.cmt_info{
		text-align: right;
	}
	.cmt_info img{
		width:22px !important;
		height: 22px !important;
	}
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		// 게시글 좋아요/싫어요 버튼
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
				},
				error:function(request, status, error){
					alert(request.responseText.trim());
					location.href="<%=request.getContextPath()%>/member/login.jsp";
				}
			});
		});
		$(".comment").keyup(function(){
			$("#input_size").text($(".comment").val().length+"/50")
		});
		// 댓글 등록
		$(".btn_write_cmt").click(function(){
			var data = $("#comment_form").serialize();
			$.ajax({
				url : "process/comment_insert_process.jsp",
				data : data,
				method : "get",
				success : function(result){
					alert("댓글 등록 성공");
					location.reload();	// 새로고침
				},
				error:function(request, status, error){
					alert(request.responseText.trim());
					location.href="<%=request.getContextPath()%>/member/login.jsp";
				}
			});
		});
	});
</script>
</head>
<body>
<%
	if(session.getAttribute("login") == null)
	{
		String queryString="";
		queryString = request.getQueryString() != null ? "?" + request.getQueryString() : "";
		session.setAttribute("result_url", request.getRequestURI() + queryString);
	}


	int bno = Integer.parseInt(request.getParameter("bno"));

	BoardDto dto = BoardService.getInstance().viewBoardDto(bno);

	// 댓글 목록 조회
	ArrayList<CommentDto> list = BoardService.getInstance().getCommentDtoList(bno);
	
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
		<div id="comment_view_area">
			<form id="comment_form">
				<div id="comment_write">
					<input type="hidden" name="bno" value="<%=dto.getBno() %>">
					<input type="hidden" name="writer" value="<%=session.getAttribute("id") %>">
					<div><span><%=session.getAttribute("id")%></span></div>
					<hr>
					<div style="text-align: right;">
						<textarea name="content" class="comment" placeholder="주제와 무관한 댓글이나 악플은 경고조치 없이 삭제되며 징계 대상이 될 수 있습니다." maxlength="50"></textarea>
					</div>
					<div style="text-align: right;"><span id="input_size">1/50</span></div>
					<hr>
					<div style="text-align: right;"><a href="#" class="btn_write_cmt" class="btn" style="margin:0 0;">등록</a></div>
				</div>	
				<div id="comment_list">
					<!-- 여기부터 반복 구간 -->
<%					if(!list.isEmpty()){
						for(int i=0; i<list.size(); i++){
%>
						<hr>
						<div class="comment_item">
							<div><span><%=list.get(i).getWriter() %></span></div>
							<div><%=list.get(i).getContent() %></div>
							<div class="cmt_info">
								<span class="cmt_date"><%=list.get(i).getCdate() %></span>
								<span><a href="#" class="btn_comment_like"><img src="<%=request.getContextPath()%>/img/comment_like.png"> <%=list.get(i).getBlike() %></a></span>
								<span><a href="#" class="btn_comment_like"><img src="<%=request.getContextPath()%>/img/comment_like.png" class="hate"> <%=list.get(i).getBhate() %></a></span>
							</div>
						</div>
<%
						}
					}
%>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/template/footer.jsp" flush="false"/>
</body>
</html>