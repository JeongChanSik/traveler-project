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
		<title>지역</title>
		<script src="resources/js/httpRequest.js"></script>
		<link rel="stylesheet" href="resources/css/review/region_page.css">
		<script>
			function region_check(region) {
				var url = "area_info_che.do";
				var param = "a_region=" + region;
				sendRequest(url, param, info_resultFn, "POST");
			}// region_check() end
			
			function info_resultFn() {
				if(xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					var json = (new Function('return' + data))();
					
					if(json[0] == null) {
						alert('아직 올라온 정보가 없습니다.');
						location.href = "region_page.do";
					}// inner if end
					
					location.href = "area_info_result.do?a_region=" + json[0].a_region;
				}// outer if end
			}// resultFn() end
		</script>
	</head>
	<body>
	<div class="container">
	
		<div class="region_page_main_text">
			<h2>대한민국 지역 정보</h2>
			<p>어디까지 알고 있니?</p>
		</div>
		
		<div class="region_button_box">
			<ul>
				<li><input type="button" class="region_btn" value="서울" onclick="region_check('서울')"></li>
				<li><input type="button" class="region_btn" value="부산" onclick="region_check('부산')"></li>
				<li><input type="button" class="region_btn" value="대구" onclick="region_check('대구')"></li>
				<li><input type="button" class="region_btn" value="인천" onclick="region_check('인천')"></li>
				<li><input type="button" class="region_btn" value="광주" onclick="region_check('광주')"></li>
				<li><input type="button" class="region_btn" value="대전" onclick="region_check('대전')"></li>
				<li><input type="button" class="region_btn" value="울산" onclick="region_check('울산')"></li>
				<li><input type="button" class="region_btn" value="세종" onclick="region_check('세종')"></li>
				<li><input type="button" class="region_btn" value="경기" onclick="region_check('경기')"></li>
				<li><input type="button" class="region_btn" value="강원" onclick="region_check('강원')"></li>
				<li><input type="button" class="region_btn" value="충북" onclick="region_check('충북')"></li>
				<li><input type="button" class="region_btn" value="충남" onclick="region_check('충남')"></li>
				<li><input type="button" class="region_btn" value="경북" onclick="region_check('경북')"></li>
				<li><input type="button" class="region_btn" value="경남" onclick="region_check('경남')"></li>
				<li><input type="button" class="region_btn" value="전북" onclick="region_check('전북')"></li>
				<li><input type="button" class="region_btn" value="전남" onclick="region_check('전남')"></li>
				<li><input type="button" class="region_btn" value="제주" onclick="region_check('제주')"></li>			
			</ul>
		</div>
		
		<br><br>
		
		<div class="region_info_box">
			<h2>${area_region}</h2>
				
			<c:forEach var="region_info_list" items="${region_info_list}">
				<div class="region_info">
					<span class="group_text">${region_info_list.a_group}</span><br>
					<h3>${region_info_list.a_subject}</h3>
					<p>${region_info_list.a_content}</p>
					<a href="${region_info_list.a_url}">자세히 보기</a>
				</div>
			</c:forEach>
		</div>
		
		<br><br><br>
		
		
		
		
		<div class="region_tourism_box">
			<p><b style="font-size: 1.5em;">${area_region}</b> 지역 문화관광 홈페이지 바로가기</p>
			<div class="region_tourism_button">
				<ul>
					<c:forEach var="region_tourism_list" items="${region_tourism_list}">
						<li><a href="${region_tourism_list.t_url}">${region_tourism_list.t_zone}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<br><br><br>
		
		<div class="must_eat_box">
			<p><b style="font-size: 1.5em;">${area_region}</b> 추천 맛집!</p>
			
			<c:forEach var="must_eat_list" items="${must_eat_list}">
				<div class="must_eat_info_box">
					<img width=150px src="resources/img/food/${must_eat_list.m_img}"><br>
					<strong>${must_eat_list.m_name}</strong>
					<span>${must_eat_list.m_addr}</span>
				</div>
			</c:forEach>
			
		</div>
	</div>
	
	<!-- ====== footer ====== -->
	<%@ include file="/WEB-INF/views/main/footer.jsp" %>		
	<!-- ====== footer ====== -->
	</body>
</html>