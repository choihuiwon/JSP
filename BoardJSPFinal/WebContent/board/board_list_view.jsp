<%@page import="dao.BoardDao"%>
<%@page import="service.BoardService"%>
<%@page import="dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
	<jsp:include page="../template/header.jsp" flush="false"/>
	<div id="main">
		<p style="font-size: 44px">Board List</p>
		<div id="content">
			<hr>
			<table class="board">
				<tr>
					<th>글번호</th>
					<th class="title">제목</th>
					<th class="writer">작성자</th>
					<th class="date">작성일</th>
					<th>조회수</th>
					<th><a href="boardListView.do?mode=blike&pageNo=${requestScope.pageNo }">좋아요</a></th>
					<th><a href="boardListView.do?mode=bhate&pageNo=${requestScope.pageNo }">싫어요</a></th>
				</tr>
				<c:forEach var="dto" items="${requestScope.list }">
				<tr>
					<td>${dto.bno }</td>
					<td><a href="boardView.do?bno=${dto.bno }">${dto.title } [${dto.comment_count }]</a></td>
					<td>${dto.writer }</td>
					<td>${dto.bdate }</td>
					<td>${dto.bcount }</td>
					<td>${dto.blike }</td>
					<td>${dto.bhate }</td>
				</tr>					
				</c:forEach>
				
				<tr>
					<td colspan="7">
						<div class="page_bar">
							<!-- 페이징 처리 시작 -->
							<c:if test="${requestScope.pageVo.previousPageGroup }">
							<a href="boardListView.do?pageNo=${ requestScope.pageVo.startPageOfPageGroup-1}&mode=${requestScope.mode}">◀</a>
							</c:if>
							<!-- 현재 페이지 그룹의 첫번째 페이지 -1 == 이전 페이지 그룹의 마지막 페이지 -->
							<c:forEach var="i" begin="${requestScope.pageVo.startPageOfPageGroup }" end="${requestScope.pageVo.endPageOfPageGroup }">
								<c:choose>
								<c:when test="${requestScope.pageNo eq i }">
									<a style="font-weight:bold;color:blue;">${i }</a>
								</c:when>
								<c:otherwise>
									<a href="boardListView.do?pageNo=${i }&mode=${requestScope.mode}">${i }</a>
								</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${requestScope.pageVo.nextPageGroup eq true}">
								<a href="boardListView.do?pageNo=${requestScope.pageVo.endPageOfPageGroup+1 }&mode=${requestScope.mode}">▶</a>
							</c:if>
							<!-- 페이징 처리 종료 -->
							<c:if test="${sessionScope.login ne null && sessionScope.login eq true }">
								<a href="board/board_write_view.jsp" class="btn_writer">글쓰기</a>
							</c:if>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="../template/footer.jsp" flush="false"/>
</body>
</html>