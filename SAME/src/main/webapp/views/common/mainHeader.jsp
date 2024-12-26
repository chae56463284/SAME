<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0; /* 기본 margin 제거 */
}

.main {
	width: 1440px;
	position: relative;
	background: rgb(255, 255, 255);
	display: flex;
	flex-direction: column; /* 수직 정렬 */
	align-items: center; /* 수평 중앙 정렬 */
	justify-content: flex-start; /* 상단에 배치 */
}


/* SAME SAME 로고 */
.SameSame {
	color: #FF5C3D;
	font-size: 128px;
	font-family: Prompt, sans-serif;
	font-weight: 700;
	text-align: center;
	margin-top: 20px; /* 상단 여백 */
}
</style>
</head>
<body>
	<div class="main">
		<div class="SameSame"><a href="/same" style="color: #FF5C3D;">SAME SAME</a></div>
	</div>
</body>
</html>