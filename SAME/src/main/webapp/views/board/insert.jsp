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
	margin: 0;
	background-color: white;
}

.container {
	width: 100%;
	position: relative;
	display: flex;
	flex-direction: column;
}

.form-container {
	width: 800px;
	margin: 10px auto;
	padding: 40px;
	background: #ffffff;
	border: 1px solid #828282;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	position: relative;
	margin-left: 25%;
}

.anonymous {
	position: absolute;
	top: 10px;
	right: 40px;
	display: flex;
	align-items: center;
}

.anonymous input {
	margin-right: 5px;
}

.form-group {
	margin-bottom: 20px;
	display: flex;
	align-items: center;
}

.form-group label {
	width: 100px;
	font-weight: bold;
	color: white;
	background: #ff5c3d;
	padding: 8px;
	text-align: center;
	border-radius: 5px;
	margin-right: 20px;
}

.form-group input[type="text"], .form-group textarea, .form-group select
	{
	flex: 1;
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

.form-group textarea {
	resize: none;
	height: 120px;
}

.file-upload {
	display: flex;
	align-items: center;
}

.submit-button {
	display: block;
	margin: 20px auto;
	padding: 10px 20px;
	background-color: #ff5c3d;
	color: #fff;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.submit-button:hover {
	background-color: #e54c2e;
}
</style>
</head>
<body>
	<div class="main">
		<%@ include file="/views/common/mainHeader.jsp"%>
		<%@ include file="/views/common/searchbar.jsp"%>
		<br> <br>
		<!-- 컨테이너 시작-->
		<div class="container">
			<%@ include file="/views/common/sidebarBoard.jsp"%>
			<div class="form-container">
				<!-- 익명 체크 -->
				<div class="anonymous">
					<input type="checkbox" id="anonymous" name="anonymous"> <label
						for="anonymous">익명</label>
				</div>
				<form method="POST">
					<!-- 선택 -->
					<div class="form-group">
						<label for="category">선택</label> <select id="category"
							name="category">
							<option value="말머리">말머리</option>
							<option value="기타">기타</option>
						</select>
					</div>

					<!-- 제목 -->
					<div class="form-group">
						<label for="title">제목</label> <input type="text" id="title"
							name="title" placeholder="제목을 입력하세요." required>
					</div>

					<!-- 내용 -->
					<div class="form-group">
						<label for="content">내용</label>
						<textarea id="content" name="content" placeholder="내용을 입력하세요."
							required></textarea>
					</div>

					<!-- 첨부파일 -->
					<div class="form-group">
						<label for="file">첨부파일</label>
						<div class="file-upload">
							<input type="file" id="file" name="file" accept="image/*">
						</div>
					</div>

					<!-- 등록 버튼 -->
					<button type="submit" class="submit-button">등록</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>