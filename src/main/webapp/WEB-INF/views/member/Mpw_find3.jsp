<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</script>
<style type="text/css">
	.body{
		position: absolute;
		top: 45px;
		left: 110px;	
	}
	#button{
		width: 1.6cm; 
		height: 0.8cm;
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
			<table align="center">
				<tr>
					<td>변경이 완료되었습니다.</td>
					<td><input id="button" type="button" value="닫기" onclick="nomal_login()"></td>
				</tr>
			</table>
		</form>
</body>
</html>