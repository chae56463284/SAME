<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.kh.common.model.vo.PageInfo,com.kh.member.model.vo.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘티회원정보 목록</title>
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
        width: 100%;
        position: relative;
    }
		 
    /*상세설정기본박스설정값*/
    /* 게시판스타일 시작 */
    .table {
        width: 910px;
        flex-direction: column; /*태그 컬럼형식으로 표기*/
        display: flex;
        font-size: 14px;
        /* border-collapse: collapse; 테이블 경계 합치기 */
        /* font-family: 'Inter', sans-serif;  본문 글꼴 설정*/
        background-color: #fff; /* 배경색 추가로 테이블 강조 */
        border: 1px solid #ddd; /* 테두리 추가 */
        border-radius: 5px; /* 테두리 둥글게 */
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
        margin-left: 27%;
        margin-right: auto;
        margin-top: 5%;
    }
    .Title{
        width: 100%;
        font-weight: 900;
        font-size: 20px;
        text-align: left;   /*텍스트 정렬*/
        padding-left: 20px; /*텍스트 시작 패딩 공간 설정*/
    }
    


    a {
    text-decoration: none; /* 링크의 밑줄 제거 */
    color: black;
    }

    .table-header, .table-row {
    display: grid;
    grid-template-columns: 1fr 4fr 1fr 1fr 1fr; /* 열 너비 비율 조정 */
    align-items: center;
    }

    .table-header {
    background-color: #f9f9f9;
    font-weight: 500;
    text-align: center;
    border-bottom: 1px solid #ddd;
    padding: 10px 0;
    }

    .table-row {
    text-align: center;
    border-bottom: 1px solid #eee;
    
    }

    .table-row div {
    padding: 10px 0;
    }

    .table-row:nth-child(even) {
    background-color: #fdfdfd;
    }

    .table-row:nth-child(odd) {
    background-color: #ffffff;
    }

    .pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    }

    .pagination-button {
    background: none;
    border: none;
    font-size: 16px;
    cursor: pointer;
    }

    .page-number {
    margin: 0 5px;
    font-size: 14px;
    cursor: pointer;
    }

</style>
</head>
<body>
    <div class="main">
        <%@ include file="/views/common/mainHeader.jsp" %> <!-- 샘샘해더글 -->
        
        <div class="container">
            <div class="table">
                <%@ include file="/views/common/sidebarManager.jsp" %> <!-- 사이드바메뉴 -->
              
                <div class="Title">
                    <div class="PlaylistSectionTitle">멘티회원정보</div>
                </div>
                <div class="table-header">
                    <div>Member_No</div>
                    <div class="title">회원정보</div>
                    <div>멘티ID</div>
                    <div>일자</div>
                    <div>상태</div>
                </div>
                <!-- 반복되는 행 -->
                <div class="table-row">
                    <div>NO_100</div>
                    <div class="title"><a href="">김민수 (24세) - 010-3487-2156 - 서울시 강남구 테헤란로 123</a></div>
                    <div>mentor01</div>
                    <div>2024-12-15</div>
                    <div>활동</div>
                </div>
                <!-- 추가 행들 -->

                <div class="table-row">
                    <div>NO_100</div>
                    <div class="title"><a href="">이지은 (22세) - 010-5978-3214 - 서울시 송파구 올림픽로 456</a></div>
                    <div>mentor02</div>
                    <div>2024-12-01</div>
                    <div>휴면</div>
                </div>
                    <div class="table-row">
                    <div>NO_100</div>
                    <div class="title"><a href="">김민수 (24세) - 010-3487-2156 - 서울시 강남구 테헤란로 123</a></div>
                    <div>mentor01</div>
                    <div>2024-12-15</div>
                    <div>활동</div>
                </div>
                    <div class="table-row">
                    <div>NO_100</div>
                    <div class="title"><a href="">이지은 (22세) - 010-5978-3214 - 서울시 송파구 올림픽로 456</a></div>
                    <div>mentor02</div>
                    <div>2024-12-01</div>
                    <div>휴면</div>
                </div>
                <div class="table-row">
                    <div>NO_100</div>
                    <div class="title"><a href="">김민수 (24세) - 010-3487-2156 - 서울시 강남구 테헤란로 123</a></div>
                    <div>mentor01</div>
                    <div>2024-12-15</div>
                    <div>활동</div>
                </div>
                <div class="table-row">
                    <div>NO_100</div>
                    <div class="title"><a href="">이지은 (22세) - 010-5978-3214 - 서울시 송파구 올림픽로 456</a></div>
                    <div>mentor02</div>
                    <div>2024-12-01</div>
                    <div>휴면</div>
                </div>
                <div class="table-row">
                    <div>NO_100</div>
                    <div class="title"><a href="">김민수 (24세) - 010-3487-2156 - 서울시 강남구 테헤란로 123</a></div>
                    <div>mentor01</div>
                    <div>2024-12-15</div>
                    <div>활동</div>
                </div>
                <div class="table-row">
                    <div>NO_100</div>
                    <div class="title"><a href="">이지은 (22세) - 010-5978-3214 - 서울시 송파구 올림픽로 456</a></div>
                    <div>mentor02</div>
                    <div>2024-12-01</div>
                    <div>휴면</div>
                </div>
                <div class="table-row">
                    <div>NO_100</div>
                    <div class="title"><a href="">이지은 (22세) - 010-5978-3214 - 서울시 송파구 올림픽로 456</a></div>
                    <div>mentor02</div>
                    <div>2024-12-01</div>
                    <div>휴면</div>
                </div>
            
            </div>
    
    </div>
</div>




</body>
</html>