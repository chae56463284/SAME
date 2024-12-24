<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자설정창01</title>
    <style>
        /* 화면 중앙 배치 스타일 적용 */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 화면 전체 높이에 맞추기 */
            margin: 0; /* 기본 마진 제거 */
            background-color: white; /* 배경색 추가 */
        }
        .container {
            width: 1440px;
            height: 960px;
            background: white;
            position: relative;
        }
        .box {
            width: 258px;
            height: 85px;
            background: #FF5C3D;
            border-radius: 5px;
            position: absolute;
            display: flex; /* 내부 요소를 중앙에 배치하기 위한 설정 */
            justify-content: center;
            align-items: center;
            cursor: pointer; /* 마우스 포인터 변경 */
            text-decoration: none; /* 링크의 기본 밑줄 제거 */
            color: white; /* 글자 색상 */
        }
        .게시판 {
            left: 609px;
            top: 413px;
        }
        .회원정보 {
            left: 258px;
            top: 413px;
        }
        .결제관리 {
            left: 442px;
            top: 705px;
        }
        .신고관리 {
            left: 0px;
            top: 0px;
        }
        .Group67 {
            width: 723px;
            height: 353px;
            left: 509px;
            top: 413px;
            position: absolute;
        }
        .Group67 .카테고리 {
            left: 465px;
            top: 0px;
        }
        .Group67 .게시판 {
            left: 187px;
            top: 24px;
        }
        .Group67 .결제관리 {
            left: 0px;
            top: 316px;
        }
        .title {
            width: 816px;
            height: 238px;
            left: 355px;
            top: 89px;
            position: absolute;
            color: #FF5C3D;
            font-size: 128px;
            font-family: Prompt;
            font-weight: 700;
            word-wrap: break-word;
        }
        
        .Component {
            width: 80px;
            position: absolute;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            display: inline-flex;
        }
        .Component6 {
            left: 1350px;
            top: 24px;
        }
        .Component7 {
            left: 1253px;
            top: 24px;
        }

        /* 드롭다운 스타일 */
        .dropdown {
            display: none; /* 기본적으로 숨김 */
            position: absolute;
            top: 500px; /* 회원정보 박스 아래 위치 */
            left: 258px; /* 회원정보 박스와 정렬 */
            background: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            z-index: 2; /* 드롭다운이 위에 표시되도록 설정 */
        }
        .dropdown a {
            display: block; /* 링크를 블록 요소로 변경 */
            width: 100%; /* 드롭다운 너비 조정 */
            height: 40px; /* 드롭다운 항목 높이 */
            background: #FF5C3D; /* 드롭다운 항목 배경색 */
            color: white; /* 글자 색상 */
            text-align: center; /* 중앙 정렬 */
            line-height: 40px; /* 세로 가운데 정렬 */
            text-decoration: none; /* 링크의 기본 밑줄 제거 */
        }
        
    </style>
</head>
<body>

    <div class="container">
        <!-- 각 링크 필요한 박스 부분 -->
        <a href="" class="box 게시판" style="font-size: 25px;">게시판</a>
        <a href="" class="box 회원정보" style="font-size: 25px;">회원정보</a>
        <a href="" class="box 결제관리" style="font-size: 25px;">결제관리</a>
        <div class="Group67">
            <a href="" class="box 카테고리" style="font-size: 25px;">카테고리</a>
        </div>
        <div class="Group66" style="width: 258px; height: 85px; left: 830px; top: 705px; position: absolute">
            <a href="" class="box 신고관리" style="font-size: 25px;">신고관리</a>
        </div>

        <!-- 드롭다운 메뉴 -->
        <div class="dropdown" id="userDropdown">
            <a href="#">멘티 회원정보</a>
            <a href="#">멘토 회원정보</a>
        </div>

       
      




        <!-- 메인제목부분 -->
        <div class="title">SAME SAME</div>
        
        <!-- 우상단 관리자 관리 설정 링크 필요? -->
        <div class="Component Component6">
            <div class="text-small"><a href="">관리자설정</a></div>
        </div>
        <div class="Component Component7">
            <div class="text-small"><a href="">관리자님</a></div>
        </div>
    </div>

    <!-- 드롭다운JS -->
    <script>
        function toggleDropdown(event) {
            event.preventDefault(); // 링크 기본 동작 방지
            const dropdown = document.getElementById('userDropdown');
            dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block'; // 드롭다운 토글
        }
    </script>
    
</body>
</html>
