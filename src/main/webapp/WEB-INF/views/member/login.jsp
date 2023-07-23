<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/WEB-INF/views/main/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

body{
	margin: 0;
	
}
	.body{
		margin-bottom: 600px;
	}
	#login_table{
		position:absolute;
		top:40%;
		left:37%;
	}
	#button{
		width: 6.5cm; 
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
	<!-- 버튼 2개 제작 -> 어드민 로그인과 통상 로그인 두개 버튼 만들어서 각기 위치로 이동. -->
	<!-- 이미지등의 삽입등의 디자인 수정은 추후에. -->
	<form class="body">
		<table border="1" id="login_table" style="border: hidden;">
		<caption><!-- 로고 이미지 삽입 --></caption>
		<tr>
			<td style="border: hidden;">
			<input id="button"  type="button" value="일반 로그인" onclick="location.href='nomal_login.do'">
			</td>
			<td style="border: hidden;">
			<input  id="button" type="button" value="관리자 로그인" onclick="location.href='admin_login.do'">
			</td>
		</tr>		
		</table>
		<!-- 배너 및 로고 등의 요소 추가(필요시) --> 
	</form>
	<%@include file ="/WEB-INF/views/main/footer.jsp" %>
</body>
</html>