<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/main/header.jsp" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Q&A 글쓰기</title>
		
		<style>
			#insert_form_body{
				margin: 0;
				font-family: 'Noto Sans KR', sans-serif;
			}
			#insert_h1{
				padding: 20px 0px 20px 460px;
				margin-top: 70px;
				margin-bottom: 0;
				font-weight: 800;
			}
			#insert_form{
				width: 980px;
				margin: 0 auto 200px;
			}
			#insert_table{
				border-collapse: collapse;
				width: 980px;
				margin: 0 auto 100px;
				
			}
			.insert_subject{
				/* width: 650px; */
				margin-left: 5px;
				height: 30px;
				border-radius: 0;
				border: 1px solid #D8D8D8;
			}
			.insert_th{
				border-top: 1px solid black;
				width: 100px;
				height: 50px;
			}
			.insert_td{
				border-top: 1px solid black;
				height: 50px;
			}
			.insert_name{
				margin-left: 5px;
				height: 30px;
				border-radius: 0;
				border: none;
			}
			.insert_content{
				resize: none;
				border-radius: 0;
				border: 1px solid #D8D8D8;
				margin: 5px 0px 5px 5px;
			}
			.insert_password{
				margin-left: 5px;
				height: 30px;
				border-radius: 0;
				border: 1px solid #D8D8D8;
			}
			.insert_btn{
				width: 120px;
				height: 40px;
				border: 1px solid black;
				background-color: black;
				color: white;
				font-size: 16px;
				cursor:pointer;
				margin-right: 5px;
			}
		</style>
		
		<script>
		function send_check(f) {
			var subject = f.subject.value.trim();
			var name = f.name.value.trim();
			var content = f.content.value.trim();
			var pwd = f.pwd.value.trim();
			
			//유효성 검사
			if(subject == '') {
				alert('제목을 입력해주세요');
				return;
			}
			if(name == '') {
				alert('이름을 입력해주세요');
				return;
			}
			if(content == '') {
				alert('내용을 입력해주세요');
				return;
			}
			if(pwd == '') {
				alert('비밀번호를 입력해주세요');
				return;
			}
			
			f.method = "POST";
			f.action = "q_insert.do";
			f.submit();
		}
		</script>
	</head>
	<body id="insert_form_body">
		<h1 id="insert_h1">질문등록</h1>
		<form id="insert_form">
			<input type="hidden" name="member_idx" value="${vo.member_idx}">
			<table id="insert_table" align="center">
				<tr>
					<th class="insert_th">제목</th>
					<td class="insert_td"><input class="insert_subject" name="subject"></td>
				</tr>
				<tr>
					<th class="insert_th">작성자</th>
					<td class="insert_td"><input class="insert_name" name="name" value="${vo.name}" readonly></td>
				</tr>
				<tr>
					<th class="insert_th">내용</th>
					<td class="insert_td"><textarea class="insert_content" name="content" rows="20" cols="70"></textarea></td>
				</tr>
				<tr>
					<th class="insert_th">비밀번호</th>
					<td class="insert_td"><input class="insert_password" name="pwd" type="password"></td>
				</tr>
				<tr>
					<td class="insert_td" colspan="2" align="right">
						<input class="insert_btn" type="button" value="등록" onclick="send_check(this.form);" style="cursor:pointer;">
						<input class="insert_btn" type="button" value="취소" onclick="location.href='q_qna_list.do'" style="cursor:pointer;">
					</td>
				</tr>
			</table>
		</form>
		
	<%@ include file="/WEB-INF/views/main/footer.jsp" %>
	</body>
</html>