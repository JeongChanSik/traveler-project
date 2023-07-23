<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file ="/WEB-INF/views/main/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/mypage.css" />
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	//회원 탈퇴
	function m_delete_pass(f) {
		
		var id = f.id.value.trim();	
		var url="";
		var windowTargetName="m_delete_pass";
		var features="width=480, height=200, left=100, right=50, location=no, resizable=no";
		window.open(url, windowTargetName, features);
		f.method="POST";
		f.action="m_delete_pass.do"
		f.target=windowTargetName;
		f.submit();
	}
	
	function my_img() {
		
		var url="my_img.do";
		var windowTargetName="m_delete_pass";
		var features="width=320, height=180, left=100, right=50, location=no, resizable=no";
		window.open(url, windowTargetName, features);
		target=windowTargetName;
		
		
	}
	

</script>

</head>
<body>
 <div class="mybox">
 	<div id="myimg" >
  	<p>
 	<c:set var="filename" value="${m_ivo.filename }"  />
 	<c:choose>
 		<c:when test="${empty filename}">
	 	<p>	<img id="img" alt="image" src="${pageContext.request.contextPath }/resources/img/myimg_icon.png"> </p>
 		</c:when>
		<c:when test="${filename ne 'null'}">
		<p> <img id="img" alt="image" src="${pageContext.request.contextPath }/resources/my_img/${m_ivo.filename}"> </p>
		</c:when>
 	</c:choose>
 	</div>
 	<div id="p1"> "${vo.name}"님 환영합니다.</div>
 	<!--  -->
 	<div id=myid>
 		<!-- 버튼들 추후 이미지로 교체. --> 
 		<form>
 		<input name="id" type="hidden" value="${vo.id }">
 		<input id="member_update" type="button" value="회원 정보 수정" onclick="location.href='m_update.do'">	
 		<input id="member_delete" type="button" value="회원 탈퇴" onclick="m_delete_pass(this.form)" >
 		<br><br>
 		<input id="myimg_button" type="button" value="프로필 이미지 변경" onclick="my_img()"> 
 		</form>
 	</div>
 	
 </div>
 
 <div class="banner_outline">
 		<div class="banner_list banner1">
 		 	<button type="button" onclick="location.href='#';" style='cursor:pointer;'><img src="resources/img/2.jpg" width="600px"></button>
 		</div>
 		 <div class="banner_list banner2">
 		 	<button type="button" onclick="location.href='#';" style='cursor:pointer;'><img src="resources/img/4.jpg" width="600px"> </button>
 		</div>
 		 <div class="banner_list banner3">
 		 	<button type="button" onclick="location.href='#';" style='cursor:pointer;'><img src="resources/img/5.jpg" width="600px"> </button>
 		</div>
		<div>
 			<button class="banner_button button_left" type="button"><img alt="좌측버튼" src="resources/img/qna_left.png"></button>
 			
 			<button class="banner_button button_right" type="button"><img alt="좌측버튼" src="resources/img/qna_right.png"></button>
 		</div>
 		
 		<ul id="ul1" class="banner_pagination"></ul>
 </div>



<div class="my_menu">
	<ul class="tab">
		<li><a href="#tab01">내가 쓴 글</a></li>
		<li><a href="#tab02">확장탭2</a></li>
		<li><a href="#tab03">확장탭3</a></li>
	</ul>
	<!-- 버튼 여러개 만들고 나중에 위치조정. -->
	<div class="tabcontent">
		<div id="tab01">
				<button class="my_button1" type="button" onclick="location.href='my_qna.do'"><img src="resources/img/mypage_qna.png" width="100%" height="100%"></button>
				<button class="my_button2" type="button" onclick="location.href='likeit_list.do'"><img src="resources/img/mypage_wishlist.png" width="100%" height="100%"></button>
				<div id="my_qna">MY Q&A</div>
				<div id="my_wish">내찜 목록</div>	
		</div>

		<div id="tab02">
				
		</div><!-- tab2 -->
			
		<div id="tab03">		
		
		</div><!-- tab3 -->
	
	
	</div> <!-- tabcontent -->

</div><!-- my_menu -->
<script src="resources/js/banner.js"></script>
<script src="resources/js/tab.js"></script>
<%@include file ="/WEB-INF/views/main/footer.jsp" %>
</body>
</html>