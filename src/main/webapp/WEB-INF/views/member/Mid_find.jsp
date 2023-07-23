<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/WEB-INF/views/main/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">
		function find(f) {
		//id를 찾기 위해 이름, 전화번호를 입력하고 입력받은 데이터를 넘겨주는 역할. 
		
		var name = f.name.value.trim();
		var tel = f.tel.value.trim();
		
		if(name==''){
			alert('이름 정보는 필수 입니다.');
			return;
		}
		if(tel==''){
			alert('전화번호 정보는 필수 입니다.');
			return;
		}
		
		var url="";
		var windowTargetName="Find_ID";
		var features="width=350, height=120, left=100, right=50, location=no, resizable=no";
		window.open(url, windowTargetName, features);
		f.method="POST";
		f.action="f_id.do"
		f.target=windowTargetName;
		f.submit();


		
		/* window.open("Mid_find2.jsp","아이디 찾기","width=400, height=300, left=100, right=50");*/
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
	#id_find{
	position: absolute;
    top: 230px;
    left: 930px;
    width: 1.5cm;
    height: 1.5cm;
	
	}

</style>

</head>
<body>
	<img id="id_find" alt="id_find" src="resources/img/id_find.png">
	<form class="body">
		<table border="1" id="find_table">
			<caption>:::아이디 찾기:::</caption>
			<tr>
				<th style="border: hidden">이름</th>
				<td style="border: hidden"><input name = "name"></td>
			</tr>
			<tr>
				<th style="border: hidden">전화번호</th>
				<td style="border: hidden"><input name = "tel"></td>
			</tr>
			<tr>
				<td colspan="5" style="border: hidden;" align="center">
				<input id="button" style="width: 6.6cm; height: 1cm" type="button" value="아이디 찾기" onclick="find(this.form)">
				</td>
			</tr>
		</table>
	</form>
<%@include file ="/WEB-INF/views/main/footer.jsp" %>
</body>
</html>