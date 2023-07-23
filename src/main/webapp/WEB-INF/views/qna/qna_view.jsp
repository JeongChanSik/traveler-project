<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file = "/WEB-INF/views/main/header.jsp" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Q&A 상세보기</title>
		<style>
			.qna_view_body{
				margin: 0;
				font-family: 'Noto Sans KR', sans-serif;
			}
			.view_container{
				width: 980px;
				height: 670px;
				margin: 0 auto;
				padding: 100px 20px 0 20px;
				/* border: solid 1px black; */
			}
			#view_tit1{
				display: inline;
				padding-right: 10px;
				border-right: 1px solid gray;
			}
			#view_tit2{
				display: inline;
				padding-left: 5px;
			}
			#view_name{
				padding-right: 10px;
				border-right: 1px solid gray;
			}
			#view_date{
				display: inline;
				padding-left: 5px;
			}
			.view_content{
				/* border: solid 1px gray; */
				width: 100%;
				height: 300px;
			}
			#view_pwd{
				width: 100%;
				height: 50px;
			}
			#c_pwd{
				margin-left: 10px; 
				border-radius: 0;
				border: 1px solid #D8D8D8;
			}
			#view_btns{
				width: 100%;
				height: 50px;
				padding-top: 7px;
				position: static;
			}
			.view_btn1{
				margin: 0;
				padding: 10px 20px 10px 20px;
				position: relative;
				left: 10px;
				width: 120px;
				height: 40px;
				border: 1px solid black;
				background-color: black;
				color: white;
				font-size: 16px;
				cursor:pointer;
			}
			#view_btn2{
				margin: 0;
				padding: 10px 20px 10px 20px;
				position: relative;
				left: 600px;
				width: 120px;
				height: 40px;
				border: 1px solid black;
				background-color: black;
				color: white;
				font-size: 16px;
				cursor:pointer;
			}
		</style>
		
		<script src="resources/js/httpRequest.js"></script>
		<script>
		//삭제하기
		function del() {
			
			if(!confirm("삭제하시겠습니까?")) {
				return;
			}
			
			var pwd = ${qvo.pwd}; //원본 비밀번호
			var c_pwd = document.getElementById("c_pwd").value; //input에 입력한 비밀번호
			
			if(c_pwd == '') {
				alert('비밀번호를 입력해주세요.');
				return;
			}
			if(pwd != c_pwd) {
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			
			var url="q_del.do";
			var param="qna_idx=${qvo.qna_idx}"
			
			sendRequest(url, param, delCheck, "POST");
		}
		
		function delCheck() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				
				var data = xhr.responseText;
				
				var json = (new Function('return'+data))();
				
				if(json[0].result == 'yes') {
					alert("삭제되었습니다.")
					location.href="q_qna_list.do?page=${param.page}";
				}else {
					alert("삭제 실패했습니다.")
				}
			}
		}
		
		function reply() {
			location.href="q_reply_form.do?qna_idx=${qvo.qna_idx}&subject=${qvo.subject}&name=${vo.name}&page=${param.page}";
		}
		</script>
	</head>
	
	<body class="qna_view_body">
		<div class="view_container">
			<h3 id="view_tit1">즐겨차키</h3>
			<h3 id="view_tit2">Q&A</h3>
			<h1>${qvo.subject}</h1>
			<div class="qna_view_tit">
				<span id="view_name">${qvo.name}</span>
				<span id="view_date">${fn:split(qvo.regdate, ' ')[0]}</span>
			</div>
			<hr>
			<div class="view_content">
				${qvo.content}
			</div>
			<hr>
			<c:choose>
				<c:when test="${not empty vo}">
					<div class="view_pwd">
						비밀번호 <input type="password" id="c_pwd">
					</div>
				</c:when>
			</c:choose>
			<hr>
			<div id="view_btns">
				<!-- 목록으로 돌아가기 -->
				<input class="view_btn1" type="button" value="목록" onclick="location.href='q_qna_list.do'">
				
				<!-- 삭제 -->
				<c:choose>
					<c:when test="${not empty vo}">
						<input class="view_btn1" type="button" value="삭제" onclick="del()">
					</c:when>
				</c:choose>
				<!-- depth가 1보다 크면 답변 달지 못하도록 하기 && 관리자만 답변 버튼 보이게 하기 -->
				<c:if test="${qvo.qna_depth lt 1 && vo.id eq 'admin'}">
					<input id="view_btn2" type="button" value="답변" onclick="reply()">
				</c:if>
			</div>
		</div>
		
	<%@ include file="/WEB-INF/views/main/footer.jsp" %>
	</body>
</html>