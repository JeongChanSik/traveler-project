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

	function admin_login(f) {
	
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
		
		var url ='adminlogin.do';
		var param="id="+id + "&pw="+pw;
		
		sendRequest(url,param,A_login,"POST");
	}
	//로그인 콜백 메서드
		function A_login() {
			if(xhr.readyState ==4 && xhr.status==200){
				
				var data = xhr.responseText;
				var json = (new Function('return'+data))();
				
				if(json[0].check == 'id_null'){
					alert('해당 아이디는 존재하지 않습니다.');
					return;
				} else if(json[0].check == 'pw_error'){
					alert('비밀번호가 일치하지 않습니다.');
					return;
				} else if(json[0].check == 'notadmin'){
					alert('관리자 계정만 로그인 할 수 있습니다.')
					return;
				}
				
				else{
					location.href="mainpage.do";
					//나중에 메인화면으로 연결할것.
				}
			}
		}	

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
		left:43%;
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

	#login_img{
    position: absolute;
    top: 177px;
    left: 880px;
    width: 4cm;
    height: 4cm;
	}	
</style>
</head>
<body>
		<!-- 어드민 로그인 -->
	<img id="login_img" alt="login" src="resources/img/mypage_login.png">
	<form class="body">
		<table border="1" id="login_table">
			<caption>관리자 로그인<!-- 후에 이미지로 수정하던가 변경. --></caption>
			<tr>
				<th style="border: hidden">아이디</th>
				<td style="border: hidden"><input name="id"></td>
			</tr>
			<tr>
				<th style="border: hidden">비밀번호</th>
				<td style="border: hidden"><input name="pw" type="password"></td>
			</tr>
			<tr>
				<td colspan="5" align="center" style="border: hidden;">
				<input  id="button" type="button" value="로그인" onclick="admin_login(this.form)">
				</td>
			</tr>
		</table>
			<!-- 배너 및 로고 등의 요소 추가(필요시) -->
	</form>
	<%@include file ="/WEB-INF/views/main/footer.jsp" %>
</body>
</html>