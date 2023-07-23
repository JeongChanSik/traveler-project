<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function c_end() {
	opener.location.href='mypage.do';
	window.close();
}

</script>
<style type="text/css">
	#button{
		width: 2.2cm; 
		height: 1cm;
		border: 1px solid black;
		background-color: black;
		color: white;
		font-size: 16px;
		cursor:pointer;
	}
	
	#p1{
		position: absolute;
		top: 40px;
		left: 55px;
	}
	
	#p2{
		position: absolute;
		top: 80px;
		left: 122px;
	}

</style>
</head>
<body>
<p id="p1">이미지 등록이 완료되었습니다.<br></p>
<p id="p2"><button id="button" type="button" onclick="c_end()">확인</button></p>
</body>
</html>