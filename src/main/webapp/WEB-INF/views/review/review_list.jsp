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
	<title>전체 추천 여행 리스트</title>
	<!-- <link rel="stylesheet" href="resources/css/footer.css"> -->
	<!-- <link rel="stylesheet" href="resources/css/header.css"> -->
	<link rel="stylesheet" href="resources/css/review/review_list.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="resources/js/httpRequest.js"></script>
	
	<script>
		function review_list_check(region) {
			// alert(region);
			var url = "review_list_check.do";
			var param = "region=" + region;
			sendRequest(url, param, resultFn, "POST");
		}// review_list_check() end
		
		function resultFn() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var data = xhr.responseText;
				var json = (new Function('return' + data))();
				
				if(json[0] == null) {
					alert('아직 올라온 리뷰가 없습니다.');
					location.href = "review_all_list.do";
				}// inner if end
								
				// list에 무언가 값이 있다면,
				location.href = "review_list.do?region=" + json[0].region;
				
			}// outer if end
		}// resultFn() end
		
		function insert_id_check() {
			alert('옴?');
			var id = ${vo.id}
			alert(id);
			
		}
	</script>
	
</head>
	<body>
		<!-- 리뷰 등록 후 메세지. -->
		<c:if test="${not empty param.insert_result_msg}">
			<script>
				Swal.fire({
				  icon: 'success',
				  title: '정상적으로 등록되었습니다.',
				  timer: 3000
				})
			</script>
		</c:if>
		
		<!-- 리뷰 삭제 후 메세지. -->
		<c:if test="${not empty param.delete_msg}">
			<script>
				Swal.fire({
				  icon: 'success',
				  title: '정상적으로 삭제되었습니다.',
				  timer: 3000
				})
			</script>
		</c:if>
		<br><br><br>	
			
		<div id = "contents">
			
			<!-- 지역 선택 버튼들 -->
			<div id = "region_box">
				<ul>
					<li><input type="button" class="region_btn" value="#전체" onclick="location.href='review_all_list.do'"></li>
					<li><input type="button" class="region_btn" value="#서울" onclick="review_list_check('서울')"></li>
					<li><input type="button" class="region_btn" value="#부산" onclick="review_list_check('부산')"></li>
					<li><input type="button" class="region_btn" value="#대구" onclick="review_list_check('대구')"></li>
					<li><input type="button" class="region_btn" value="#인천" onclick="review_list_check('인천')"></li>
					<li><input type="button" class="region_btn" value="#광주" onclick="review_list_check('광주')"></li>
					<li><input type="button" class="region_btn" value="#대전" onclick="review_list_check('대전')"></li>
					<li><input type="button" class="region_btn" value="#울산" onclick="review_list_check('울산')"></li>
					<li><input type="button" class="region_btn" value="#세종" onclick="review_list_check('세종')"></li>
					<li><input type="button" class="region_btn" value="#경기" onclick="review_list_check('경기')"></li>
					<li><input type="button" class="region_btn" value="#강원" onclick="review_list_check('강원')"></li>
					<li><input type="button" class="region_btn" value="#충북" onclick="review_list_check('충북')"></li>
					<li><input type="button" class="region_btn" value="#충남" onclick="review_list_check('충남')"></li>
					<li><input type="button" class="region_btn" value="#경북" onclick="review_list_check('경북')"></li>
					<li><input type="button" class="region_btn" value="#경남" onclick="review_list_check('경남')"></li>
					<li><input type="button" class="region_btn" value="#전북" onclick="review_list_check('전북')"></li>
					<li><input type="button" class="region_btn" value="#전남" onclick="review_list_check('전남')"></li>
					<li><input type="button" class="region_btn" value="#제주" onclick="review_list_check('제주')"></li>
				</ul>
			</div> <!-- region_box -->
			
			<!-- 텍스트 -->
			<div class="regionAndTotal_box">
				<h2 id=region_text># ${region}</h2>
				<p>총 <span style="color: #0a97cd"><b>${review_count}</b></span> 건</p>
			</div> <!-- regionAndTotal_Text -->
			
			<!-- 리뷰 리스트 -->
			<table> 
				<c:forEach var="list" items="${review_list}">
					<tr>
						<td><img src="${pageContext.request.contextPath}/resources/review_img/${list.filename1}"></td>
						<td>
							<h2 class="review_subject_text"><a href="review_view.do?review_idx=${list.review_idx}&page=${param.page}&region=${list.region}">${list.subject}</a></h2>
							<br>
							<p class="review_region_text">지역 : ${list.region}</p>
							<p class="review_id_text">작성자 : ${list.id}</p>
						</td>
					</tr>
				</c:forEach>
			</table>	
			
			<!-- 등록하기 버튼 -->
			<div class="button_box">
				<c:choose>
					<c:when test="${empty vo.id}">
						<input type="button" value="로그인하기" onclick="location.href='login.do'">
					</c:when>
					
					<c:when test="${not empty vo.id}">
						<input type="button" value="등록하기" onclick="location.href='review_insert_form.do'">
					</c:when>
				</c:choose>
			</div>
				
			<!-- 페이징 -->
			<div class="paging_box">${ReviewpageMenu}</div>
					
		</div> <!-- contents -->
				
		<!-- ====== footer ====== -->
		<%@ include file="/WEB-INF/views/main/footer.jsp" %>		
		<!-- ====== footer ====== -->
	</body>
	
</html>


