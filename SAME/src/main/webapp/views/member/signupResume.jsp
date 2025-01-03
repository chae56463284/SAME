<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="true"%>
<%
	if (!"B".equals((String) session.getAttribute("memberType"))) {
		response.sendRedirect(request.getContextPath() + "/views/common/error.jsp");
		return;
	}
%>

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
}

.sign-up-form {
	display: flex;
	flex-direction: column;
	width: 700px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 5%;
}
/* Form Section */
.mentor-profile {
	width: 669px;
	height: 232px;
	display: flex;
	border-radius: 5px;
	background-color: white;
	padding: 15px;
	position: relative;
}

.avatar-container {
	width: 220px;
	height: 200px;
	display: flex;
	flex-direction: column;
	align-items: center;
	border-right: 1px solid #E0E0E0;
}

.avatar {
	width: 180px;
	height: 200px;
	background-color: #D9D9D9;
	border-radius: 5px;
	height: 200px;
}

.upload-btn {
	margin-top: 10px;
	margin-right: 120px;
	color: #FF5C3D;
	font-size: 15px;
	cursor: pointer;
}

.mentor-details {
	flex-grow: 1;
	padding-left: 20px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.mentor-name {
	font-size: 25px;
	font-weight: 700;
	padding-top: 10px;
}

.delete-btn {
	position: absolute;
	top: 10px;
	right: 10px;
	width: 14px;
	height: 14px;
	color: black;
	cursor: pointer;
	margin-right: 475px;
}

.introduction {
	flex-grow: 1; /* 남은 공간을 차지 */
	margin-top: 77px;
}

.introduction textarea {
	width: 95%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: none;
	height: 60px; /* 높이 조정 */
}

.category {
	margin-top: 20px;
}

.category-title {
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 10px;
}

.dropdown {
	display: flex; /* Flexbox 사용 */
	justify-content: space-between; /* 양쪽 정렬 */
	align-items: center; /* 수직 정렬 */
	border: 1px solid #ccc;
	border-radius: 4px;
	padding: 10px;
	margin-bottom: 10px;
}

.selected {
	background-color: #ff6b6b;
	color: white;
	padding: 5px 10px;
	border-radius: 5px;
	display: flex;
	align-items: center;
}

.selected-items {
	display: flex;
	gap: 8px; /* 선택된 항목 간격 */
	flex-wrap: wrap; /* 여러 항목이 넘어가면 다음 줄로 */
	margin-bottom: 10px;
}

.remove {
	margin-left: 5px;
	cursor: pointer;
}

.menu-dropdown {
	margin-top: 10px;
	width: 80px;
	height: 30px;
}

.section {
	margin-bottom: 20px;
}

.section-title {
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 10px;
}

.input-group {
	display: flex;
	align-items: center;
	margin-top: 10px;
}

.input-group input {
	flex: 1;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.input-group button {
	padding: 10px 16px;
	background-color: #FF5C3D;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-left: 10px;
}

.input-group button:hover {
	background-color: #e74c3c;
}

.list-container {
	margin-top: 10px;
}

.list-item {
	display: flex;
	align-items: center;
	justify-content: space-between;
	background: #f7f7f7;
	padding: 8px 12px;
	border-radius: 4px;
	margin-bottom: 8px;
}

.list-item span {
	flex: 1;
}

.list-item button {
	background-color: transparent;
	border: none;
	color: #ff5c3d;
	font-weight: bold;
	cursor: pointer;
}

.list-item button:hover {
	color: #e74c3c;
}

.portfolio {
	margin-top: 20px;
}

.portfolio-box {
	display: flex; /* Flexbox 사용 */
	justify-content: space-between; /* 양쪽 정렬 */
	align-items: center; /* 수직 정렬 */
	border: 1px solid #ccc;
	border-radius: 4px;
	padding: 10px;
}

.portfolio-input {
	margin-left: 400px; /* 오른쪽으로 이동 */
}

.submit-button {
	/* width: 100%; */
	padding: 8px 16px;
	background-color: #FF5C3D;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-top: 20px;
	float: right;
}

.submit-button:hover {
	background-color: #e74c3c;
}
/* Form Section End*/
</style>
</head>
<body>
	<!-- head 시작-->
	<div class="main">

		<%@ include file="/views/common/mainHeader.jsp"%>
		<%@ include file="/views/common/searchbar.jsp"%>

		<div class="container">
			<%@ include file="/views/common/sidebarMembership.jsp"%>
			<!-- 컨테이너 시작-->
			<form id="signupMentor"
				action="<%= request.getContextPath() %>/member/insertMentor"
				method="post">

				<div class="sign-up-form">
					<!-- 사이드바 -->
					<div class="mentor-profile">
						<div class="avatar-container">
							<div class="avatar">
								<img id="avatarPreview" src="/default-avatar.png" alt="프로필 사진"
									style="width: 180px; height: 200px;">
							</div>
							<input type="file" id="avatarUpload" name="avatar"
								accept="image/*" style="display: none;">
							<div class="upload-btn" onclick="triggerUpload()">업로드</div>
						</div>
						<div class="mentor-details">
							<%
							String memberName = (String) session.getAttribute("memberName");
							%>
							<div class="mentor-name">
								Mentor
								<%=memberName%></div>
							<div class="introduction">
								<textarea name="introduction" placeholder="멘토의 한마디 입력하세요"></textarea>
							</div>
						</div>
						<div class="delete-btn">×</div>
					</div>
					<script>
				  // 업로드 버튼 동작
				  document.querySelector('.upload-btn').addEventListener('click', () => {
				    alert('프로필사진을 업로드하시겠습니까?');
				  });

				  // 삭제 버튼 동작
				  document.querySelector('.delete-btn').addEventListener('click', () => {
				    if (confirm('프로필 사진을 삭제하시겠습니까?')) {
					  document.querySelector('.avatar').style.backgroundColor = '#D9D9D9'; // 기본 이미지로 복원
				    }
				  });
			
					// 업로드 버튼 클릭 시 파일 선택창 열기
					function triggerUpload() {
					    document.getElementById('avatarUpload').click();
					}

					// 파일 선택 시 미리보기 이미지 표시
					document.getElementById('avatarUpload').addEventListener('change', function (event) {
					    const file = event.target.files[0];
					    if (file) {
					        const reader = new FileReader();
					        reader.onload = function (e) {
					            document.getElementById('avatarPreview').src = e.target.result;
					        };
					        reader.readAsDataURL(file);
					    }
					});

					// 파일 업로드 처리
					document.getElementById('uploadForm').addEventListener('submit', function (event) {
					    event.preventDefault(); // 기본 폼 제출 동작 방지
					    const formData = new FormData(this);
					    fetch(this.action, {
					        method: this.method,
					        body: formData,
					    })
					        .then(response => response.json())
					        .then(data => {
					            alert('업로드 완료!');
					            console.log(data);
					        })
					        .catch(error => {
					            alert('업로드 실패');
					            console.error(error);
					        });
					});
					</script>

					<div class="category">
						<div class="category-title">지역</div>
						<div class="dropdown">
							<div class="selected-items selected-locations">
								<!-- 선택된 지역들이 표시될 영역 -->
							</div>
							<select class="menu-dropdown location-select" name="regionName">
								<option value="">지역</option>
								<option value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="강원">강원</option>
								<option value="충북">충북</option>
								<option value="충남">충남</option>
								<option value="경북">경북</option>
								<option value="경남">경남</option>
								<option value="전북">전북</option>
								<option value="(제주)서귀포시">(제주)서귀포시</option>
								<option value="(제주)제주시">(제주)제주시</option>
							</select>
						</div>
						<div class="category-title">강의과목</div>
						<div class="dropdown">
							<div class="selected-items selected-subjects">
								<!-- 선택된 과목들이 표시될 영역 -->
							</div>
							<select class="menu-dropdown subject-select" name="className">
								<option value="">강의과목</option>
								<option value="국/영/수">국/영/수</option>
								<option value="외국어">외국어</option>
								<option value="과학/수학">과학/수학</option>
								<option value="예체능">예체능</option>
								<option value="기타">기타</option>
							</select>
						</div>

					</div>


					<script>
      // 지역 선택
      document.querySelector('.location-select').addEventListener('change', function (event) {
    const selectedValue = event.target.value;

    if (selectedValue) {
        const selectedItemsContainer = document.querySelector('.selected-locations');

        // 중복 방지
        const existingItem = selectedItemsContainer.querySelector(`[data-value="${selectedValue}"]`);
        if (!existingItem) {
            const item = document.createElement('span');
            item.className = 'selected';
            item.dataset.value = selectedValue;
            item.innerHTML = `${selectedValue} <span class="remove">×</span>`;
            selectedItemsContainer.appendChild(item);

            // 삭제 이벤트
            item.querySelector('.remove').addEventListener('click', function () {
                item.remove();
            });
        }

        // 선택 값 초기화
        event.target.value = '';
    }
});
//과목
document.querySelector('.subject-select').addEventListener('change', function (event) {
    const selectedValue = event.target.value;

    if (selectedValue) {
        const selectedItemsContainer = document.querySelector('.selected-subjects');

        // 중복 방지
        const existingItem = selectedItemsContainer.querySelector(`[data-value="${selectedValue}"]`);
        if (!existingItem) {
            const item = document.createElement('span');
            item.className = 'selected';
            item.dataset.value = selectedValue;
            item.innerHTML = `${selectedValue} <span class="remove">×</span>`;
            selectedItemsContainer.appendChild(item);

            // 삭제 이벤트
            item.querySelector('.remove').addEventListener('click', function () {
                item.remove();
            });
        }

        // 선택 값 초기화
        event.target.value = '';
    }
});
  </script>

					<!-- 학력 섹션 -->
					<div class="section" id="education-section">
						<div class="section-title">학력</div>
						<div class="list-container" id="education-list">
							<!-- 입력된 학력 항목이 여기에 표시됩니다 -->
						</div>
						<div class="input-group">
							<input type="text" id="education-input"
								placeholder="학력 입력 (예: XX대학교 졸업 / 2016-03~2022-02)" name="education">
							<button onclick="addItem('education')">등록</button>
						</div>
					</div>

					<!-- 경력 섹션 -->
					<div class="section" id="experience-section">
						<div class="section-title">경력</div>
						<div class="list-container" id="experience-list">
							<!-- 입력된 경력 항목이 여기에 표시됩니다 -->
						</div>
						<div class="input-group">
							<input type="text" id="experience-input"
								placeholder="경력 입력 (예: XX회사 근무 / 2022-04~2024-09)" name="career">
							<button onclick="addItem('experience')">등록</button>
						</div>
					</div>

					<!-- 자격증/외국어 섹션 -->
					<div class="section" id="language-section">
						<div class="section-title">자격증/외국어</div>
						<div class="list-container" id="language-list">
							<!-- 입력된 자격증/외국어 항목이 여기에 표시됩니다 -->
						</div>
						<div class="input-group">
							<input type="text" id="language-input"
								placeholder="자격증/외국어 입력 (예: TOEIC 850점)" name="license">
							<button onclick="addItem('language')">등록</button>
						</div>
					</div>

					<div class="portfolio">
						<span class="portfolio-title">포트폴리오</span>
						<div class="portfolio-box">
							<span></span> <input type="file" class="portfolio-input">

						</div>
					</div>



					<script>
					function addItem(section) {
					    const inputElement = document.getElementById(`${section}-input`);
					    const listContainer = document.getElementById(`${section}-list`);
					    const value = inputElement.value.trim();

					    if (!value) {
					        alert('값을 입력해주세요.');
					        return;
					    }

					    // 새로운 항목 생성
					    const listItem = document.createElement('div');
					    listItem.className = 'list-item';

					    const textSpan = document.createElement('span');
					    textSpan.textContent = value;

					    const deleteButton = document.createElement('button');
					    deleteButton.textContent = '삭제';
					    deleteButton.onclick = (event) => {
					        event.preventDefault(); // 기본 동작 방지
					        listItem.remove();
					    };

					    listItem.appendChild(textSpan);
					    listItem.appendChild(deleteButton);
					    listContainer.appendChild(listItem);

					    // 입력 필드 초기화
					    inputElement.value = '';
					}

					// 등록 버튼 클릭 이벤트에서 기본 동작 막기
					document.querySelectorAll('.input-group button').forEach(button => {
					    button.addEventListener('click', (event) => {
					        event.preventDefault(); // 기본 동작 방지
					    });
					});
					
					// 폼 제출 시 JSON 응답 처리 및 리다이렉트 구현
					  document.getElementById('signupMentor').addEventListener('submit', function (event) {
					      event.preventDefault(); // 기본 폼 제출 방지

					      const formData = new FormData(this);

					      fetch(this.action, {
					          method: this.method,
					          body: formData,
					      })
					          .then(response => response.json()) // JSON 형태로 응답 파싱
					          .then(data => {
					              if (data.success) {
					                  // 성공 시 지정된 URL로 이동
					                  window.location.href = data.redirectUrl;
					              } else {
					                  alert('오류가 발생했습니다. 다시 시도해주세요.');
					              }
					          })
					          .catch(error => {
					              console.error('에러 발생:', error);
					              alert('서버 오류가 발생했습니다.');
					          });
					  });
</script>


					<button class="submit-button">완료</button>


				</div>
			</form>
		</div>
		<br> <br>
	</div>
</body>
</html>