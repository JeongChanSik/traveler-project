<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ====== header ====== -->
<%@ include file="/WEB-INF/views/main/header.jsp" %>
<!-- ====== header ====== -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${vo.id}님의 리뷰</title>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<style>
		* { padding: 0; margin: 0; box-sizing: border-box; }
		
		.contents {
			width: 880px;
			margin: 0 auto;
		}
		
		.review_subject_text_box{
			width: 500px;
    		margin: 0 auto;
		}
		
		.review_subject_text {
			font-size: 1.7em; 
			text-align: center;
			border-radius: 35px;
			border-top:1px solid #848484;
			border-bottom:1px solid #848484;
			border-left:8px solid #848484;
			border-right:8px solid #848484;
			padding: 10px 0;
		}
		
		
		.text {
			position: relative;
			text-align: center;
		    margin-top: 9px;
		    margin-bottom: 5px;
		    padding-bottom: 40px;
		    border-bottom: 1px solid #D3D3D3;
		    font-size: 13px;
		    color: #666;
		}
		
		.icon_2{
		    position: absolute;
			width: 20px;
		    height: 20px;
		    bottom: 10px;
		    right: 10px;
		}
		
		.icon_1 {
   			position: absolute;
			width: 20px;
		    height: 20px;
		    bottom: 10px;
		    right: 40px;
		}
		
		.haert-click {
			position: absolute;
			width: 20px;
		    height: 20px;
		    bottom: 10px;
		    right: 80px;
		}
		
		.heart-notlogin {
			position: absolute;
			width: 20px;
		    height: 20px;
		    bottom: 10px;
		    right: 80px;
		}
		
		.likecheck {
			position: absolute;
			width: 20px;
		    height: 20px;
		    bottom: 10px;
		    right: 65px;
		}
		
		
		.text input[type=button] {
			position: absolute;
			bottom: 10px;
			left: 0;
			padding: 5px 10px;
			border: none;
			border-top-left-radius: 35px;
			border-top-right-radius: 35px;
			border-bottom-left-radius: 35px;
			border-bottom-right-radius: 35px;
			font-size: 10px;
		}
		
		.text input[type=button]:nth-of-type(2) {
			margin-left: 65px;
		} 
		
		.text input[type=button]:nth-of-type(3) {
			margin-left: 130px;
		}
		
		.text input[type=button]:hover {
			background-color: #A9A9A9;
			transition: 0.4s;
		}
		
		.text input[type=button]:active {
			background-color: #696969;
		}
		
		.content_text_box {
			width: 880px;
			text-align: center;
			padding: 30px 0;
			margin: 0 auto 30px;
		}
		
		.text_box {
			border-bottom: 6px solid black;
			width: 880px;
			padding-bottom: 15px;
			margin-bottom: 30px;
		}
		
		.comment_button_box {
			margin: 15px 0 30px;
			width: 880px;
			height: 30px;
		}
		
		.comment_button_box input {
			float: right;
			width: 80px;
			height: 30px;
			border-radius: 25px;
			border: none;
		}
		
		.comment_button_box input:hover {
			background-color: #A9A9A9;
			transition: 0.4s;
		}
		
		.comment_button_box input:active {
			background-color: #696969;
		}
		
		.comment_box {
			position: relative;
			width: 880px;
			margin-bottom: 60px;
		}
		
		.comments {
			width: 880px;
			padding:20px 0;
			border-bottom: 1px solid #808080;
		}
		
		.comments_id {
			font-size: 18px;
			font-weight: bold;
			padding-bottom: 15px;
		}
		
		.comments_comment {
			padding-bottom: 10px;
		}
		
		.comments_regdate {
			font-size: 10px;
			color: #808080;
		}
		
		.comment_delete {
			position: absolute;
			top: 20px;
			right: 20px;
		}
	</style>
	
	
	
	
	
	
	
	<style>
		.slider{
		    width: 600px;
		    height: 400px;
		    position: relative;
		    margin: 0 auto 50px;
		    overflow: hidden; /* 현재 슬라이드 오른쪽에 위치한 나머지 슬라이드 들이 보이지 않도록 가림 */
		}
		.slider input[type=radio]{
		    display: none;
		}
		ul.imgs{
		    padding: 0;
		    margin: 0;
		    list-style: none;  
		}
		ul.imgs img {
			width: 600px;
  			height: 400px;
		}
		
		ul.imgs li{
		    position: absolute;
		    left: 640px;
		    transition-delay: 1s; /* 새 슬라이드가 이동해 오는 동안 이전 슬라이드 이미지가 배경이 보이도록 지연 */
		
		    padding: 0;
		    margin: 0;
		}
		.bullets{
		    position: absolute;
		    left: 50%;
		    transform: translateX(-50%);
		    bottom: 20px;
		    z-index: 2;
		}
		.bullets label{
		    display: inline-block;
		    border-radius: 50%;
		    background-color: rgba(0,0,0,0.55);
		    width: 20px;
		    height: 20px;
		    cursor: pointer;
		}
		/* 현재 선택된 불릿 배경 흰색으로 구분 표시 */
		.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
		    background-color: #6495ED;
		}
		.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
		    background-color: #6495ED;
		}
		.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
		    background-color: #6495ED;
		}
		.slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
		    background-color: #6495ED;
		}
		.slider input[type=radio]:nth-child(5):checked~.bullets>label:nth-child(5){
		    background-color: #6495ED;
		}
	
		.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
		    left: 0;
		    transition: 0.5s;
		    z-index:1;
		}
		.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
		    left: 0;
		    transition: 0.5s;
		    z-index:1;
		}
		.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
		    left: 0;
		    transition: 0.5s;
		    z-index:1;
		}
		.slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
		    left: 0;
		    transition: 0.5s;
		    z-index:1;
		}
		.slider input[type=radio]:nth-child(5):checked~ul.imgs>li:nth-child(5){
		    left: 0;
		    transition: 0.5s;
		    z-index:1;
		}
	</style>
	
	
	<script>
		function review_delete() {
			var idx = ${review_vo.review_idx};
			
			if(!confirm("정말 삭제하시겠습니까?")) { // 아니요 클릭했을 때,
				return;
			}
			
			// 예를 클릭했을 때,
			location.href = "review_delet.do?review_idx=" + idx;
		}
		
		function comment_send(f) {
			var che_id = f.id.value; // 리뷰를 작성하는 유저 아이디
			var review_id = '${review_vo.id}'; // 리뷰를 작성한 유저 아이디
			var comment = f.review_comment.value.trim();
			
			if(comment == '') {
				alert('댓글은 1글자 이상 입력해야 합니다.');
				return;
			}
			
			f.action = "review_comment_insert.do";
			f.method = "POST";
			f.submit();
		}
	</script>
	
	<!-- 하트 -->
	<script type="text/javascript">
	$(document).ready(function () {
		$(".haert-click").click(function() {
			let no = $(this).attr('idx');
							
			//좋아요가 비어있을 때
			if($(this).children('svg').attr('class') == "light"){
				
				$.ajax({
					url : 'like_insert.do',
					type : 'get',
					data : { idx : no},
					
					success : function(rvo){
						let heart = rvo.likecheck;
						$(".likecheck").text(heart);
						
						if(confirm("좋아요 목록으로 이동하시겠습니까?")) {
							location.href="likeit_list.do?page=1"
						}
						
					},
					
					error : function(){
						alert('에러')
						return;
					}
				
				});
			
			//solid하트로 바꾸기
			$(this).html("<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='red' class='solid' viewBox='0 0 512 512'><path d='M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z'/></svg>");
						
			//좋아요가 채워져있을 때
			} else if($(this).children('svg').attr('class') == "solid") {
			
				$.ajax({
					url : 'like_delete.do',
					type : 'get',
					data : { idx : no},
					
					success : function(rvo){
						let heart = rvo.likecheck;
						$(".likecheck").text(heart);
					},
					
					error : function(){
						alert('에러')
					}
					
				});
				
			//light하트로 바꾸기
			$(this).html("<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='red' class='light' viewBox='0 0 512 512'><path d='M225.8 468.2l-2.5-2.3L48.1 303.2C17.4 274.7 0 234.7 0 192.8v-3.3c0-70.4 50-130.8 119.2-144C158.6 37.9 198.9 47 231 69.6c9 6.4 17.4 13.8 25 22.3c4.2-4.8 8.7-9.2 13.5-13.3c3.7-3.2 7.5-6.2 11.5-9c0 0 0 0 0 0C313.1 47 353.4 37.9 392.8 45.4C462 58.6 512 119.1 512 189.5v3.3c0 41.9-17.4 81.9-48.1 110.4L288.7 465.9l-2.5 2.3c-8.2 7.6-19 11.9-30.2 11.9s-22-4.2-30.2-11.9zM239.1 145c-.4-.3-.7-.7-1-1.1l-17.8-20c0 0-.1-.1-.1-.1c0 0 0 0 0 0c-23.1-25.9-58-37.7-92-31.2C81.6 101.5 48 142.1 48 189.5v3.3c0 28.5 11.9 55.8 32.8 75.2L256 430.7 431.2 268c20.9-19.4 32.8-46.7 32.8-75.2v-3.3c0-47.3-33.6-88-80.1-96.9c-34-6.5-69 5.4-92 31.2c0 0 0 0-.1 .1s0 0-.1 .1l-17.8 20c-.3 .4-.7 .7-1 1.1c-4.5 4.5-10.6 7-16.9 7s-12.4-2.5-16.9-7z'/></svg>");
			}
			
		});
		
		
		
		//로그인x
		$(".heart-notlogin").unbind('click');
		$(".heart-notlogin").click(function(){
			alert('로그인 후 이용가능합니다.');
		})
	});
	
	</script>
	
</head>
	<body>
		<br><br><br>
		<!-- 수정이 끝나고 msg에 값이 있을 경우, -->
		<c:if test="${not empty param.msg}">
			<script>
				Swal.fire({
				  icon: 'success',
				  title: '정상적으로 수정되었습니다.',
				  timer: 3000
				})
			</script>
		</c:if>
	
		
		<div class="contents">
		
			<div class="review_subject_text_box">
				<h2 class="review_subject_text">${review_vo.subject}</h2>
			</div>
			<div class="text">
				<p>${review_vo.region}</p>
				<p>${review_vo.id}</p>
				
				<!--============ 아이디가 같을 경우만 보이도록 할 것 ============-->
				<c:if test="${review_vo.id eq member_id}">
					<input type="button" value="수정하기" onclick="location.href='review_modify_form.do?review_idx=${review_vo.review_idx}&page=${param.page}'">
					<input type="button" value="삭제하기" onclick="review_delete()">
				</c:if>
				<!-- =========================================================== -->
				
				<input type="button" value="목록으로" onclick="location.href='review_all_list.do?page=${param.page}'">

				
				<img class="icon_1" src="${pageContext.request.contextPath}/resources/img/review_icon_1.png" alt="아무기능" >		
				<img class="icon_2" src="${pageContext.request.contextPath}/resources/img/review_icon_2.png" alt="없습니다 ㅎㅎ..">
				<c:choose>
					<c:when test="${not empty vo }">
						<c:choose>
							<c:when test="${lvoRes.member_idx ne vo.member_idx && lvoRes.review_idx ne review_vo.review_idx}">
								<a idx="${review_vo.review_idx}" href="javascript:;" class="haert-click">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="red" class="light" viewBox="0 0 512 512"><path d="M225.8 468.2l-2.5-2.3L48.1 303.2C17.4 274.7 0 234.7 0 192.8v-3.3c0-70.4 50-130.8 119.2-144C158.6 37.9 198.9 47 231 69.6c9 6.4 17.4 13.8 25 22.3c4.2-4.8 8.7-9.2 13.5-13.3c3.7-3.2 7.5-6.2 11.5-9c0 0 0 0 0 0C313.1 47 353.4 37.9 392.8 45.4C462 58.6 512 119.1 512 189.5v3.3c0 41.9-17.4 81.9-48.1 110.4L288.7 465.9l-2.5 2.3c-8.2 7.6-19 11.9-30.2 11.9s-22-4.2-30.2-11.9zM239.1 145c-.4-.3-.7-.7-1-1.1l-17.8-20c0 0-.1-.1-.1-.1c0 0 0 0 0 0c-23.1-25.9-58-37.7-92-31.2C81.6 101.5 48 142.1 48 189.5v3.3c0 28.5 11.9 55.8 32.8 75.2L256 430.7 431.2 268c20.9-19.4 32.8-46.7 32.8-75.2v-3.3c0-47.3-33.6-88-80.1-96.9c-34-6.5-69 5.4-92 31.2c0 0 0 0-.1 .1s0 0-.1 .1l-17.8 20c-.3 .4-.7 .7-1 1.1c-4.5 4.5-10.6 7-16.9 7s-12.4-2.5-16.9-7z"/></svg>
						    	</a>
					    	</c:when>
					    	<c:otherwise>
								<a idx="${review_vo.review_idx}" href="javascript:;" class="haert-click">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="red" class="solid" viewBox="0 0 512 512"><path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/></svg>
						    	</a>						    	
					    	</c:otherwise>
					    </c:choose>
					</c:when>
					<c:otherwise>
						<a href="javascript:" class="heart-notlogin">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="red" class="light" viewBox="0 0 512 512"><path d="M225.8 468.2l-2.5-2.3L48.1 303.2C17.4 274.7 0 234.7 0 192.8v-3.3c0-70.4 50-130.8 119.2-144C158.6 37.9 198.9 47 231 69.6c9 6.4 17.4 13.8 25 22.3c4.2-4.8 8.7-9.2 13.5-13.3c3.7-3.2 7.5-6.2 11.5-9c0 0 0 0 0 0C313.1 47 353.4 37.9 392.8 45.4C462 58.6 512 119.1 512 189.5v3.3c0 41.9-17.4 81.9-48.1 110.4L288.7 465.9l-2.5 2.3c-8.2 7.6-19 11.9-30.2 11.9s-22-4.2-30.2-11.9zM239.1 145c-.4-.3-.7-.7-1-1.1l-17.8-20c0 0-.1-.1-.1-.1c0 0 0 0 0 0c-23.1-25.9-58-37.7-92-31.2C81.6 101.5 48 142.1 48 189.5v3.3c0 28.5 11.9 55.8 32.8 75.2L256 430.7 431.2 268c20.9-19.4 32.8-46.7 32.8-75.2v-3.3c0-47.3-33.6-88-80.1-96.9c-34-6.5-69 5.4-92 31.2c0 0 0 0-.1 .1s0 0-.1 .1l-17.8 20c-.3 .4-.7 .7-1 1.1c-4.5 4.5-10.6 7-16.9 7s-12.4-2.5-16.9-7z"/></svg>
						</a>
					</c:otherwise>
				</c:choose>
				<h3 class="likecheck">${review_vo.likecheck }</h3>
			</div>
		
		
		<br>
		
		<div class="text_box">
			<h2>이미지</h2>
		</div>
		
		<div class="slider">
		    <input type="radio" name="slide" id="slide1" checked>
		    
		    <c:if test="${review_vo.filename2 ne 'nofile'}">
		    	<input type="radio" name="slide" id="slide2">
		    </c:if>
		    
		    <c:if test="${review_vo.filename3 ne 'nofile'}">
		    	<input type="radio" name="slide" id="slide3">
		    </c:if>
		    
		    <c:if test="${review_vo.filename4 ne 'nofile'}">
		    	<input type="radio" name="slide" id="slide4">
		    </c:if>
		    
		    <c:if test="${review_vo.filename5 ne 'nofile'}">
		    	<input type="radio" name="slide" id="slide5">
		    </c:if>
		    
		    
		    <ul id="imgholder" class="imgs">
		        <li><img src="${pageContext.request.contextPath}/resources/review_img/${review_vo.filename1}"></li>
		        
		        
		        <c:if test="${review_vo.filename2 ne 'nofile'}">
		        	<li><img src="${pageContext.request.contextPath}/resources/review_img/${review_vo.filename2}"></li>
		        </c:if>
		        
		        <c:if test="${review_vo.filename3 ne 'nofile'}">
		        	<li><img src="${pageContext.request.contextPath}/resources/review_img/${review_vo.filename3}"></li>
		        </c:if>
		        
		        <c:if test="${review_vo.filename4 ne 'nofile'}">
		        	<li><img src="${pageContext.request.contextPath}/resources/review_img/${review_vo.filename4}"></li>
		        </c:if>
		        
		        <c:if test="${review_vo.filename5 ne 'nofile'}">
		        	<li><img src="${pageContext.request.contextPath}/resources/review_img/${review_vo.filename5}"></li>
		        </c:if>
		        
		    </ul>
		    <div class="bullets">
		        <label for="slide1">&nbsp;</label>
		        
		        <c:if test="${review_vo.filename2 ne 'nofile'}">
		    		<label for="slide2">&nbsp;</label>
		    	</c:if>
		    	
		         <c:if test="${review_vo.filename3 ne 'nofile'}">
		    		<label for="slide3">&nbsp;</label>
		    	</c:if>
		    	
		    	 <c:if test="${review_vo.filename4 ne 'nofile'}">
		    		<label for="slide4">&nbsp;</label>
		    	</c:if>
		    	
		    	 <c:if test="${review_vo.filename5 ne 'nofile'}">
		    		<label for="slide5">&nbsp;</label>
		    	</c:if>
		    </div>
		</div>
		
		
		<div class="text_box">
			<h2>상세정보</h2>
		</div>
		
		<div class="content_text_box">
			<p>${review_vo.content}</p>
		</div>
		
		
		<!-- 댓글 작성 -->
		<form action="GET">
			<!-- 게시판 번호, 아이디 같이 보내기 -->
			<input type="hidden" name="review_idx" value="${review_vo.review_idx}">
			
			<!-- session에 들어있는 현재 아이디 -->
			<input type="hidden" name="id" value="${member_id}">
			
			<div class="text_box">
				<h2>댓글</h2>
			</div>
			
			<div>
				<c:choose>
					<c:when test="${empty vo.id}">
						<textarea name="review_comment" style="padding: 20px 15px; font-size: 15px; width: 880px; height: 150px; resize: none;" placeholder="로그인 후에 댓글을 작성할 수 있습니다." readonly="readonly"></textarea>
						<div class="comment_button_box">
							<input  type="button" value="로그인 하기" onclick="location.href='login.do'">
						</div>
					</c:when>
					
					<c:when test="${not empty vo.id}">
						<textarea name="review_comment" style="padding: 20px 15px; font-size: 15px; width: 880px; height: 150px; resize: none;" placeholder="소중한 댓글을 남겨주세요."></textarea>
						
						<div class="comment_button_box">
							<input  type="button" value="등록하기" onclick="comment_send(this.form)">
						</div>
					</c:when>
				</c:choose>
			</div>
			
		</form>
		
		
		
		<!-- 댓글 목록 -->
		<div class="comment_box">
			<c:choose>
				
				<c:when test="${empty review_comments_list}">
					<h3 style="text-align: center;">등록된 댓글이 없습니다.</h3>
				</c:when>
				
				
				<c:when test="${not empty review_comments_list}">
					<c:forEach var="comment_list" items="${review_comments_list}">
					
						<div class="comments">
							<!-- 댓글 작성자가 글쓴이 인 경우, -->
							<c:if test="${review_vo.id eq comment_list.id}">
								<p class="comments_id"><span style="color: blue;">작성자</span> <b style="color: red;">${comment_list.id}</b></p>
							</c:if>
							
							<!-- 댓글 작성자가 글쓴이가 아닌 경우, -->
							<c:if test="${review_vo.id ne comment_list.id}">
								<p class="comments_id">${comment_list.id}</p>
							</c:if>
							
							<p class="comments_comment">${comment_list.review_comment}</p>
							<p class="comments_regdate">${comment_list.comment_regdate}</p>
							
							<!-- <a href="#" style="font-size: 7px; color: gray;">수정</a> <span>||</span> -->
							
							<!-- 리뷰 작성자 또는 댓글 작성자만 보이도록, -->
							<c:choose>
								<c:when test="${review_vo.id eq member_id}">
									<a class="comment_delete" href="comment_del.do?review_comment_idx=${comment_list.review_comment_idx}&review_idx=${review_vo.review_idx}" style="font-size: 7px; color: gray;">X</a>
								</c:when>
								
								<c:when test="${comment_list.id eq member_id}">
									<a class="comment_delete" href="comment_del.do?review_comment_idx=${comment_list.review_comment_idx}&review_idx=${review_vo.review_idx}"  style="font-size: 7px; color: gray;">X</a>
								</c:when>
							</c:choose>
						</div>

					</c:forEach>
				</c:when>
			</c:choose>
		</div> <!-- comment_box end -->
		<!-- 댓글 END --> 
	</div>
	<!-- ====== footer ====== -->
	<%@ include file="/WEB-INF/views/main/footer.jsp" %>		
	<!-- ====== footer ====== -->
	</body>
</html>