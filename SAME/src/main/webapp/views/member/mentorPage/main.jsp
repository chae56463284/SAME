<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>

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
.mentor-info {
	width: 917px;
	height: 594px;
	position: relative;
}

/* 회원 정보 박스 */
.info-box {
	width: 308px;
	height: 266px;
	position: absolute;
	top: 0;
	left: 5px;
	background: white;
	border-radius: 5px;
	border: 1px solid #828282;
	position: relative;
}

.text-red {
	width: 345px;
	position: absolute;
	left: 572px;
	top: 255px;
	color: #FF5C3D;
	font-size: 20px;
	font-family: Inter;
	font-weight: 500;
	line-height: 30px;
	word-wrap: break-word;
	text-decoration: none; /* 밑줄 제거 */
}

/* 프로필 이미지 */
.profile-image {
	width: 256px;
	height: 256px;
	position: absolute;
	top: 0;
	left: 31px;
}

/* 입력 박스 */
.input-box {
	width: 349px;
	height: 55px;
	position: absolute;
	left: 339px;
	background: white;
	border-radius: 5px;
	border: 1px solid #828282;
	line-height: 55px;
	padding-left: 20px;
	font-family: Inter, sans-serif;
	font-size: 20px;
	font-weight: 500;
	position: absolute; /* 절대 위치 지정 */
}

.mentor-info {
	width: 710px;
	margin: 0 auto;
	font-family: 'Inter', sans-serif;
}

.section {
	margin: 20px 0;
}

.section-title {
	font-size: 20px;
	font-weight: 700;
	margin-bottom: 10px;
}

.item {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 10px 0;
}

.item-title {
	font-size: 18px;
	font-weight: 500;
}

.download-input {
	font-size: 16px;
	color: black;
	background: #EBEBEB;
	border: 1px solid black;
	border-radius: 15px;
	padding: 5px 15px;
	cursor: pointer;
	display: inline-block;
	text-align: center;
}

.file-upload {
	display: none; /* 실제 input 요소는 숨깁니다 */
}

.divider {
	width: 100%;
	height: 1px;
	background: black;
	margin: 20px 0;
}

.lecture-container {
	display: flex;
	align-items: center;
	gap: 15px;
}

.lecture-image {
	width: 130px;
	height: 80px;
	border-radius: 8px;
}

.lecture-details {
	display: flex;
	flex-direction: column;
}

.lecture-title {
	font-size: 16px;
	font-weight: 700;
	color: black;
	text-decoration: none; /* 링크 밑줄 제거 */
	display: block; /* 기존 div와 동일한 block 스타일 유지 */
}

.lecture-title:hover {
	text-decoration: underline; /* 사용자가 마우스를 올렸을 때 강조 효과 */
}

.lecture-subtitle {
	font-size: 14px;
	color: #828282;
	margin: 5px 0;
}

.lecture-date {
	font-size: 14px;
	color: #828282;
}

.delete-button {
	display: block;
	width: 100%;
	font-size: 20px;
	color: white;
	background: #FF5C3D;
	border: none;
	border-radius: 5px;
	padding: 15px;
	cursor: pointer;
	text-align: center;
	margin: 20px 0;
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
			<%@ include file="/views/common/sidebarMentor.jsp"%>
			<div class="mentor-info">
				<!-- 회원 정보 박스 -->
				<div class="info-box">
					<img class="profile-image"
						src="https://via.placeholder.com/256x256" alt="Profile Image" />
				</div>
					<a href="<%=contextPath%>/member/modify" class="text-red" style="text-decoration: none;">회원정보 수정</a>

				<div class="input-box" style="top: 21px">아이디</div>
				<div class="input-box" style="top: 99px;">이름</div>
				<div class="input-box" style="top: 185px;">이메일</div>

				<div class="container">
					<div class="section">
						<div class="section-title">전문분야</div>
						<div class="item">
							<span class="item-title">이력서</span>
						</div>
						<div class="item">
							<span class="item-title">포트폴리오</span> <label for="file-upload"
								class="download-input"> 파일 다운로드 </label> <input type="file"
								id="file-upload" class="file-upload" />
						</div>
					</div>

					<div class="divider"></div>

					<div class="section">
						<div class="section-title">정산</div>
						<div class="item">
							<span class="item-title"><a href="<%=contextPath%>/views/member/mentorPage/payment.jsp" style="text-decoration: none; color: rgb(0, 0, 0);">정산 내역 조회</a></span>
						</div>
					</div>

					<div class="divider"></div>

					<div class="section">
						<div class="section-title">개설된 강좌</div>
						<div class="lecture-container">
							<img class="lecture-image" src="" />
							<div class="lecture-details">
								<a href="#" class="lecture-title">한글에 대한 모든것</a>
								<div class="lecture-subtitle">나랏말싸미 듕귁에 달아</div>
								<div class="lecture-date">2023.06.15. ~ 24.12.19.</div>
							</div>
						</div>
					</div>

					<div class="divider"></div>

					<div class="section">
						<div class="section-title">스케줄표</div>
						<div class="item">
							<span class="item-title"><a href="<%=contextPath%>/views/member/mentorPage/schedule.jsp" style="text-decoration: none; color: rgb(0, 0, 0);">스케줄표 수정/삭제</a></span>
						</div>
					</div>
					
					<form action="<%=contextPath%>/member/quitMember" method="post" name="quitMember">
						<input type="hidden" name="memberId" value="${sessionScope.memberId}">
						<input type="submit" class="delete-button" value="회원탈퇴" onclick="confirmQuit()"/>
					</form>
										
					<script>
						function confirmQuit() {
							const quitScuccess = confirm("정말 회원 탈퇴하시겠습니까?");
							if (quitScuccess) {
								document.quitForm.submit();
							}
						}
					</script>
			</div>
		</div>
	</div>
</body>
</html>