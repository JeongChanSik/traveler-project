<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function img_upload(f) {
		var image = f.image.value;
		var member_idx = f.member_idx.value;
		
		f.method="POST";
		f.action="img_change.do";
		f.submit();
	}

</script>
<style type="text/css">
	#button{
		width: 2.2cm; 
		height: 1cm;
		border: 1px solid black;
		background-color: black;
		color: white;
		font-size: 16px;
		cursor:pointer;
	}
	
	#p1{
		position: absolute;
		top: 6px;
		left:111px;
	}
	
	#p2{
		position: absolute;
		top: 47px;
		left: 20px;
	}
	
	#p3{
		position: absolute;
		top:100px;
		left:119px;
	}
	
	
</style>
</head>
<body>
	<form enctype="multipart/form-data">
		<input type="hidden" value="${vo.member_idx}" name="member_idx">
		<p id="p1">내사진 바꾸기</p>
		<p id="p2"><input type="file" name="image"></p>
		<p id="p3"><input id="button" type="button" value="등록하기" onclick="img_upload(this.form)"> </p>
	</form>
</body>
</html>