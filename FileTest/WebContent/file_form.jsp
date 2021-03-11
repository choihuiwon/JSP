<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		var count = 3;//첨부파일 태그 개수
		$("#plus").click(function(){
			if(count == 5) return;
			count++;
			$("#frm").append("<p><input type='file' name='file"+count+"'></p>");
		});
		$("#minus").click(function(){
			if(count == 1) return;
				$(this).parent().parent().children("p").last().remove();
			count--;
		});
	});
</script>
</head>
<body>
	<form action="upload.do"  enctype="multipart/form-data" method="post" id="frm">
		<p><input type="text" name="writer" placeholder="작성자"></p>
		<p><button>전송</button></p>
		<p><input type="file" name="file1"> 
		<button type="button" id="plus">+</button> <button type="button" id="minus">-</button></p>
		<p><input type="file" name="file2"></p>
		<p><input type="file" name="file3"></p>
		
	</form>
</body>
</html>








