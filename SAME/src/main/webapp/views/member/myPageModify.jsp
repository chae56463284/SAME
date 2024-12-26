<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>멘토정보입력</title>
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
	height: 294px;
	position: relative;
}
.full {
	margin: 0 auto;
	width: 710px;
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
.profile-image-container {
	position: relative;
	width: 256px;
	height: 256px;
}
.profile-image {
	width: 100%;
	height: 100%;
	border-radius: 5px;
	object-fit: cover;
}
.remove-btn {
	position: absolute;
	top: 5px;
	right: 5px;
	color: black;
	border: none;
	width: 25px;
	height: 25px;
	cursor: pointer;
	display: none;
}
#upload-btn {
	background: none;
	border: none;
	color: #FF5C3D;
	font-size: 20px;
	cursor: pointer;
	padding: 10px;
}
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
	position: absolute;
}
.gender {
	position: absolute;
	top: 190px;
	left: 350px;
	display: flex;
	align-items: center;
	gap: 20px;
	font-family: Inter, sans-serif;
	font-size: 18px;
	font-weight: 500;
}
.gender label {
	display: flex;
	align-items: center;
	gap: 5px;
}
.under-box {
	display: flex;
	flex-direction: column;
	margin-top: 5%;
}
.writing-box {
	margin-bottom: 15px;
}
.writing-box input {
	width: 100%;
	height: 55px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 16px;
}
.submit-btn {
	height: 50px;
	background-color: #FF5C3D;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	margin-top: 5%;
}
  </style>
</head>
<body>
    <div class="main">
      <%@ include file="/views/common/mainHeader.jsp"%>
      <%@ include file="/views/common/searchbar.jsp"%>
      <br><br>
      <div class="container">
        <%@ include file="/views/common/sidebarMentee.jsp"%>
       <div class="full">
        <div class="mentor-info">
            <!-- 회원 정보 박스 -->
            <div class="info-box">
                <div class="profile-image-container">
                    <img class="profile-image" src="https://via.placeholder.com/256x256" alt="Profile Image" />
                    <button class="remove-btn">&times;</button>
                </div>
                <input type="file" id="file-upload" style="display: none;" accept="image/*">
                <button id="upload-btn">업로드</button>
            </div>
            <div class="input-box" style="top: 21px;">id01</div>
            <div class="input-box" style="top: 99px;">이용희</div>
            <div class="gender">
                <span>성별</span>
                <label><input type="radio" name="gender" value="male" checked disabled> 남성</label>
                <label><input type="radio" name="gender" value="female" disabled> 여성</label>
            </div>
        </div>

        
        <script>
        const uploadBtn = document.getElementById('upload-btn');
        const fileInput = document.getElementById('file-upload');
        const profileImage = document.querySelector('.profile-image');
        const removeBtn = document.querySelector('.remove-btn');

        // 업로드 버튼 클릭 시 파일 선택
        uploadBtn.addEventListener('click', () => {
            fileInput.click();
        });

        // 파일 선택 시 이미지 변경
        fileInput.addEventListener('change', (event) => {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = (e) => {
                    profileImage.src = e.target.result;
                    removeBtn.style.display = 'block'; // X 버튼 보이기
                };
                reader.readAsDataURL(file);
            }
        });

        // X 버튼 클릭 시 이미지 제거
        removeBtn.addEventListener('click', () => {
            profileImage.src = 'https://via.placeholder.com/256x256'; // 기본 이미지로 복원
            fileInput.value = ''; // 파일 입력 초기화
            removeBtn.style.display = 'none'; // X 버튼 숨기기
        });
    </script>
        
        <div class="under-box">
          <div class="writing-box">
            <input type="text" class="password" placeholder="비밀번호">
          </div>
          <div class="writing-box">
            <input type="text" class="phone" placeholder="연락처">
          </div>
          <div class="writing-box">
            <input type="text" class="email" placeholder="이메일">
          </div>
          <div class="writing-box">
            <input type="text" class="address" placeholder="주소">
          </div>
          <button type="submit" class="submit-btn">회원정보수정</button>
        </div>
       </div>
      </div>
    </div>
</body>
</html>

