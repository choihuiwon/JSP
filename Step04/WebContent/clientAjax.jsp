<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn").click(function () {
            var url = "AjaxTest.jsp";
            $.ajax({
                url: url,
                //data: data,
                type:'get',
                success: function result(data){
                    alert(data);
                    $( "#result" ).html( data );
                }
           });
            
        });
	});
</script>
</head>
<body>
	<a href="#" id="btn">ajax 테스트</a>
	<div id="result"></div>
</body>
</html>