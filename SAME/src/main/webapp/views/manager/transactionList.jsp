<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <title>결제목록 관리</title>

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
        width: 900px;
        margin: 0 auto;
        font-family: 'Inter', sans-serif;
        display: flex;
        flex-direction: column;
    } 
    .filter-section {
        width: 100%;
        border-radius: 10px;
        background: #ffffff;

        margin: 0 auto 20px;
        display: flex;
        flex-direction: column;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

  .filter-row {
    display: flex;
    align-items: center;
    padding: 10px 20px;
  }

  .filter-item {
    width: 120px;
    text-align: center;
    font-size: 14px;
    font-weight: 600;
    color: #333;
  }

  .filter-content {
    display: flex;
    align-items: center;
    gap: 10px;
  }

  .date-input,
  .text-input {
    border: 1px solid #dcdcdc;
    border-radius: 5px;
    padding: 8px;
    font-size: 14px; 
    width: 200px;
  }

  .date-separator {
    font-size: 14px;
    color: #666;
  }

  .text-input {
    width: 150px;
  }

  .radio-group label {
    margin-right: 15px;
    font-size: 14px;
    font-weight: 500;
    color: #333;
    cursor: pointer;
    display: flex;
    align-items: center;
  }
  .radio-group input {
    margin-right: 5px;
  }

  .search-button {
    background: #ff5c3d;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 8px 15px;
    cursor: pointer;
    font-size: 14px;
    font-weight: 600;
    transition: background 0.3s ease;
  }

  /* 구분선 스타일 */
  .divider {
    width: 100%;
    height: 1px;
    background: #e0e0e0;
  }


  /* 게시판 시작 */
  .List {
        width: 1021px;
        height: 565px;
        left: 320px;
        top: 143px;
        position: absolute;
        flex-direction: column;
        justify-content: flex-start;
        align-items: flex-start;
        display: inline-flex;
    }
  .table {
      width: 100%;
    margin-top: 20px; /* 필터 섹션과의 간격 */
    border-collapse: collapse;
    font-family: 'Inter', sans-serif;
    font-size: 14px;
    text-align: center; /* 테이블 내용 가운데 정렬 */
    background-color: #fff; /* 배경색 추가로 테이블 강조 */
    border: 1px solid #ddd; /* 테두리 추가 */
    border-radius: 5px; /* 테두리 둥글게 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
  }
  .table-header,
  .table-row {
    display: grid;
    grid-template-columns: 1fr 2fr 1fr 2fr 1fr 1fr 1fr; /* 열 너비 비율 조정 */
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
     

    /* 사이드바시작 */
    .Sidebar {
        position: absolute;
            width: 256px;
            top: 270px;
            
            
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
        display: none;
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
    /* 사이드바끝 */

    



    
</style>
</head>
<body>
  <!-- 게시판시작 -->
  <div style="width: 1440px; height: 960px; position: relative; background: white">
    <div class="List">
        <div class="filter-section">
            <div class="filter-row">
              <div class="filter-item">
                <label for="start-date">정산등록일</label>
              </div>
              <div class="filter-content">
                <input type="date" id="start-date" class="date-input" value="2024-12-01" />
                <span class="date-separator">~</span>
                <input type="date" id="end-date" class="date-input" value="2024-12-01" />
              </div>
            </div>
            <div class="divider"></div>
            <div class="filter-row">
              <div class="filter-item">
                <label>정산처리상태</label>
              </div>
              <div class="filter-content radio-group">
                <label><input type="radio" name="status" value="all" checked /> 전체</label>
                <label><input type="radio" name="status" value="processed" /> 처리</label>
                <label><input type="radio" name="status" value="unprocessed" /> 미처리</label>
              </div>
            </div>
            <div class="divider"></div>
            <div class="filter-row">
              <div class="filter-item">
                <label for="mentee-name">멘티명</label>
              </div>
              <div class="filter-content">
                <input type="text" id="mentee-name" class="text-input" placeholder="검색어 입력" />
                <button class="search-button">검색</button>
              </div>
            </div>
        </div>
          
        <div class="table">
          <div class="table-header">
            <div>거래번호</div>
            <div>강좌명</div>
            <div>멘티명</div>
            <div>수업 기간</div>
            <div>결제수단</div>
            <div>거래액</div>
            <div>정산 상태</div>
          </div>
          <!-- 반복되는 행 -->
          <div class="table-row">
            <div>NO_100</div>
            <div>중국어 강의 초급반</div>
            <div>홍길동</div>
            <div>2024-12-01 ~ 2024-12-15</div>
            <div>신용카드</div>
            <div>15,000</div>
            <div>처리</div>
          </div>
            <!-- 추가 행들 -->
          <div class="table-row">
            <div>NO_99</div>
            <div>영어 강의 초급반</div>
            <div>김철수</div>
            <div>2024-12-01 ~ 2024-12-15</div>
            <div>카카오페이</div>
            <div>15,000</div>
            <div>미처리</div>
          </div>
          <div class="table-row">
            <div>NO_99</div>
            <div>일본어 강의 초급반</div>
            <div>정상희</div>
            <div>2024-12-01 ~ 2024-12-15</div>
            <div>카카오페이</div>
            <div>15,000</div>
            <div>미처리</div>
          </div>
          <div class="table-row">
            <div>NO_99</div>
            <div>수학 강의 초급반</div>
            <div>정상희</div>
            <div>2024-12-01 ~ 2024-12-15</div>
            <div>카카오페이</div>
            <div>15,000</div>
            <div>미처리</div>
          </div>
          <div class="table-row">
            <div>NO_99</div>
            <div>국영수 강의 초급반</div>
            <div>이영희</div>
            <div>2024-12-01 ~ 2024-12-15</div>
            <div>카카오페이</div>
            <div>15,000</div>
            <div>미처리</div>
          </div>
          <div class="table-row">
            <div>NO_99</div>
            <div>중국어 강의 초급반</div>
            <div>정상희</div>
            <div>2024-12-01 ~ 2024-12-15</div>
            <div>카카오페이</div>
            <div>15,000</div>
            <div>미처리</div>
          </div>
          <div class="table-row">
            <div>NO_99</div>
            <div>중국어 강의 초급반</div>
            <div>정상희</div>
            <div>2024-12-01 ~ 2024-12-15</div>
            <div>카카오페이</div>
            <div>15,000</div>
            <div>미처리</div>
          </div>
          <div class="table-row">
            <div>NO_99</div>
            <div>중국어 강의 초급반</div>
            <div>정상희</div>
            <div>2024-12-01 ~ 2024-12-15</div>
            <div>카카오페이</div>
            <div>15,000</div>
            <div>미처리</div>
          </div>
          <div class="table-row">
            <div>NO_99</div>
            <div>중국어 강의 초급반</div>
            <div>정상희</div>
            <div>2024-12-01 ~ 2024-12-15</div>
            <div>카카오페이</div>
            <div>15,000</div>
            <div>미처리</div>
          </div>
        </div>
          
            <!-- 페이징바,,, 배운대로 다시 설정해야함. 임의로 숫자 써 넣음-->
            <div class="pagination">
              <button class="pagination-button">&laquo;</button>
              <span class="page-number">1</span>
              <span class="page-number">2</span>
              <span class="page-number">3</span>
              <span class="page-number">4</span>
              <span class="page-number">5</span>
              <span class="page-number">6</span>
              <span class="page-number">7</span>
              <span class="page-number">8</span>
              <span class="page-number">9</span>
              <span class="page-number">10</span>
              <button class="pagination-button">&raquo;</button>
      
            </div>
    </div>
      
      <!-- 사이드바시작 -->
      <div class="Sidebar">
        <div class="Line"></div>
        
        <div class="MenuItems">
            <div class="MenuItem" id="memberInfo">
                <div class="LogoPlaceholder"></div>
                <div class="Label">회원정보</div>
            </div>
            <div class="SubMenu" id="subMenu">
                <div class="MenuItem">
                    <div class="LogoPlaceholder gray"></div>
                    <div class="Label">멘토 회원정보</div>
                </div>
                <div class="MenuItem">
                    <div class="LogoPlaceholder gray"></div>
                    <div class="Label">멘티 회원정보</div>
                </div>
            </div>
            
            <div class="MenuItem" id="boardMenu">
                <div class="LogoPlaceholder gray"></div>
                <div class="Label">게시판</div>
            </div>
            <div class="SubMenu" id="boardSubMenu">
                <div class="MenuItem">
                    <div class="LogoPlaceholder gray"></div>
                    <div class="Label">자유게시판</div>
                </div>
                <div class="MenuItem">
                    <div class="LogoPlaceholder gray"></div>
                    <div class="Label">리뷰게시판</div>
                </div>
                <div class="MenuItem">
                    <div class="LogoPlaceholder gray"></div>
                    <div class="Label">문의게시판</div>
                </div>
            </div>
            
            <div class="MenuItem">
                <div class="LogoPlaceholder gray"></div>
                <div class="Label">카테고리</div>
            </div>
            <div class="MenuItem">
                <div class="LogoPlaceholder gray"></div>
                <div class="Label">결제관리</div>
            </div>
            <div class="MenuItem">
                <div class="LogoPlaceholder gray"></div>
                <div class="Label">신고관리</div>
            </div>
            <div class="MenuItem">
                <div class="LogoPlaceholder gray"></div>
                <div class="Label">통계</div>
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
    <!-- 페이지 제목 -->
    <div class="SameSame" style="width: 816px; height: 238px; left: 356px; top: -1px; position: absolute; color: #FF5C3D; font-size: 128px; font-family: Prompt; font-weight: 700; word-wrap: break-word">SAME SAME</div>
    
    <!-- 매니져 제목 -->
    <div class="Manager" style="width: 463px; height: 238px; left: 14px; top: 162px; position: absolute; color: #FF5C3D; font-size: 50px; font-family: Prompt; font-weight: 700; word-wrap: break-word">MANAGER</div>
     
</div>



  
  <!-- 페이징 바-->
  <!-- <div align="center" class="paging-area">
<%--     <% if(currentPage != 1){ %>
      <button onclick="movePage(<%= currentPage -1 %>)">&lt;</button>
    <% }%>
    
      <% for(int p = startPage; p <= endPage; p++) { %>
        <button onclick="movePage(<%=p %>);" 
        <% if(currentPage == p) { %>
          class="on"
        <% } %>><%= p %></button>
      <% } %>
      
      <% if(maxPage != currentPage) { %>
        <button onclick="movePage(<%= currentPage + 1 %>)">&gt;</button>
      <% } %> --%>
  </div>
  <script>
    function movePage(cpage){
      location.assign('/board/list?cpage='+cpage);
    }
  </script> -->
    



</body>
</html>
