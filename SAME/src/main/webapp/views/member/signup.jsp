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

    .main {
        width: 1440px;

        position: relative;
        background: rgb(255, 255, 255);
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

      /* Sidebar */
    .Sidebar {
        position: absolute;
        width: 256px;
        top: 388px;
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

    /* container 스타일 */
    .container {
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

    .id-box{
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

      <!-- 컨테이너 시작-->
    <div class="container">
      <div class="writing-box">
        <input type="text" id="id" class="id-box" placeholder="아이디">
        <button type="button" class="duplicate-btn">중복</button>
      </div>
      <div class="writing-box">
        <input type="password" id="password" class="input-box" placeholder="비밀번호">
      </div>
      <div class="writing-box">
        <input type="password" id="password-confirm" class="input-box" placeholder="비밀번호 확인">
      </div>
      <div class="writing-box">
        <input type="text" id="name" class="input-box" placeholder="이름">
      </div>
      <div class="writing-box">
        <input type="text" id="phone" class="input-box" placeholder="연락처">
      </div>
      <div class="writing-box gender">
        <span>성별</span>
        <label><input type="radio" name="gender"> 남성</label>
        <label><input type="radio" name="gender"> 여성</label>
      </div>
      <div class="writing-box">
        <input type="email" id="email" class="input-box" placeholder="EMAIL">
      </div>
      <div class="writing-box">
        <input type="text" id="address" class="input-box" placeholder="주소">
      </div>
      <button type="submit" class="submit-btn">회원가입</button>
      <button type="button" class="kakao-btn">카카오로 시작하기</button>
    </div>
  </div>
  <!-- 컨테이너 끝 -->

  </main>
</body>
</html>