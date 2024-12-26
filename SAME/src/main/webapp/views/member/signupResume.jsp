<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="true" %>
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
        /* width: 200vh; */
        
        background-color: white(231, 22, 22);
        height: 100vh;
    }
    .main {
        position: absolute;
        width: 1440px;          /* 원하는 너비 설정 */
        height: 100%;
        background: rgb(255, 255, 255);
        display: flex;          /* flexbox 사용 */
        flex-direction: column; /* 세로 방향으로 배치 */
        align-items: center;    /* 중앙 정렬 */
        
    }
    .Membership{
       width: 463px; 
       height: 238px; 
       left: 14px; 
       top: 280px; 
       position: absolute; 
       color: #FF5C3D; 
       font-size: 50px; 
       font-family: Prompt; 
       font-weight: 700; 
       word-wrap: break-word;
    }

  /* SAME SAME 로고 */
  .SameSame {
        color: #FF5C3D;
        font-size: 128px;
        font-weight: 700;
        text-align: center;
    }

  /* headbar start*/
  .head-bar {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 20px;
        margin-top: 10px;
    }

    .head-bar a{
        text-decoration: none;
    }

    .little-same {
        font-size: 20px;
        font-weight: bold;
        color: #FF5C3D;
    }

    .head-item {
        font-size: 20px;
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
    
    /* Sidebar */
    .Sidebar {
        position: absolute;
        width: 256px;
        top: 388px;
        left: 0px;

    }
    
    .MenuItems {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    .MenuItem {
        width: 256px;
        height: 40px;
        padding: 0 16px;
        background: white;
        border-radius: 8px;
        display: flex;
        align-items: center;
        gap: 16px;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        cursor: pointer; /* 클릭 가능하게 변경 */
    }

    .MenuItem.active {
        background: #F7F7F7;
    }

    .SubMenu {
        display: flex;
        flex-direction: column;
        gap: 8px;
        padding-left: 16px; /* 서브 메뉴의 위치 조정 */
    }

    .LogoPlaceholder {
        width: 24px;
        height: 24px;
        background: #D9D9D9;
        border-radius: 9999px;
        transition: background 0.3s; /* 부드러운 색상 전환 */
    }

    .LogoPlaceholder.red {
        background: #FF5C3D; /* 빨간색 */
    }

    .Label {
        flex: 1;
        color: black;
        font-size: 16px;
        font-family: Inter, sans-serif;
        font-weight: 500;
        line-height: 24px;
    }
    /* Sidebar End*/

    /* Form Section */
    .container {
      position: relative;
      background: white;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      margin-top: 10%;
    }

    .profile-upload {
        display: flex;
        align-items: center; /* 수직 정렬 */
    }

    .avatar {
        width: 117px;
        height: 156px;
        background-color: #D9D9D9;
        margin-right: 20px; /* 자기소개와의 간격 */
        cursor: pointer; /* 클릭 가능하게 표시 */
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

    .file-input {
        display: none; /* 파일 선택 버튼 숨기기 */
    }

    .portfolio-box {
        display: flex; /* Flexbox 사용 */
        justify-content: space-between; /* 양쪽 정렬 */
        align-items: center; /* 수직 정렬 */
        border: 1px solid #ccc;
        border-radius: 4px;
        padding: 10px;
    }
    .portfolio-input{
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
    <div class="main">
        <div class="head">
            <div class="SameSame">SAME SAME</div>
            
            <div class="head-bar">
            <a href="" class="little-same">SAME SAME</a>
            <a href="" class="head-item">쌤찾기</a>
            <a href="" class="head-item">커뮤니티</a>
            <div class="search">
                <input type="text" class="search-input" placeholder="어떤 서비스가 필요하세요?">
                <button class="search-btn">검색</button>
            </div>
            <a href="" class="head-item">로그인</a>
            <a href="" class="head-item">마이페이지</a>
            </div>
        </div>
        
    
        
        <!-- 사이드바시작 -->
    <div class="Membership">MEMBERSHIP</div>
    <div class="Sidebar">
      
    <div class="MenuItems">
        <div class="MenuItem" id="memberInfo">
            <div class="LogoPlaceholder"></div>
            <div class="Label">로그인</div>
        </div>
        <div class="MenuItem" id="boardMenu">
            <div class="LogoPlaceholder gray"></div>
            <div class="Label">회원가입</div>
        </div>
        <div class="SubMenu" id="boardSubMenu">
            <div class="MenuItem">
                <div class="LogoPlaceholder gray"></div>
                <div class="Label">멘티 회원가입</div>
            </div>
            <div class="MenuItem">
                <div class="LogoPlaceholder gray"></div>
                <div class="Label">멘토 회원가입</div>
            </div>
        </div>
        
        <div class="MenuItem">
            <div class="LogoPlaceholder gray"></div>
            <div class="Label">문의게시판</div>
        </div>
      </div>
    </div>

    <script>
        // 회원정보 클릭 시 서브 메뉴 토글
        document.getElementById('memberInfo').addEventListener('click', function () {
            const subMenu = document.getElementById('subMenu');
            subMenu.style.display = subMenu.style.display === 'none' ? 'flex' : 'none';
        });

        // 게시판 클릭 시 서브 메뉴 토글
        document.getElementById('boardMenu').addEventListener('click', function () {
            const boardSubMenu = document.getElementById('boardSubMenu');
            boardSubMenu.style.display = boardSubMenu.style.display === 'none' ? 'flex' : 'none';
        });

        // LogoPlaceholder 색상 변경 함수
        function changeColor(element) {
            // 모든 LogoPlaceholder에서 빨간색 클래스를 제거
            const placeholders = document.querySelectorAll('.LogoPlaceholder');
            placeholders.forEach(function(placeholder) {
                placeholder.classList.remove('red');
            });
            // 클릭한 LogoPlaceholder에 빨간색 클래스 추가
            element.classList.add('red');
        }

        // MenuItem 클릭 시 색상 변경 및 이벤트 버블링 처리
        document.querySelectorAll('.MenuItem').forEach(item => {
            item.addEventListener('click', function (event) {
                // LogoPlaceholder 색상 변경
                const logoPlaceholder = this.querySelector('.LogoPlaceholder');
                if (logoPlaceholder) {
                    changeColor(logoPlaceholder);
                }

                // 클릭 이벤트가 전파되지 않도록 함
                event.stopPropagation();
            });
        });
    </script>
    <!-- 사이드바끝 -->
  
      
<!-- Form Section -->
<div class="container">
    <div class="profile-upload">
        <label class="avatar" for="file-input"></label>
        <input type="file" id="file-input" class="file-input" accept="image/*" />
        <div class="introduction">
            <textarea placeholder="강사의 한마디 입력하세요"></textarea>
        </div>
    </div>

    <div class="category">
      <div class="category-title">지역</div>
          <div class="dropdown">
              <div class="selected-items selected-locations">
                  <!-- 선택된 지역들이 표시될 영역 -->
              </div>
              <select class="menu-dropdown location-select">
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
              <select class="menu-dropdown subject-select">
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
          var selectedValue = event.target.value;
  
          if (selectedValue) {
              var selectedItemsContainer = document.querySelector('.selected-locations');
  
              // 중복 방지
              var existingItem = selectedItemsContainer.querySelector(`[data-value="${selectedValue}"]`);
              if (!existingItem) {
                  var item = document.createElement('span');
                  item.className = 'selected';
                  item.dataset.value = selectedValue;
                  item.innerHTML = `${selectedValue} <span class="remove">×</span>`;
                  selectedItemsContainer.appendChild(item);
  
                  // 삭제 이벤트
                  item.querySelector('.remove').addEventListener('click', function () {
                      item.remove();
                  });
              }
  
              event.target.value = '';
          }
      });
  
      // 강의 과목 선택
      document.querySelector('.subject-select').addEventListener('change', function (event) {
          var selectedValue = event.target.value;
  
          if (selectedValue) {
              var selectedItemsContainer = document.querySelector('.selected-subjects');
  
              // 중복 방지
              var existingItem = selectedItemsContainer.querySelector(`[data-value="${selectedValue}"]`);
              if (!existingItem) {
                  var item = document.createElement('span');
                  item.className = 'selected';
                  item.dataset.value = selectedValue;
                  item.innerHTML = `${selectedValue} <span class="remove">×</span>`;
                  selectedItemsContainer.appendChild(item);
  
                  // 삭제 이벤트
                  item.querySelector('.remove').addEventListener('click', function () {
                      item.remove();
                  });
              }
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
    <input type="text" id="education-input" placeholder="학력 입력 (예: XX대학교 졸업 / 2016-03~2022-02)">
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
    <input type="text" id="experience-input" placeholder="경력 입력 (예: XX회사 근무 / 2022-04~2024-09)">
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
    <input type="text" id="language-input" placeholder="자격증/외국어 입력 (예: TOEIC 850점)">
    <button onclick="addItem('language')">등록</button>
  </div>
</div>

<div class="portfolio">
  <span class="portfolio-title">포트폴리오</span>
  <div class="portfolio-box">
      <span></span>
      <input type="file" class="portfolio-input">
      
  </div>
</div>

<script>
function addItem(section) {
  var inputElement = document.getElementById(`${section}-input`);
  var listContainer = document.getElementById(`${section}-list`);
  var value = inputElement.value.trim();

  if (value) {
    // 새로운 항목 생성
    var listItem = document.createElement('div');
    listItem.className = 'list-item';

    var textSpan = document.createElement('span');
    textSpan.textContent = value;

    var deleteButton = document.createElement('button');
    deleteButton.textContent = '삭제';
    deleteButton.onclick = () => listItem.remove();

    listItem.appendChild(textSpan);
    listItem.appendChild(deleteButton);
    listContainer.appendChild(listItem);

    // 입력 필드 초기화
    inputElement.value = '';
  }
}
</script>



      <button class="submit-button">완료</button>
      <!-- Form Section End-->

  </div>
</div>


</body>
</html>