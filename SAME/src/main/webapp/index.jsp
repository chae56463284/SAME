<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath(); // /SAME
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 메인화면</title>
<script src="https://kit.fontawesome.com/88450c0583.js" crossorigin="anonymous"></script>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 화면 전체 높이에 맞추기 */
            margin: 0; /* 기본 마진 제거 */
            background-color: white; /* 배경색 추가 */
        }

        .main {
            width: 1440px;
            height: 960px;
            position: relative;
            background: white;
        }

        .SameSame { 
            width: 816px;
            height: 238px;
            left: 25%;
            top: 30%;
            position: absolute;
            color: #FF5C3D;
            font-size: 128px;
            font-family: Prompt;
            font-weight: 700;
            word-wrap: break-word;
        }
        .login-membership {
            position: absolute;
            right: 0;
            font: bold;
            font-size: 18px;
            font-weight: bold;
        }
        .login-membership a {
            text-decoration: none;
            color: #FF5C3D;
        }

        .search-box {
            display: flex;
            width: 1054px;
            left: 13%;
            top: 50%;
            border-radius: 40px;
            padding: 10px;
            border: 1px solid #FF5C3D;
            position: absolute;
        }

        .search-txt {
            border: none;
            outline: none;
            font-size: 16px;
            line-height: 30px;
            width: 100%;
        }

        .searchInput{
            display: block;
            width: 15%;
            height: auto;
            background-color: #FF5C3D;
            position: relative;
            text-align: center;
            border-radius: 40px;
            color: white;
            line-height: 30px;
            top: 10px;
            left:10px;
        }
        .category-container {
            position: absolute;
            width: 100%;
            top: 50px;
            left: 0;
            background: white;
            border: 1px solid #ccc;
            display: none;
        }

        .category-item, .sub-item {
            padding: 10px;
            cursor: pointer;
            font-size: 15px;
        }

        .sub {
            display: none;
            padding-left: 20px;
        }

    </style>
    <!-- 카테고리 항목 꾸미기 필요 -->
</head>
<body>
    <div class="main">
        <div class="SameSame">SAME SAME</div>

        <div class="login-membership">
            <a href="/SAME/views/member/login.jsp">LOGIN</a> / <a href="/SAME/views/member/signup.jsp">MEMBERSHIP</a> / <a href="/SAME/views/manager/managerIndex.jsp">관리자</a>
        </div>
        <!-- <div class="login-membership">
            <a href="">MYPAGE / LOGOUT</a>
        </div> -->

        <form class="search-box" action="">
            <input class="search-txt" type="text">
    
            <div class="category-container">
                <div class="category-item" data-category="subject">과목</div>
                <div class="sub" id="subject">
                    <div class="sub-item">항목1</div>
                    <div class="sub-item">항목2</div>
                </div>

                <div class="category-item" data-category="gender">성별</div>
                <div class="sub" id="gender">
                    <div class="sub-item">남성</div>
                    <div class="sub-item">여성</div>
                </div>

                <div class="category-item" data-category="age">나이</div>
                <div class="sub" id="age">
                    <div class="sub-item">10</div>
                    <div class="sub-item">20</div>
                </div>

                <div class="category-item" data-category="region">지역</div>
                <div class="sub" id="region">
                    <div class="sub-item">서울</div>
                    <div class="sub-item">부산</div>
                </div>

                </div>
        
        </form>
    </div>

    <!-- 검색창 클릭시 카테고리 항목을 나오게 하기위한 script 부분-->
    <script>
        var searchInput = document.querySelector('.search-txt');
        var categoryBox = document.querySelector('.category-container');
        var categoryItems = document.querySelectorAll('.category-item');
        var subcategories = document.querySelectorAll('.sub');

        // 검색창 클릭 시 카테고리 표시
        searchInput.addEventListener('click', () => {
            categoryBox.style.display = 'block';
        });

        // 세부 항목 표시
        categoryItems.forEach(item => {
            item.addEventListener('click', (event) => {
                var category = event.target.dataset.category;
                subcategories.forEach(sub => {
                    if (sub.id === category) {
                        sub.style.display = sub.style.display === 'block' ? 'none' : 'block';
                    } else {
                        sub.style.display = 'none';
                    }
                });
            });
        });

        // 추후 세부항목 클릭시 이동기능 필요 
    </script>
</body>
</html>