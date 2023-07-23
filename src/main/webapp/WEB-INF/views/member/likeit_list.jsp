<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ====== header ====== -->
<%@ include file="/WEB-INF/views/main/header.jsp" %>
<!-- ====== header ====== -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/review/review_list.css">

	</head>
	<body>
		<div id = "contents">
		<!-- 텍스트 -->
		<div class="regionAndTotal_box">
			<h2 id=region_text>${vo.name }님의 <font color="red">좋아요</font> 목록</h2>
			<p>총 <span style="color: #0a97cd"><b>${like_total}</b></span> 건</p>
		</div> 
	
		<div>
		<!-- 좋아요 체크리스트 -->
			<table> 
				<c:forEach var="list" items="${likeList}">
					<tr>
						<td><img src="${pageContext.request.contextPath}/resources/review_img/${list.filename1}"></td>
						<td>
							<h2 class="review_subject_text">
								<a class="t5" href="review_view.do?review_idx=${list.review_idx}&page=${param.page}&region=${list.region}">
								<font color="black">${list.subject}</font>
								</a>
							</h2>
							<br>
							<p class="review_region_text">지역 : ${list.region}</p>
							<p class="review_id_text">작성자 : ${list.id}</p>
						</td>
					</tr>
				</c:forEach>
			</table>	
		</div>
		<div class="paging_box">${pageMenu}</div>
		
		<input type="button" value="마이페이지" onclick="location.href='mypage.do'">
		</div> <!-- contents -->
				
		<!-- ====== footer ====== -->
		<%@ include file="/WEB-INF/views/main/footer.jsp" %>		
		<!-- ====== footer ====== -->
	</body>
</html>