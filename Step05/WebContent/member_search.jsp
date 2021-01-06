<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax json 처리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("button").click(function() {
			var data = $("#frm").serialize();
			$.ajax({
				url : "ServerAjax.jsp",
				data : data,
				method : "get",
				success : function(data) {
					var json = JSON.parse(data);
					console.log(json);
					var txt = "";
					for(i=0;i<json.result.length;i++){
						txt += json.result[i].id + " " +json.result[i].name + " " +
						json.result[i].age+" " +json.result[i].grade_name + "<br>";
					}
					console.log(txt);
					$("#area").html(txt);
				}
			});
		});
		$("input").keyup(function() {
			$("button").click();
		});
	});
</script>
</head>
<body>
	<form id="frm">
		<input type="text" name="name"><button type="button">검색</button>
	</form>
	<div id="area"></div>
</body>
</html>









