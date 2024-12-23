<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>로그인 페이지</title>
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
        height: 960px;
        position: relative;
        background: rgb(255, 255, 255); 
    }

    /* SAME SAME 로고 */
    .SameSame {
        color: #FF5C3D;
        font-size: 128px;
        font-family: Prompt, sans-serif;
        font-weight: 700;
        text-align: center;
        margin-bottom: 20px;
    }

    /* set 컨테이너 */
    .set {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 20px; /* 요소 간 간격 */
        margin-top: 5%;
    }


    /* 멘티/멘토 버튼 컨테이너 */
    .login-tabs {
        display: flex;
        justify-content: center;
        gap: 10px;
        margin-left: -35%;
        
    }

    .loginMe, .loginMt {
        width: 120px;
        height: 40px;
        text-align: center;
        line-height: 40px;
        font-size: 16px;
        font-weight: 500;
        border-radius: 20px 20px 0 0;
        cursor: pointer;
        margin-bottom: -3%;
        
    }

    .loginMe {
        background: #FF5C3D;
        color: white;
        margin-left: -10%;
    }

    .loginMt {
        background: white;
        color: black;
        border: 1px solid #E0E0E0;
        margin-left: -2%;
    }

    .loginMe.active, .loginMt.active {
        background: #FF5C3D;
        color: white;
    }

    .loginMe.inactive, .loginMt.inactive {
        background: white;
        color: black;
        border: 1px solid #E0E0E0;
    }

    /* LOGIN 텍스트 */
    .Login {
        color: #FF5C3D;
        font-size: 80px;
        font-weight: 1000;
    }

    .bigBox {
        width: 500px;
        height: 50px;
    }
    /* 입력 박스 */
    .idBox, .passBox {
        width: 100%;
        height: 100%;
        background: white;
        border-radius: 5px;
        border: 1px solid #828282;
        margin-bottom: 5%;
        
    }

    .text-input {
        width: auto;
        height: 100%;
        border: none;
        font-size: 16px;
        padding: 0 15px;
        outline: none;
    }

    /* 버튼 스타일 */
    .loginGo, .kakaoGo {
        width: 100%;
        height: 100%;
        border-radius: 5px;
        font-size: 16px;
        font-weight: 500;
        text-align: center;
        line-height: 50px;
        cursor: pointer;
        margin-bottom: 5%;
    }

    .loginGo {
        background: #FF5C3D;
        color: white;
        margin-top: 15%;
    }

    .kakaoGo {
        background: #FBE300;
        color: black;
        position: relative;
    }

    /* 하단 텍스트 */
    .info-text, .link-button {
        font-size: 14px;
        color: black;
        text-align: center;
        cursor: pointer;
        margin-bottom: 5%;
    }
    /* a 태그 밑줄 제거*/
    a{
    text-decoration-line : none;
    color: black;
    }
  </style>
</head>
<body>
  <div class="main">
    <div class="SameSame">SAME SAME</div>
    <div class="set">
      
      <div class="bigBox">
           <!-- 멘티/멘토 버튼 -->
            <div class="login-tabs">
                <div class="loginMe active" id="mentee">멘티</div>
                <div class="loginMt inactive" id="mentor">멘토</div>
            </div>

            <div class="Login">LOGIN</div>
        
                <!-- id 비밀번호 작성 -->
             <div class="idBox">
               <input type="text" class="text-input" placeholder="ID">
             </div>
             <div class="passBox">
               <input type="password" class="text-input" placeholder="PASS">
             </div>
     
             <div class="loginGo">로그인</div>
     
             <div class="info-text"><a href="/SAME/views/member/forgotID.jsp">아이디 찾기</a> / <a href="/SAME/views/member/forgotPass.jsp">비밀번호 찾기</a></div>
     
             <!-- 카카오 추후 로그인 로고 추가-->
             <div class="kakaoGo">
               <div class="Image2">카카오 로그인</div>
             </div>
             
             <div class="link-button"><a href="/SAME/views/member/signup.jsp">회원가입</a></div>

         </div>
    </div>
  </div>

  <!-- 멘토, 멘티 클릭시 색을 바꾸는 script-->
  <script>
    var menteeButton = document.getElementById("mentee");
    var mentorButton = document.getElementById("mentor");

    menteeButton.addEventListener("click", () => {
      menteeButton.classList.add("active");
      menteeButton.classList.remove("inactive");
      mentorButton.classList.add("inactive");
      mentorButton.classList.remove("active");
    });

    mentorButton.addEventListener("click", () => {
      mentorButton.classList.add("active");
      mentorButton.classList.remove("inactive");
      menteeButton.classList.add("inactive");
      menteeButton.classList.remove("active");
    });
  </script>
</body>
</html>