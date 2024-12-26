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

.detail-container {
	width: 800px;
	background: white;
	border: 1px solid #828282;
	border-radius: 10px;
	padding: 20px;
	position: relative;
	margin-left: 25%;
}

.detail-header {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.category {
	color: #828282;
	font-size: 20px;
	font-weight: 500;
	margin-right: 10px;
}

.detail-title {
	font-size: 24px;
	font-weight: 500;
	flex: 1;
}

.detail-user {
	font-size: 20px;
	font-weight: 700;
}

.detail-date {
	font-size: 20px;
	font-weight: 500;
	color: #454545;
	margin-left: 10px;
	margin-right: 10px;
}

.detail-content {
	font-size: 20px;
	margin: 10px 20px;
}

.image-container {
	text-align: center;
	margin: 20px 0;
}

.report {
	text-align: right;
	margin: 10px;
}

.report-button {
	background: none;
	border: none;
	cursor: pointer;
	font-size: 0;
}

.report-icon {
	width: 24px;
	height: 24px;
	display: inline-block;
	background-color: #FF5C3D;
	border-radius: 50%;
	position: relative;
}

.report-icon::before {
	content: '!';
	color: white;
	font-size: 16px;
	font-weight: bold;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

/* 팝업 스타일 */
.popup-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	display: none;
	justify-content: center;
	align-items: center;
}

.popup {
	background: white;
	border-radius: 10px;
	padding: 20px;
	width: 400px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	animation: fadeIn 0.3s ease;
}

.popup-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.popup-title {
	font-size: 20px;
	font-weight: bold;
}

.popup-close {
	background: none;
	border: none;
	font-size: 20px;
	cursor: pointer;
}

.popup-content {
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 20px;
	display: flex;
	align-items: center;
}

.form-group label {
	width: 80px;
	font-weight: bold;
	color: white;
	background: #ff5c3d;
	padding: 8px;
	text-align: center;
	border-radius: 5px;
	margin-right: 20px;
}

.form-group select, .form-group textarea {
	flex: 1;
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

.form-group textarea {
	resize: none;
	height: 100px;
}

.submit-button {
	display: block;
	margin: 0 auto;
	padding: 10px 10px;
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

@
keyframes fadeIn {from { opacity:0;
	transform: scale(0.9);
}

to {
	opacity: 1;
	transform: scale(1);
}
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
			<div class="detail-container">
				<!-- 글 제목과 정보 -->
				<div class="detail-header">
					<span class="category">기타</span>
					<h1 class="detail-title">채비누너무기여워!!!!!!!!!!</h1>
					<div>
						<span class="detail-user">익명</span> <span class="detail-date">2024.12.12.
							16:53</span>
					</div>
				</div>
				<hr>
				<!-- 작성 내용 -->
				<div class="detail-content">완죠니 귀엽자나!!!!!!!!!</div>

				<!-- 이미지 -->
				<div class="image-container">
					<img src="https://via.placeholder.com/381x276" alt="Uploaded Image">
				</div>
				<div class="report">
					<!-- 신고 버튼 -->
					<button class="report-button" id="reportBtn">
						<div class="report-icon"></div>
					</button>
				</div>

				<!-- 신고 팝업 -->
				<div class="popup-overlay" id="popupOverlay">
					<div class="popup">
						<div class="popup-header">
							<span class="popup-title">신고하기</span>
							<button class="popup-close" id="popupCloseBtn">&times;</button>
						</div>
						<div class="popup-content">
							<form id="reportForm">
								<!-- 말머리 -->
								<div class="form-group">
									<label for="reason">말머리</label> <select id="reason"
										name="reason">
										<option value="욕설/비방">욕설/비방</option>
										<option value="스팸">스팸</option>
										<option value="부적절한 내용">부적절한 내용</option>
									</select>
								</div>

								<!-- 내용 -->
								<div class="form-group">
									<label for="details">내용</label>
									<textarea id="details" name="details"
										placeholder="신고 사유를 입력하세요."></textarea>
								</div>
								<button type="submit" class="submit-button">신고</button>
							</form>
						</div>
					</div>
				</div>
				<%@ include file="/views/board/comment.jsp"%>
			</div>
		</div>
	</div>

	<script>
            // 팝업 열기
            const reportBtn = document.getElementById('reportBtn');
            const popupOverlay = document.getElementById('popupOverlay');
            const popupCloseBtn = document.getElementById('popupCloseBtn');
    
            reportBtn.addEventListener('click', () => {
                popupOverlay.style.display = 'flex';
            });
    
            // 팝업 닫기
            popupCloseBtn.addEventListener('click', () => {
                popupOverlay.style.display = 'none';
            });
    
            // 신고 폼 제출 이벤트
            const reportForm = document.getElementById('reportForm');
            reportForm.addEventListener('submit', (e) => {
                e.preventDefault();
                const reason = document.getElementById('reason').value;
                const details = document.getElementById('details').value;
    
                alert(`신고가 접수되었습니다.\n말머리: ${reason}\n내용: ${details}`);
                popupOverlay.style.display = 'none';
    
                // 여기에 신고를 처리하는 서버 요청 코드를 추가할 수 있습니다.
            });
        </script>

</body>
</html>