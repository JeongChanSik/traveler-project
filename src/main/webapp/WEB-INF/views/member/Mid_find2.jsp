<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function nomal_login() {
		opener.location.href='nomal_login.do';
		window.close();
	}
	
	function Mpw_find() {
		opener.location.href='Mpw_find.do';
		window.close();
	}

</script>

	<style type="text/css">
		#button{
		width: 4.2cm; 
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
		<form>
			<table border="1" align="center" style="border: hidden;">
				<tr>
					<th style="border: hidden;">탐색된 계정 : </th>
					<td style="border: hidden;" >${id}</td>
				</tr>
			</table>
			<!-- 닫는 버튼 만들어야함 + 팝업 닫힐 때 메인페이지를 노말 로그인 화면으로 변경해야함 + 닫는 버튼 누르면 팝업 닫히게해야함. -->
			<table border="1" align="center" style="border: hidden;">
				<tr>
					<td style="border: hidden;" >
					<input id="button" type="button" value="로그인 하기" onclick="nomal_login()" >
					</td>			
					<td style="border: hidden;" >
					<input id="button" type="button" value="비밀번호 찾기" onclick="Mpw_find()">
					</td>			
				</tr>
			</table>
		</form>

</body>
</html>