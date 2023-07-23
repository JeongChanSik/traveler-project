<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function c_delete() {
		opener.location.href='mainpage.do';
		window.close();
	}

</script>

<style type="text/css">

	.body{
		position: absolute;
		top: 35px;
		left: 152px;
	}
	
	#button{
		width: 3.2cm; 
		height: 1cm;
		border: 1px solid black;
		background-color: black;
		color: white;
		font-size: 16px;
		cursor:pointer;
	}
</style>
</head>
<body>
<form class="body">
<p align="center">탈퇴가 완료되었습니다.<br></p>
<p align="center"><button id="button" type="button" onclick="c_delete()">확인</button></p>
</form>
</body>
</html>