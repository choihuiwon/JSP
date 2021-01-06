<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax를 이용한 검색처리</title>
<style type="text/css">
	span{
		display: inline-block;
		width: 200px;
	}
	p{
		padding:10px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("button").click(function() {
			var data = $("#frm").serialize();
			$.ajax({
				url:"ServerAjax.jsp",
				data:data,
				method:'get',
				success:function(data){
					data = data.replaceAll("\n","");
					console.log(data);
					var arr = data.split(",");
					console.log(arr);
					var result = "";
					for(i=0;i<arr.length;i++){
						var str = arr[i].split(" ");
						console.log(str);
						result += "<p>";
						for(j=0;j<str.length;j++){
							result += "<span>" + str[j] + "</span>";
						}
						result += "</p>";
						
					}
					$("#area").html(result);
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