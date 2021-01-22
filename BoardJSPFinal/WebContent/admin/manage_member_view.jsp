<%@page import="java.util.List"%>
<%@page import="vo.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Member Page</title>
<style>
	#main{
		height: 600px;
	}
	.container{
	width:1200px;
	margin:0px auto;
	padding-top:30px;
	box-sizing: border-box;
	}
	#menu_bar{
		width:1200px;
		box-sizing: border-box;
		text-align: center;
	}
	#menu_bar > select{
		width:150px;
		padding:5px;
		margin-right:5px;
	}
	#menu_bar > input{
		width:200px;
		padding:5px;
		margin-right:5px;
	}
	#menu_bar > button{
		width:100px;
		padding:5px;
	}
	#title{
		font-size:0px;
		padding:0;
	}
	#title > li{
		width: 230px;
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
		width:230px;
		text-align: center;
		padding:10px;
		box-sizing: border-box;
	}
	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";

// 수정
function update_member(obj){
	// 현재 버튼이 속해있는 tr을 선택, 인덱스 번호 조회
	var parent = $(obj).parent().parent();
	var data = "";
	$.each(parent.find("input"),function(i, o){
		// 데이터 조립 쿼드스트링
		data += $(o).attr("name") + "=" + $(o).val() + "&"; 
	});
	console.log(data);
	// ajax를 이용하여 삭제 처리 -> AjaxDeleteMember.jsp --> MemberService -> MemberDao
	$.ajax({
//		url : contextPath+"/admin/process/AjaxUpdateMember.jsp",
		url : "adminUpdateMember.do",
		data : data,
		method : 'get',
		success : function(d){
			d = Boolean(d);
			if(d)
				alert("수정 완료");
			else
				alert("수정 실패");
			// 이 사이에 수정사항이 있을 수 있으니 최신화 해줘야함 그전에 form(search)를 초기화 해줘야 함
			$("#search")[0].reset();
			$("#btn_submit").click();
		}
	});
}

// 삭제
function delete_member(obj){
	// 현재 버튼이 속해있는 tr을 선택, 인덱스 번호 조회
	var parent = $(obj).parent().parent();
	var data = "id=" + parent.find("input").first().val();
	//console.log(data1);
	// ajax를 이용하여 수정 처리 -> AjaxUpdateMember.jsp --> MemberService -> MemberDao
	$.ajax({
//		url : contextPath+"/admin/process/AjaxDeleteMember.jsp",
		url : "adminDeleteMember.do",
		data : data,
		method : 'get',
		success : function(d){
			d = Boolean(d);
			if(d)
				alert("삭제 완료");
			else
				alert("삭제 실패");
			// 이 사이에 수정사항이 있을 수 있으니 최신화 해줘야함 그전에 form(search)를 초기화 해줘야 함
			$("#search")[0].reset();
			$("#btn_submit").click();
		}
	});
}


$(function() {	// 지금 이안에 있는 코드 들은 페이지가 로드 되었을때 한번만 실행됨 두번 수정하려고 하면 이제 안됨
	$("#btn_submit").click(function(e) {
		var data = $("#search").serialize();//kind=id&name=검색어
		$.ajax({
//			url : contextPath+"/admin/process/AjaxSearchProcess.jsp",
			url : "adminSearchMember.do",
			data : data,
			method : 'get',
			success : function(d) {
				var json = JSON.parse(d);
				var result = "";
				var arr = json.result;
				for(i=0;i<json.result.length;i++){
					result += "<tr><td>"+arr[i].id+"<input type='hidden' name='id' value='" +arr[i].id+"'></td>"
					+ "<td><input type='text' name='name' value='"+arr[i].name+"'></td>"
					+ "<td><input type='text' name='age' value='"+arr[i].age+"'></td>"
					+ "<td><input type='text' name='grade' value='"+arr[i].grade+"'></td>"
					+ "<td><a href='#' class='update'>수정</a> / <a href='#' class='delete'>삭제</a></td>"
					+ "</tr>";
				}
				
				$("#content_area").html(result);
				// 수정 버튼 클릭시
				$(".update").click(function(){
					update_member($(this));
				});
				// 삭제 버튼 클릭시
				$(".delete").click(function(){
					delete_member($(this));
				});
			}
		});
		e.preventDefault();	
	});
	
	// 수정 버튼 클릭시
	$(".update").click(function(){
		update_member($(this));
	});
	
	// 삭제 버튼 클릭시
	$(".delete").click(function(){
		delete_member($(this));
	});
});	
</script>

</head>
<body>
	<c:if test="${sessionScope.login eq null || sessionScope.login eq false || sessionScope.id ne 'admin'}">
		<script>
			alert("관리자만 이용할 수 있습니다.");
			location.href="../member/login.jsp";
		</script>
	</c:if>
	<jsp:include page="../template/header.jsp" flush="false"/>
	<div id="main">
		<div class="container">
			<div id="menu_bar">
				<form id="search">
					<select name="kind">
						<option value="id">아이디</option>
						<option value="name">이름</option>
						<option value="grade">등급</option>
					</select>
					<input type="text" name="search">
					<button id="btn_submit">검색</button>
				</form>
			</div>
			<hr>
			<div id="content">
				<ul id="title">
					<li>아이디</li>
					<li>이름</li>
					<li>나이</li>
					<li>등급</li>
					<li>비고</li>
				</ul>
				<hr>
				<div id="content_area">
					<table>
					<c:forEach var="vo" items="${requestScope.list }">
						<tr class="ul_content"> 
								<td>${vo.id }<input type="hidden" name="id" value="${vo.id }"></td>
								<td><input type="text" name="name" value="${vo.name }"></td>
								<td><input type="text" name="age" value="${vo.age }"></td>
								<td><input type="text" name="grade" value="${vo.grade }"></td>
								<td>
									<a href="#" class="update">수정</a> / <a href="#" class="delete">삭제</a>  
								</td>
							</tr>
					</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../template/footer.jsp" flush="false"/>
</body>
</html>