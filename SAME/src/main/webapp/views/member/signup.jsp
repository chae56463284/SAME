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

	.container{
		width:100%;
		position:relative;
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
    
    <%@ include file="/views/common/mainHeader.jsp" %>
    <%@ include file="/views/common/searchbar.jsp" %>
      
	  <div class="container">
	      <!-- 컨테이너 시작-->
	      <div class="sign-up-form">
		  <!-- 사이드바 -->
	 	  <%@ include file="/views/common/sidebarMember.jsp" %>
		
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
  </div>
  <!-- 컨테이너 끝 -->
</body>
</html>