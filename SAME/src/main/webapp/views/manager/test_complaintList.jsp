<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>신고목록 관리</title>

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
  /*검색창 시작*/
  
  label {
      margin-right: 10px; /* 레이블과 입력창 간의 간격 설정 */
      color: #333; /* 레이블 색상 설정 */
  }

  input[type="text"] {
      flex-grow: 1; /* 입력창이 가능한 공간을 모두 차지하도록 설정 */
      padding: 8px; /* 입력창 내부 여백 설정 */
      border: 1px solid #ccc; /* 입력창 테두리 설정 */
      border-radius: 4px; /* 입력창 모서리 둥글게 설정 */
      outline: none; /* 포커스 시 테두리 강조 제거 */
  }

  input[type="text"]:focus {
      border-color: #007bff; /* 포커스 시 테두리 색상 변경 */
  }

  select {
      padding: 8px; /* 드롭다운 내부 여백 설정 */
      border: 1px solid #ccc; /* 드롭다운 테두리 설정 */
      border-radius: 4px; /* 드롭다운 모서리 둥글게 설정 */
      margin-left: 10px; /* 드롭다운과 입력창 간의 간격 설정 */
      background-color: #fff; /* 드롭다운 배경색 설정 */
      cursor: pointer; /* 마우스 커서 포인터로 변경 */
  }

  /*검색창 끝*/

  /* 게시판 시작 */
  .Title{
        width: 100%;
        font-weight: 900;
        font-size: 20px;
        text-align: left;   /*텍스트 정렬*/
        padding-left: 20px; /*텍스트 시작 패딩 공간 설정*/
    }
  
  .table-header, .table-row {
    display: grid;
    grid-template-columns: 1fr 4fr 1fr 1fr 1fr 1fr ; /* 열 너비 비율 조정 */
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
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;

  }

  .pagination-button {
    background: none;
    border: none;
    font-size: 20px;
    cursor: pointer;
  }

  .page-number {
    margin: 0 5px;
    font-size: 14px;
    cursor: pointer;
}
     
      a {
    text-decoration: none; /* 링크의 밑줄 제거 */
    color: black;
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
              <!-- 검색창시작 -->
              <div class="table-row">
                <label for="search-box">검색창</label>
                <input type="text" id="search-box" placeholder="Search tickets..." />
                <select id="dropdown">
                  <option value="all">전체</option>
                  <option value="option1">신고자</option>
                  <option value="option2">처리</option>
                  <option value="option3">미처리</option>
                </select>
              </div>

                <script>
                  // 드롭다운 선택 시 콘솔에 선택된 값 출력
                  document.getElementById('dropdown').addEventListener('change', function() {
                    console.log("선택된 값: " + this.value);
                  });
                </script>
                <!-- 검색창끝 -->


              <div class="PlaylistSectionTitle">신고게시판_관리모드</div>
              
            </div>
            <div class="table-header">
              <div>Border_No</div>
              <div>신고내역</div>
              <div>신고자ID</div>
              <div>신고사유</div>
              <div>신고일</div>
              <div>처리상태</div>
            </div>
            <!-- 반복되는 행 -->
            <div class="table-row">
              <div>NO_100</div>
              <div>상습적인 노쇼 근거없는 리뷰작성자 신고합니다</div>
              <div>user01</div>
              <div>신고사유</div>
              <div>2024-12-01</div>
              <div>처리</div>
            </div>
              <!-- 추가 행들 -->
            <div class="table-row">
              <div>NO_100</div>
              <div>웹사이트와 관련없는 광고글 신고합니다</div>
              <div>user01</div>
              <div>신고사유</div>
              <div>2024-12-01</div>
              <div>보류</div>
            </div> <div class="table-row">
              <div>NO_100</div>
              <div>과도한 욕설 및 희롱 내용으로 신고합니다</div>
              <div>user01</div>
              <div>신고사유</div>
              <div>2024-12-01</div>
              <div>보류</div>
            </div> <div class="table-row">
              <div>NO_100</div>
              <div>교육내용 부실 잘못된 프로필 등록 신고합니다</div>
              <div>user01</div>
              <div>신고사유</div>
              <div>2024-12-01</div>
              <div>처리</div>
            </div> <div class="table-row">
              <div>NO_100</div>
              <div>과도한 욕설 및 희롱 내용으로 신고합니다</div>
              <div>user01</div>
              <div>신고사유</div>
              <div>2024-12-01</div>
              <div>처리</div>
            </div> <div class="table-row">
              <div>NO_100</div>
              <div>교육내용 부실 잘못된 프로필 등록 신고합니다</div>
              <div>user01</div>
              <div>신고사유</div>
              <div>2024-12-01</div>
              <div>처리</div>
            </div> <div class="table-row">
              <div>NO_100</div>
              <div>과도한 욕설 및 희롱 내용으로 신고합니다</div>
              <div>user01</div>
              <div>신고사유</div>
              <div>2024-12-01</div>
              <div>처리</div>
            </div> <div class="table-row">
              <div>NO_100</div>
              <div>교육내용 부실 잘못된 프로필 등록 신고합니다</div>
              <div>user01</div>
              <div>신고사유</div>
              <div>2024-12-01</div>
              <div>처리</div>
            </div> <div class="table-row">
              <div>NO_100</div>
              <div>과도한 욕설 및 희롱 내용으로 신고합니다</div>
              <div>user01</div>
              <div>신고사유</div>
              <div>2024-12-01</div>
              <div>처리</div>
            </div>  
        
      </div>
    </div>
  </div>
</body>
</html>