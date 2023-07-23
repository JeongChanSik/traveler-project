<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/WEB-INF/views/main/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function find(f) {
		//아이디,이메일,전화번호 값을 받고, 해당 값이 저장된 idx를 찾아 비밀번호 정보를 수정할 수 있는 페이지로 이동.
		var id = f.id.value.trim();
		var tel = f.tel.value.trim();
		
		if(id==''){
			alert('아이디 정보는 필수 입니다.');
			return;
		}
		if(tel==''){
			alert('전화번호 정보는 필수 입니다.');
			return;
		}
		
		var url="";
		var windowTargetName="Find_PW";
		var features="width=480, height=140, left=100, right=50, location=no, resizable=no";
		window.open(url, windowTargetName, features);
		f.method="POST";
		f.action="f_pw.do"
		f.target=windowTargetName;
		f.submit();

	
	}
</script>
<style type="text/css">
body{
	margin: 0;
	
}
	.body{
		margin-bottom: 600px;
	}
	
	#find_table{
		position:absolute;
		top:32%;
		left:42.8%;
	}
		#button{
		width: 6.6cm; 
		height: 1cm;
		border: 1px solid black;
		background-color: black;
		color: white;
		font-size: 16px;
		cursor:pointer;
	}
	#pw_find{
	position: absolute;
	top: 240px;
    left: 915px;
    width: 1.5cm;
    height: 1.5cm;
	
	}
</style>
</head>
<body>
	<img id="pw_find" alt="pw_find" src="resources/img/pw_find.png">
	<form class="body">
		<table border="1" id="find_table">
			<caption>:::비밀번호 찾기:::</caption>
			<tr>
				<th style="border: hidden">아이디</th>
				<td style="border: hidden">
					<input name="id">	
				</td>
			</tr>
			<tr>
				<th style="border: hidden">전화번호</th>
				<td style="border: hidden">
					<input name="tel">	
				</td>
			</tr>
			<tr>
				<td colspan="5" style="border: hidden;" align="center">
					<input id="button" style="width: 6.6cm; height: 1cm" type="button" value="비밀번호 찾기" onclick="find(this.form)">
				</td>
			</tr>
		</table>
	</form>
<%@include file ="/WEB-INF/views/main/footer.jsp" %>
</body>
</html>