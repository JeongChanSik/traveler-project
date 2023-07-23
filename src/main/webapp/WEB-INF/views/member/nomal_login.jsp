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

	
	//ID/비밀번호 유효성 검사
	function userlogin(f) {
		var id = f.id.value.trim();
		var pw = f.pw.value.trim();
		
		if(id==''){
			alert('아이디를 입력해주세요.');
			return;
		}
		if(pw==''){
			alert('비밀번호를 입력해주세요.');
			return;
		}
		
		var url ='userlogin.do';
		var param="id="+id + "&pw="+pw;
		
		sendRequest(url,param,C_login,"POST");
	}
	//로그인 콜백 메서드
		function C_login() {
			if(xhr.readyState ==4 && xhr.status==200){
				
				var data = xhr.responseText;
				var json = (new Function('return'+data))();
				
				if(json[0].check == 'id_null'){
					alert('해당 아이디는 존재하지 않습니다.');
					return;
				} else if(json[0].check == 'pw_error'){
					alert('비밀번호가 일치하지 않거나 틀립니다.');
					return;
				} else if(json[0].check == 'admin'){
					alert('관리자계정은 관리자 페이지에서 로그인 해주세요.')
					return;
				}else{
					location.href="mainpage.do";
					//나중에 메인화면으로 연결할것.
				}
			}
		}	
	//

</script>
<style type="text/css">
	body{
	margin: 0;
	}

	.body{
		margin-bottom: 600px;
	}
	#login_table{
		position:absolute;
		top:32%;
		left:36%;
	}
	#button_table{
		position: absolute;
		top:45%;
		left:35.9%;
	}
	#login_button{
		width: 14cm; 
		height: 1cm;
		border: 1px solid black;
		background-color: black;
		color: white;
		font-size: 16px;
		cursor:pointer;
	}
	#button{
		width: 4.5cm; 
		height: 1cm;
		border: 1px solid black;
		background-color: black;
		color: white;
		font-size: 16px;
		cursor:pointer;
	}	
	
	
	#login_img{
    position: absolute;
    top: 177px;
    left: 875px;
    width: 4cm;
    height: 4cm;
	}
</style>
	

</head>
<body>
		<!-- 통상 로그인 -->
	<img id="login_img" alt="login" src="resources/img/mypage_login.png">
	<form class="body">
		<table border="1" id="login_table" style="width: 14.3cm">
			<caption>로그인<!-- 후에 이미지로 수정하던가 변경. --></caption>
			<tr >
				<th style="border: hidden">아이디</th>
				<td style="border: hidden"><input name="id" style="width: 11.9cm"></td>
			</tr>
			<tr >
				<th style="border: hidden">비밀번호</th>
				<td style="border: hidden"><input name="pw" type="password" style="width: 11.9cm"></td>
			</tr>
			<tr>
				<td colspan="5" align="center" style="border: hidden;">
				<input id="login_button" type="button" value="로그인" onclick="userlogin(this.form)">
				</td>
			</tr>
		</table>
		<table border="1" id="button_table" style="border: hidden;">
			<tr>
				<td colspan="5" align="center" style="border: hidden;">
				<input id="button" type="button" value="아이디 찾기" onclick="location.href='Mid_find.do'" style="width: 4.5cm; height: 1cm">
				|
				<input id="button" type="button" value="비밀 번호 찾기" onclick="location.href='Mpw_find.do'" style="width: 4.5cm; height: 1cm">
				|
				<input id="button" type="button" value="회원 가입" onclick="location.href='Member_insert.do'" style="width: 4.5cm; height: 1cm">
				</td>
			</tr>
		</table>
			<!-- 배너 및 로고 등의 요소 추가(필요시) -->
	</form>
	<%@include file ="/WEB-INF/views/main/footer.jsp" %>
</body>
</html>