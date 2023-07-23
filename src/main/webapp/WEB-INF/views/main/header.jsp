<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>Home</title>
	<script src="${path}/resources/js/httpRequest.js"></script>
	<link href="${path}/resources/css/header.css" rel="stylesheet" type="text/css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<script type="text/javascript">
      function search(){
         var region = document.getElementById("search-region").value;
         var searchInput = document.getElementById('search-region');
         var searchImg = document.getElementById('search-img');
         
         if (searchInput.value.trim() == '') {
               alert('텍스트가 비어있습니다. 지역이름을 입력해주세요.');
               return;
             } else {
               // 검색 페이지로 이동하는 로직
             location.href="area_info_result.do?a_region="+region;
             }
      }
      </script>
	
</head>
<body>
<header>
	<div class="header-container">
      	<div id="logo">
      			<a href="http://localhost:10001/last/mainpage.do" style="text-decoration: none;">
					<span id="tit1">대한민국</span>
					<span id="tit2">즐겨차키</span>
					<img alt="차키" src="resources/img/key1.png">
				</a>
		</div>
		<ul id="header_ul">
	        <li class="header_li"><a href="http://localhost:10001/last/mainpage.do" style="text-decoration: none;">홈</a></li>
	        <li class="header_li"><a href="http://localhost:10001/last/region_page.do" style="text-decoration: none;">지역</a></li>
	        <li class="header_li"><a href="review_all_list.do" style="text-decoration: none;">여행후기</a></li>
	        <li class="header_li"><a href="traveler_map.do" style="text-decoration: none;">여행지도</a></li>
	        <li class="header_li"><a href="http://localhost:10001/last/q_qna_list.do?id=${vo.id}" style="text-decoration: none;">문의사항</a></li>
      	</ul>
      	<div>
	        <input id="search-region" class="search-input" type="text" placeholder="어디로 어떤 여행을 떠날 건가요?">
	        <img id="search-img" src="resources/img/search2.jpg" onclick="search()">
	     </div>
      	<div class="header-mypage">
            <c:choose>
               <c:when test="${not empty vo}">
                  <img id="mypage-img" alt="마이 페이지" src="resources/img/user.png" onclick="location.href='mypage.do'">
               </c:when>   
            </c:choose>
        </div>
      	<div class="header-btn">
      		<c:choose>
				<c:when test="${empty vo}">
					<img class="header-log" src="resources/img/login2.jpg" alt="로그인" align="right" onclick="location.href='login.do'">
				</c:when>
				<c:when test="${not empty vo}">
					<img class="header-log" src="resources/img/logout2.jpg" alt="로그아웃" align="right" onclick="location.href='logout.do'">
				</c:when>
			</c:choose>	
     	</div>
     </div>
</header>
</body>
</html>
