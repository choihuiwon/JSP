<%@page import="dto.CommentDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.BoardDto"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				url : "boardLikeHate.do",
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
				url : "commentInsert.do",
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
	<jsp:include page="../template/header.jsp" flush="false"/>
	<div id="main">
		<div id="board_view_area">
			<table>
				<tbody>
					<tr>
						<td>글번호 ${requestScope.dto.bno }</td>
						<td></td>
						<td></td>
						<td colspan="2">작성일 ${requestScope.dto.bdate }</td>
					</tr>
					<tr>
						<td>조회수 ${requestScope.dto.bcount }</td>
						<td>좋아요</td>
						<td id="like">${requestScope.dto.blike }</td>
						<td>싫어요</td>
						<td id="hate">${requestScope.dto.bhate }</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>${requestScope.dto.title }</td>
						<td></td>
						<td>작성자</td>
						<td>${requestScope.dto.writer }</td>
					</tr>
					<tr>
						<td colspan="5">내용</td>
					</tr>
					<tr>
						<td colspan="5"><textarea readonly>${requestScope.dto.content }</textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td colspan="4">
						<c:forEach var="item" items="${requestScope.fList }">
							<a href="filedownload.jsp?writer=${item.writer }&file=${item.fileName}">${item.fileName }</a><br>
							<!-- 해당 파일이 이미지인지 -->
							<c:if test="${item.type eq 'image' }">
								<img src="imageLoad.do?writer=${item.writer }&file=${item.fileName}&type=${item.type}">
<%-- 								<img src="filedownload.jsp?writer=${item.writer }&file=${item.fileName}"> --%>
							
							</c:if>
						</c:forEach>
						</td>
					</tr>
					<tr style="text-align: center">
						<td><a href="#" class="btn">이전글</a></td>
						<c:choose>
						<c:when test="${sessionScope.login ne null && sessionScope.login eq true && sessionScope.id eq requestScope.dto.writer }">
						<td><a href="#" class="btn">수정</a></td>
						<td><a href="deleteBoard.do?bno=${requestScope.dto.bno }" class="btn">삭제</a></td>
						</c:when>
						<c:otherwise>
						<td colspan="2"><a href="#" class="btn_like"><img src="${pageContext.request.contextPath }/src/img/like.png" class="hate"></a>
						<a href="#" class="btn_like"><img src="${pageContext.request.contextPath }/src/img/like.png"></a></td>
						</c:otherwise>
						</c:choose>
						<td><a href="#" class="btn">다음글</a></td>
						<td><a href="boardListView.do?flag=true" class="btn">목록보기</a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="comment_view_area">
			<form id="comment_form">
				<div id="comment_write">
					<input type="hidden" name="bno" value="${requestScope.dto.bno }">
					<input type="hidden" name="writer" value="${sessionScope.id }">
					<div><span>${sessionScope.id }</span></div>
					<hr>
					<div style="text-align: right;">
						<textarea name="content" class="comment" placeholder="주제와 무관한 댓글이나 악플은 경고조치 없이 삭제되며 징계 대상이 될 수 있습니다." maxlength="50"></textarea>
					</div>
					<div style="text-align: right;"><span id="input_size">1/50</span></div>
					<hr>
					<div style="text-align: right;"><a href="#" class="btn_write_cmt" class="btn" style="margin:0 0;">등록</a></div>
				</div>	
				<div id="comment_list">
				<c:if test="${ !empty requestScope.list}">
					<c:forEach var="dto" items="${requestScope.list }">
						<hr>
						<div class="comment_item">
							<div><span>${dto.writer }</span></div>
							<div>${dto.content }</div>
							<div class="cmt_info">
								<span class="cmt_date">${dto.cdate }</span>
								<span><a href="#" class="btn_comment_like"><img src="${pageContext.request.contextPath }/src/img/comment_like.png"> ${dto.blike }</a></span>
								<span><a href="#" class="btn_comment_like"><img src="${pageContext.request.contextPath }/src/img/comment_like.png" class="hate"> ${dto.bhate }</a></span>
							</div>
						</div>
					</c:forEach>
				</c:if>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="..//template/footer.jsp" flush="false"/>
</body>
</html>