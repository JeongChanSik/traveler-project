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
	//중복체크 확인용
	var id_check=false;
	//어드민 확인용
	var admin = "admin";
	function check() {
		//중복체크
		var id = document.getElementById("id").value.trim();
		if(id.indexOf(admin) !== -1){
			alert('admin이 들어가는 아이디는 사용할 수 없습니다!')
			alert('관리자 계정은 DB에서 추가해주세요.')
			//어드민 계정은 DB에서 추가하기.
			return;
		}
		if(id==''){
			alert('아이디를 입력해주세요.');
			return;
		}
			var url = "id_check.do";
			var param= "id="+encodeURIComponent(id);
			
			sendRequest(url,param,C_id,"POST");	
	}//check end
	
	function C_id() {
		if(xhr.readyState==4&&xhr.status==200){
		
			var data = xhr.responseText;
			var json = (new Function('return'+data))();
			
			if(json[0].res=='no'){
				alert('이미 사용중인 아이디입니다.');
				return;
			}else{
				alert('사용 가능한 아이디 입니다.');
				id_check=true;
			}
		}
	}//c_id end
	
	function recheck() {
		id_check=false;
	}
	
	function insert(f) {
		
		var id =f.id.value.trim();
		var pw =f.pw.value.trim();
		var c_pw =f.c_pw.value.trim();
		var name =f.name.value.trim();
		var email =f.email.value.trim();
		var tel =f.tel.value.trim();
		var birth =f.birth.value.trim();
		
		if(id==''){
			alert('아이디를 입력해주세요.');
			return;
		}
		
		if(!id_check){
			alert('아이디 중복여부를 확인해주세요!')
			return;
		}
		
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
		f.action="insert.do"
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
	
	#insert_table{
		position:absolute;
		top:30%;
		left:40%;
	}
	#insert_check{
		position: absolute;
		top:53%;
		left:39.9%;
	}
		#button{
		width: 9.8cm; 
		height: 1cm;
		border: 1px solid black;
		background-color: black;
		color: white;
		font-size: 16px;
		cursor:pointer;
	}
	#member_insert{
	position: absolute;
	top: 190px;
    left: 905px;
    width: 2.5cm;
    height: 2.5cm;
	
	}	
	</style>
</head>
<body>
	<img id="member_insert" alt="insert" src="resources/img/insert%26update.png">
	<form class="body">
		<table border="1" id="insert_table">
			<caption>:::회원 가입:::<!-- 이미지 있으면 추후 교체 --></caption>		
			<tr>
				<th style="border: hidden">아이디</th>
					<td style="border: hidden">
					 <input name="id" id="id" onchange="recheck()">
					 <input type="button" value="중복 체크" onclick="check()">
					 <!-- id중복체크 여부 확인 -->
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
		<table id="insert_check">
			<tr>
				<td style="border: hidden" align="center" >
					<input id="button" type="button" value="가입 하기" onclick="insert(this.form)">
					
				</td>
			</tr>
		</table>
	</form>
<%@include file ="/WEB-INF/views/main/footer.jsp" %>
</body>
</html>