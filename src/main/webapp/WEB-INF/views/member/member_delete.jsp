<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function m_delete(f) {
	
		var id = f.id.value.trim();
		f.method="POST";
		f.action="m_delete.do";
		f.submit();


	}

</script>
	<style type="text/css">

	.body{
		position: absolute;
		top: 20px;
		left: 16px;
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
	#warning{
		position: absolute;
		width: 5cm;
		height: 5cm;
		opacity: 0.5;
    	left: 146px;
}
	
	}
	
	
	</style>

</head>
<body>
<img id="warning" alt="경고" src="resources/img/warning.png">
<form class="body">
	<input type="hidden" value="${vo.id }" name="id">
	<p align="center">정말로 회원 탈퇴를 진행하시겠습니까?<br></p>
<p align="center" style="color: red">※해당 내용을 진행 할 시 발생하는 결과는 되돌릴 수 없습니다.<br></p>
<p align="center"><button id="button" type="button" onclick="m_delete(this.form)"> 탈퇴하기</button></p>
</form>
</body>
</html>