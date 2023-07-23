<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- ====== header ====== -->
<%@ include file="/WEB-INF/views/main/header.jsp" %>
<!-- ====== header ====== -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${vo.id}님의 리뷰 수정하기</title>
	<link rel="stylesheet" href="resources/css/review/review_insert.css">
	<script>
		function modify(f) {
			var image1 = f.image1.value;
			var subject = f.subject.value;
			var content = f.content.value;
			var region = f. region.value;
			
			if(image1 == '') {
				alert('대표 이미지는 반드시 있어야 합니다.');
				return
			}
			
			if(subject == '') {
				alert('제목을 입력해주세요.');
				return
			}
			
			if(content == '') {
				alert('내용을 입력해주세요.');
				return
			}
			
			if(region == 'none') {
				alert('지역을 선택해주세요.');
				return
			}
			
			f.action = "review_modify.do";
			f.submit();
		}
	</script>
</head>
	<body>
		<form method="POST" enctype="multipart/form-data">
			<input type="hidden" value="${review_vo.review_idx}" name="review_idx">
			<input type="hidden" value="${param.page}" name="page">
			
			<div class="caption_text">
				<h2>게시글 수정하기</h2>
			</div>
			
		<div class="container">
		
		<select name="region">
			<option value="none">::: 지역을 선택하세요. :::</option>
			<option value="서울">서울</option>
			<option value="부산">부산</option>
			<option value="대구">대구</option>
			<option value="인천">인천</option>
			<option value="광주">광주</option>
			<option value="대전">대전</option>
			<option value="울산">울산</option>
			<option value="세종">세종</option>
			<option value="경기">경기</option>
			<option value="강원">강원</option>
			<option value="충북">충북</option>
			<option value="충남">충남</option>
			<option value="전북">전북</option>
			<option value="전남">전남</option>
			<option value="경북">경북</option>
			<option value="경남">경남</option>
			<option value="제주">제주</option>
		</select>
			
			<table>
				<tr>
					<td><input class="subject_input_box" value="${review_vo.subject}" name="subject" placeholder="제목"></td>
				</tr>
					
				<tr>
					<td><textarea class="content_input_box" placeholder="여행지에 대한 상세설명을 적어주세요."
					rows="10" cols="50" name="content" style="resize: none;">${review_vo.content}</textarea></td>
				</tr>
				
				<tr>
					<td align="center">
						<h3>대표 이미지</h3>
						<input type="file" name="image1"><br><br>
						<input type="file" name="image2"><br>
						<input type="file" name="image3"><br>
						<input type="file" name="image4"><br>
						<input type="file" name="image5"><br>
					</td>
				</tr>
			</table>
			</div>
			
			<div class="button_box">
				<input type="button" value="수정하기" onclick="modify(this.form)">
				<input type="button" value="돌가가기" onclick="location.href='review_all_list.do?page=${param.page}'">
			</div>
		</form>
	<!-- ====== footer ====== -->
	<%@ include file="/WEB-INF/views/main/footer.jsp" %>		
	<!-- ====== footer ====== -->
	</body>
</html>