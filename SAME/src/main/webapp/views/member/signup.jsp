<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SAME SAME</title>
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
}

/* sign-up-form 스타일 */
.sign-up-form {
	display: flex;
	flex-direction: column;
	width: 500px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 5%;
}

.writing-box {
	display: flex;
	margin-bottom: 15px;
}

.id-box {
	flex: 1;
	height: 40px;
	padding: 5px 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 16px;
}

.input-box {
	width: 100%;
	height: 40px;
	padding: 5px 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 16px;
}

.duplicate-btn {
	padding: 5px 25px;
	background-color: #FF5C3D;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
}

/* 성별 정렬문제 해결을 위해 추가 */
.gender {
	gap: 20px; /* 성별 텍스트와 체크박스 간격 */
	font-size: 16px;
}

.gender label {
	display: flex;
	gap: 5px; /* 체크박스와 텍스트 간격 */
	font-size: 14px;
}

.submit-btn {
	height: 50px;
	background-color: #FF5C3D;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	margin-top: 20px;
	cursor: pointer;
}

.kakao-btn {
	height: 50px;
	background-color: #FBE300;
	color: black;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	margin-top: 10px;
	cursor: pointer;
}
/* 컨테이너 끝 */
</style>
</head>
<body>

	<!-- head 시작-->
	<div class="main">

		<%@ include file="/views/common/mainHeader.jsp"%>
		<%@ include file="/views/common/searchbar.jsp"%>

		<div class="container">
			<!-- 컨테이너 시작-->
			<div class="sign-up-form">
				<!-- 사이드바 -->
				<%@ include file="/views/common/sidebarMembership.jsp"%>
				<form id="signup" action="${pageContext.request.contextPath}/member/insert" method="post">
					<div class="writing-box">
						<input type="text" id="id" name="id" class="id-box"
							placeholder="아이디">
						<button type="button" class="duplicate-btn">중복</button>
					</div>
					<div class="writing-box">
						<input type="password" id="password" name="password"
							class="input-box" placeholder="비밀번호">
					</div>
					<div class="writing-box">
						<input type="password" id="password-confirm"
							name="passwordConfirm" class="input-box" placeholder="비밀번호 확인">
					</div>
					<div class="writing-box">
						<input type="text" id="name" name="name" class="input-box"
							placeholder="이름">
					</div>
					<div class="writing-box">
						<input type="text" id="phone" name="phone" class="input-box"
							placeholder="연락처">
					</div>
					<div class="writing-box">
						<input type="text" id="ssn" name="ssn" class="input-box"
							placeholder="주민번호">
					</div>
					
					<div class="writing-box">
						<input type="email" id="email" name="email" class="input-box"
							placeholder="EMAIL">
					</div>
					<div class="writing-box">
						<input type="text" id="address" name="address" class="input-box"
							placeholder="주소">
					</div>
					<button type="submit" class="submit-btn">회원가입</button>
					<button type="button" class="kakao-btn">카카오로 시작하기</button>
				</form>
			</div>
		</div>
	</div>
	<!-- 컨테이너 끝 -->
	<script>
    document.querySelector('.duplicate-btn').addEventListener('click', function() {
        const userId = document.getElementById('id').value;
        fetch(`/checkDuplicate?userId=${userId}`)
            .then(response => response.json())
            .then(data => {
                if (data.isDuplicate) {
                    alert('이미 사용 중인 아이디입니다.');
                } else {
                    alert('사용 가능한 아이디입니다.');

                }
            });
    });
    
    document.getElementById('signup').addEventListener('submit', function(event) {
        const password = document.getElementById('password').value;
        const passwordConfirm = document.getElementById('password-confirm').value;
        if (password !== passwordConfirm) {
            alert('비밀번호가 일치하지 않습니다.');
            event.preventDefault();
        }
    });
    </script>
</body>
</html>