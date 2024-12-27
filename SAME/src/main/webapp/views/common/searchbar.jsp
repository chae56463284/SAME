<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath(); // /same

String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* headbar start*/
.head-bar {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 20px;
	margin-top: 10px;
}

.head-bar a {
	text-decoration: none;
}

.little-same {
	font-size: 20px;
	font-weight: bold;
	color: #FF5C3D;
}

.head-item {
	font-size: 15px;
	color: black;
}

.search-input {
	width: 300px;
	padding: 10px 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #f2f2f2;
	color: black;
}

.search-btn {
	padding: 10px 20px;
	background-color: #FF5C3D;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
/*headbar end*/
</style>
</head>
<body>
	<div class="head-bar">
		<a href="" class="little-same">SAME SAME</a> <a href=""
			class="head-item">쌤찾기</a> <a href="/same/views/board/boardList.jsp" class="head-item">커뮤니티</a>
		<div class="search">
			<input type="text" class="search-input" placeholder="어떤 서비스가 필요하세요?">
			<button class="search-btn">검색</button>
		</div>
		<a href="" class="head-item">로그인</a> <a href="" class="head-item">마이페이지</a>
	</div>
</body>
</html>