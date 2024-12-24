<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>이력서 작성화면</title>
  <style>

  body {
        display: flex;
        justify-content: center;
        align-items: center;
        /* width: 200vh; */
        
        background-color: white(231, 22, 22);
        height: 100vh;
    }

  .Membership {
    width: 463px; 
    height: 238px; 
    left: 14px; 
    top: 162px; 
    position: absolute; 
    color: #FF5C3D; 
    font-size: 50px; 
    font-family: Prompt; 
    font-weight: 700; 
    word-wrap: break-word;
  }

  /* Sidebar */
  .Sidebar {
    position: absolute;
    width: 256px;
    top: 270px;
    left: 0px;

    }
  .Line {
    width: 0;
    height: 0;
    position: absolute;
    left: 43.01px;
    top: 191px;
    transform: rotate(-44.47deg);
    transform-origin: 0 0;
    border: 1px black solid;
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
      position: absolute;
      top: 220px; 
      left: 400px;
      width: 600px;
      background: white;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      padding: 100px;
        
    }

    .profile-upload {
        display: flex;
        align-items: center; /* 수직 정렬 */
        margin-bottom: 20px;
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

    .dropdown-container {
        display: flex;
        flex-direction: column;
        margin-bottom: 10px;
    }

    .dropdown {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
        justify-content: space-between;
    }

    .selected {
        background-color: #ff6b6b;
        color: white;
        padding: 5px 10px;
        border-radius: 5px;
        margin-right: 10px;
        display: flex;
        align-items: center;
    }

    .remove {
        margin-left: 5px;
        cursor: pointer;
    }

    .menu-dropdown {
        margin-left: 340px;
        width: 80px; 
        height: 30px;
        
    }

    .education {
        margin-top: 20px;
    }

    .education-item {
        display: flex;
        margin-bottom: 9px;
    }

    .education-item input {
        width: 100%; 
        padding: 10px; 
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-bottom: 5px; /* 아래 여백 추가 */
    }

    .experience {
        margin-top: 20px;
    }

    .experience-item {
        display: flex;
        margin-bottom: 9px;
    }

    .experience-item input {
        width: 100%; 
        padding: 10px; 
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-bottom: 5px; /* 아래 여백 추가 */
    }

    .language {
        margin-top: 20px;
    }

    .language-item {
        display: flex;
        justify-content: space-between;
        margin-bottom: 9px;
    }

    .language-item input {
        width: 100%; 
        padding: 10px; 
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .portfolio {
        margin-top: 20px;
    }

    .file-input {
        display: none; /* 파일 선택 버튼 숨기기 */
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
    /* Form Section End*/

  </style>
</head>
<body>


  <div style="width: 1440px; height: 960px; position: relative; background: white"> 

    <!-- 페이지 제목 -->
    <div class="SameSame" style="width: 816px; height: 238px; left: 356px; top: -1px; position: absolute; color: #FF5C3D; font-size: 128px; font-family: Prompt; font-weight: 700; word-wrap: break-word">SAME SAME</div>
    <div class="Membership">MEMBERSHIP</div>
      
      <!-- 사이드바시작 -->
    <div class="Sidebar">
      <div class="Line"></div>
      
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
          <span>카테고리</span>
          <div class="portfolio-box">
              <div class="dropdown-container">
                  <div class="dropdown">
                      <span class="selected">지역 <span class="remove">×</span></span>
                      <span class="selected">중구 <span class="remove">×</span></span>
                      <select class="menu-dropdown">
                          <option>지역</option>
                          <option>서울</option>
                          <option>경기</option>
                          <option>강원</option>
                          <option>충북</option>
                          <option>충남</option>
                          <option>경북</option>
                          <option>경남</option>
                          <option>전북</option>
                          <option>(제주)서귀포시</option>
                          <option>(제주)제주시</option>
                      </select>
                  </div>
                  <div class="dropdown">
                      <span class="selected">과목 <span class="remove">×</span></span>
                      <select class="menu-dropdown">
                          <option>강의과목</option>
                          <option>국/영/수</option>
                          <option>외국어</option>
                          <option>과학/수학</option>
                          <option>예체능</option>
                          <option>기타</option>
                      </select>
                  </div>
              </div>
          </div>
      </div>

      <div class="education">
          <span>학력</span>
          <div class="education-item">
              <input type="text" placeholder="XX고등학교 / 졸업                                                                                          (2009.02 ~ 2012.02)" />
          </div>
          <div class="education-item">
              <input type="text" placeholder="XX대학교 / 영어영문학과 / 졸업                                                                      (2012.03 ~ 2019.02)" />
          </div>
      </div>

      <div class="experience">
          <span>경력</span>
          <div class="experience-item">
              <input type="text" placeholder="개인과외 / 고등학생 영어 전 개인과외                                                            (2019.06 ~ 2023.12)" />
          </div>
          <div class="experience-item">
              <input type="text" placeholder="ABCD 영어학원 / 전임강사                                                                             (2017.04 ~ 2018.11)" />
          </div>
      </div>

      <div class="language">
          <span>자격증/외국어</span>
          <div class="language-item">
              <input type="text" placeholder="TOEIC 850/990" />
              
          </div>
          <div class="language-item">
              <input type="text" placeholder="TOEIC SPEAKING" />
              
          </div>
      </div>

      <div class="portfolio">
          <span class="portfolio-title">포트폴리오</span>
          <div class="portfolio-box">
              <span></span>
              <input type="file" class="portfolio-input">
              
          </div>
      </div>

      <button class="submit-button">완료</button>
    <!-- Form Section End-->
   
    </div>
    
  </div>

</body>
</html>