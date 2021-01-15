<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	li{
		width: 230px;
		font-size:16px;
		display: inline-block;
		text-align: center;
		font-weight: bold;
		padding:10px;
		box-sizing: border-box;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
// 수정
function update_employee(obj){
	// 현재 버튼이 속해있는 tr을 선택, 인덱스 번호 조회
	var parent = $(obj).parent().parent();
	var data = "";
	$.each(parent.find("input"),function(i, o){
		// 데이터 조립 쿼드스트링
		data += $(o).attr("name") + "=" + $(o).val() + "&"; 
	});
	console.log(data);
	$.ajax({
		url : "update.do",
		data : data,
		method : 'get',
		success : function(d){
			alert(d);
			// 이 사이에 수정사항이 있을 수 있으니 최신화 해줘야함 그전에 form(search)를 초기화 해줘야 함
			$("#frm_search")[0].reset();
			$("#btn_search").click();
		}
	});
}

//삭제
function delete_employee(obj){
	// 현재 버튼이 속해있는 tr을 선택, 인덱스 번호 조회
	var parent = $(obj).parent().parent();
	var data = "id=" + parent.find("input").first().val();
	//console.log(data1);
	$.ajax({
		url : "delete.do",
		data : data,
		method : 'get',
		success : function(d){
			alert(d);
			// 이 사이에 수정사항이 있을 수 있으니 최신화 해줘야함 그전에 form(search)를 초기화 해줘야 함
			$("#frm_search")[0].reset();
			$("#btn_search").click();
		}
	});
}

$(function(){
	$("#btn_search").click(function(){
		var data = $("#frm_search").serialize();
		$.ajax({
			url : "search.do",
			data : data,
			method : "get",
			success : function(d){
				var json = JSON.parse(d);
				arr = json.list;
				tag = "<table>";
				for(i=0; i<arr.length; i++){
					tag += "<tr><td>" + arr[i].eno + "</td>"
						 + "<td>" + arr[i].name + "</td>" 
						 + "<td>" + arr[i].department + "</td>" 
						 + "<td>" + arr[i].position + "</td>" 
						 + "<td>" + arr[i].salary + "</td></tr>"; 
				}
				tag += "</table>";
				$("#content_area").html(tag);
				
				// 수정 버튼 클릭시
				$(".update").click(function(){
					update_employee($(this));
				});
				// 삭제 버튼 클릭시
				$(".delete").click(function(){
					delete_employee($(this));
				});
			}
		});
	});
	
	// 수정 버튼 클릭시
	$(".update").click(function(){
		update_employee($(this));
	});
	// 삭제 버튼 클릭시
	$(".delete").click(function(){
		delete_employee($(this));
	});
});
</script>
</head>
<body>
<c:choose>
	<c:when test="${sessionScope.department eq '인사' && sessionScope.position > 3}">
		인사관리 시스템에 로그인 하셨습니다.<br>
		로그인 정보 : ${sessionScope.name } ${sessionScope.position_name } <a href="logout.do">로그아웃</a> <br>
		<hr>
		<form id="frm_search">
			<select name="kind">
				<option value="name">이름</option>
				<option value="eno">사번</option>
				<option value="department">부서</option>
			</select>
			<input type="text" name="search"> <button id="btn_search">검색</button>
		</form>
		<div id="title">
			<ul>
				<li>사번</li>
				<li>이름</li>
				<li>부서</li>
				<li>직급</li>
				<li>연봉</li>
				<li>비고</li>
			</ul>
		</div>
		<hr>
		<div>
		<form id="frm_insert">
			<ul>
				<li><input type="text" name="eno"></li>
				<li><input type="text" name="name"></li>
				<li><input type="text" name="department"></li>
				<li>
					<select>
						<option value="1">사원</option>
						<option value="2">주임</option>
						<option value="3">대리</option>
						<option value="4">과장</option>
						<option value="5">차장</option>
						<option value="6">부장</option>
						<option value="7">사장</option>
					</select>
				</li>
				<li><input type="text" name="salary"></li>
				<li><input type="button" id="btn_insert" value="사원등록"></li>
			</ul>
		</form>
		</div>
		<div id="content_area">
			<table>
				<c:forEach var="dto" items="${requestScope.list }">
					<tr>
						<td>${dto.eno }<input type="hidden" name="eno" value="${dto.eno }"></td>
						<td><input type="text" name="name" value="${dto.name }"></td>
						<td><input type="text" name="department" value="${dto.department }"></td>
						<td><input type="text" name="position" value="${dto.position }"></td>
						<td><input type="text" name="salary" value="${dto.salary }"></td>
						<td><a href="#" class="update">수정</a>/<a href="#" class="delete">삭제</a></td>
					</tr>
					
				</c:forEach>
			</table>
		</div>
	</c:when>
	<c:otherwise>
		권한이 없습니다. <a href="logout.do">로그아웃</a> <br>
		관리자 모드는 인사과 과장 이상들만 접근하실 수 있습니다.
	</c:otherwise>
</c:choose>
</body>
</html>