<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function change_pw() {
	
	var pw = f.pw.value.trim();
	var c_pw = f.c_pw.value.trim();
	var member_idx = f.member_idx.value.trim();
	
	//유효성 체크
	if(pw==''){
		alert('바꿀 비밀번호를 입력해주세요.');
		return;
	}
	
	if(pw!=c_pw){
		alert('입력한 비밀번호가 일치하지 않습니다!');
		return;
	}
	
	f.submit();

}
</script>

	<style type="text/css">
	.body{
		position: absolute;
		top: 12px;
		left: 68px;
	}
	
	#button{
		width: 4.2cm; 
		height: 1cm;
		border: 1px solid black;
		background-color: black;
		color: white;
		font-size: 16px;
		cursor:pointer;
		
		position: absolute;
		top: 75px;
		left: 97px;
	}
		
	</style>
</head>
<body>
	<!-- 비밀번호 찾기-> 업데이트 형식으로 수정하기. -->
	<form name="f" method="POST" action="change_pw.do">
			<input type="hidden" name="member_idx" value="${idx}" >
		<table class="body">
			<tr>
				<th>비밀번호 변경 </th>
				<td><input name="pw" type="password"></td>
			</tr>
			<tr>
				<th>비밀번호 변경 확인 </th>
				<td><input name="c_pw" type="password"></td>
			</tr>
			<tr>
				<td>
					<input id="button" type="button" value="비밀번호 변경" onclick="change_pw()" > 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>