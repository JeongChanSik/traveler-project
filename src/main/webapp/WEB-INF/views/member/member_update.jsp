<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file ="/WEB-INF/views/main/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function update(f) {
	
	var id =f.id.value.trim();
	var pw =f.pw.value.trim();
	var c_pw =f.c_pw.value.trim();
	var name =f.name.value.trim();
	var email =f.email.value.trim();
	var tel =f.tel.value.trim();
	var birth =f.birth.value.trim();
	var member_idx = f.member_idx.value.trim();
	
	if(pw==''){
		alert('비밀번호를 입력해주세요');
		return;
	}
	
	if(c_pw!=pw){
		alert('비밀번호가 다릅니다!');
		return;
	}
	
	if(name==''){
		alert('이름을 입력해주세요.')
		return;
	}
	
	if(tel==''){
		alert('전화번호를 입력해주세요.')
		return;
	}
	
	if(birth==''){
		alert('생년월일을 입력해주세요(6자 혹은 8자)')
		return;
	}
	
	f.method="POST";
	f.action="member_update.do"
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
	
	#update_table{
		position:absolute;
		top:30%;
		left:42.4%;
	}
	#update_check{
		position: absolute;
		top:53%;
		left:42.25%;
	}
	
	#button{
		width: 7.8cm; 
		height: 1cm;
		border: 1px solid black;
		background-color: black;
		color: white;
		font-size: 16px;
		cursor:pointer;
	}
	
	#member_update{
	position: absolute;
    top: 185px;
    left: 906px;
    width: 2.5cm;
    height: 2.5cm;
	
	}	
	</style>
</head>
<body>
	<img id="member_update" alt="insert" src="resources/img/insert%26update.png">
<form class="body">
		<table border="1" id="update_table">
			<caption>:::정보 수정:::<!-- 이미지 있으면 추후 교체 --></caption>
			<tr>
				<th style="border: hidden">아이디</th>
					<td style="border: hidden">
					 <input name="id" value="${vo.id }" readonly="readonly">
					 <input name="member_idx" value="${vo.member_idx }" type="hidden">
					</td>
			</tr>
			<tr>
				<th style="border: hidden">비밀번호</th>
					<td style="border: hidden">
					 <input name="pw" type="password">
					</td>
			</tr>
						<tr>
				<th style="border: hidden">비밀번호 확인</th>
					<td style="border: hidden">
					 <input name="c_pw" type="password">
					</td>
			</tr>
			<tr>
				<th style="border: hidden">이름</th>
					<td style="border: hidden">
					 <input name="name">
					</td>
			</tr>
			<tr>
				<th style="border: hidden">E-Mail</th>
					<td style="border: hidden">
					 <input name="email">
					</td>
			</tr>
			<tr>
				<th style="border: hidden">전화번호</th>
					<td style="border: hidden">
					 <input name="tel">
					</td>
			</tr>
			<tr>
				<th style="border: hidden">생년월일</th>
					<td style="border: hidden">
					 <input name="birth">
					</td>
			</tr>
		</table>
		<table id="update_check">
			<tr>
				<td style="border: hidden" align="center" >
					<input id="button" type="button" value="수정 하기" onclick="update(this.form)">
					
				</td>
			</tr>
		</table>
	</form>

	<%@include file ="/WEB-INF/views/main/footer.jsp" %>
</body>
</html>