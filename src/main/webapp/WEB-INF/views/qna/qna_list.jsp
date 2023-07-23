<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Q&A 게시글</title>
		
		<style>
			#qna_list_body{
				margin: 0;
				font-family: 'Noto Sans KR', sans-serif;
			}
			#list_tit{
				padding: 20px 0px 0px 495px;
				margin-top: 120px;
				font-weight: 800;
			}
			#list_table{
				border-collapse: collapse;
				width: 980px;
				margin: 0 auto 280px;
			}
			.list_th{
				border-collapse: collapse;
				height: 30px;
				text-align: center;
				font-size: large;
				font-weight: 400;
			}
			.list_td{
				border-collapse: collapse;
				height: 30px;
				text-align: center;
				width: 120px;
				border-top : 1px solid gray;
				font-weight: 300;
			}
			.list_subject{
				border-collapse: collapse;
				height: 30px;
				padding-left: 20px;
				border-top : 1px solid gray;
				font-size: normal;
				font-weight: 300;
			}
			#insert_btn{
				margin-right: 10px;
				width: 120px;
				height: 40px;
				border: 1px solid black;
				background-color: black;
				color: white;
				font-size: 16px;
				cursor:pointer;
			}
			#list_a{
				text-decoration: none;
			}
		</style>
		
		<script>
			function q_insert_form() {
				
				var list_id = document.getElementById("id").value;
				
				// 로그인이 되어있지 않다면 로그인 화면으로
				if(list_id == ''){
					location.href = "nomal_login.do";
				} else { // 로그인이 되어 있다면 글쓰기 폼으로 이동
					location.href = "q_insert_form.do";
				}
			 }
		</script>
	</head>
	<body id="qna_list_body">
		<%@include file = "/WEB-INF/views/main/header.jsp" %>
		<input type="hidden" id="id" value="${vo.id}">
		<h1 id="list_tit">Q&A</h1>
		<table id="list_table">
			<tr>
				<th class="list_th">번호</th>
				<th class="list_th" style="padding-left:100px;">제목</th>
				<th class="list_th">작성자</th>
				<th class="list_th">작성일</th>
			</tr>
				<c:forEach var="qvo" items="${list}">
					<tr>
						<td class="list_td" style="font-weight: 400;">${qvo.qna_idx}</td>
						<td class="list_subject">
							<c:forEach begin="1" end="${qvo.qna_depth}">&nbsp;</c:forEach>
							<c:if test="${qvo.qna_depth ne 0}">ㄴ</c:if>
							
							<a id="list_a" href="q_view.do?qna_idx=${qvo.qna_idx}&page=${param.page}">
								<font color="black">${qvo.subject}</font>
							</a>
							
						</td>
						<td class="list_td">${qvo.name}</td>
						<td class="list_td">${fn:split(qvo.regdate, ' ')[0]}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="center">${pageMenu}</td>
				</tr>
				<tr>
					<td colspan="5" align="right" style="height:50px;">
						<input id="insert_btn" type="button" value="글쓰기" onclick="q_insert_form()">
					</td>
				</tr>
		</table>
		
	<%@include file="/WEB-INF/views/main/footer.jsp" %>
	</body>
</html>