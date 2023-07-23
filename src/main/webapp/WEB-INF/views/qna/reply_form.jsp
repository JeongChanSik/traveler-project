<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file = "/WEB-INF/views/main/header.jsp" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Q&A 답변달기</title>
		
		<style>
			.qna_reply_body {
				margin: 0;
				font-family: 'Noto Sans KR', sans-serif;
			}
			.reply_container{
				padding-top: 95px;
				padding-left: 455px;
			}
			#reply_tit{
				margin-left: 20px;
			}
			.reply_form{
				width: 980px;
				margin: 0 auto 100px;
			}
			#reply_table{
				border-collapse: collapse;
				width: 980px;
				margin: 0 auto 200px;
			}
			.reply_th_td {
				width: 100px;
				height: 50px;
				border-top: 1px solid black;
			}
			.reply_subject{
				font-size: x-large;
				font-weight: bold;
				margin-left: 5px;
				border: none;
				
			}
			.reply_name {
				margin-left: 10px;
				font-weight: bold;
				font-size: large;
				border: none;
			}
			#reply_content{
				border-radius: 0;
				border: 1px solid #D8D8D8;
				margin-left: 10px;
				margin: 5px 0px 5px 5px;
			}
			.reply_pwd{
				border-top: 1px solid black;
				height: 30px;
			}
			.reply_password_input {
				margin-left: 10px;
				border-radius: 0;
				border: 1px solid #D8D8D8;
			}
			.reply_btn {
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
		
		<script src="resources/js/httpRequest.js"></script>
		<script>
			function send_reply(f) {
				var content = f.content.value;
				var pwd = f.pwd.value;
				
				//유효성 검사
				if(content == '') {
					alert('내용을 입력해주세요.');
					return;
				}
				if(pwd == '') {
					alert('비밀번호를 입력해주세요.');
					return;
				}
				
				f.action = "q_reply.do";
				f.method = "POST";
				f.submit();
			}
		</script>
		
	</head>
	<body class="qna_reply_body">
		<div class="reply_container">
			<h3 id="reply_tit1">즐겨차키</h3>
			<h3 id="reply_tit2">Q&A 관리자 답변</h3>
		</div>
		<form class="reply_form">
			<input type="hidden" name="qna_idx" value="${param.qna_idx}">
			<input type="hidden" name="page" value="${param.page}">
			<table id="reply_table" align="center">
				<tr>
					<th class="reply_th_td">제목</th>
					<td class="reply_th_td"><input class="reply_subject" name="subject" value="${param.subject}" readonly></td>
				</tr>
				<tr>
					<th class="reply_th_td">작성자</th>
					<td class="reply_th_td"><input name="name" class="reply_name" value="${vo.name}" readonly></td>
				</tr>
				<tr>
					<th class="reply_th_td">내용</th>
					<td class="reply_th_td"><textarea id="reply_content" name="content" rows="17" cols="70" style="resize:none;"></textarea></td>
				</tr>
				<tr>
					<th class="reply_pwd">비밀번호</th>
					<td class="reply_pwd"><input class="reply_password_input" name="pwd" type="password"></td>
				</tr>
				<tr>
					<td colspan="2" align="right" class="reply_th_td">
						<input class="reply_btn" type="button" value="등록" onclick="send_reply(this.form);" style="cursor:pointer">
						<input class="reply_btn" type="button" value="취소" onclick="location.href='q_qna_list.do'" style="cursor:pointer">
					</td>
				</tr>
			</table>
		</form>
		
	<%@ include file="/WEB-INF/views/main/footer.jsp" %>
	</body>
</html>