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
        width: 900px;
        margin: 0 auto;
        font-family: 'Inter', sans-serif;
        display: flex;
        flex-direction: column;
    } 
  /*검색창 시작*/
  .search-container {
      display: flex; /* 플렉스 박스 모델로 설정 */
      align-items: center; /* 세로 중앙 정렬 */
      background-color: #fff; /* 배경색 설정 */
      border: 1px solid #ccc; /* 테두리 설정 */
      border-radius: 4px; /* 모서리 둥글게 설정 */
      padding: 10px; /* 내부 여백 설정 */
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
      position: absolute;
      
      top: 10px;
    
  }

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
    margin-top: 130px; /* 필터 섹션과의 간격 */
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
      <!-- 검색창시작 -->
      <div class="search-container">
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
      <div class="table">
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
       <div class="SameSame" style="width: 816px; height: 238px; left: 356px; top: -1px; position: absolute; font-size: 128px; font-family: Prompt; font-weight: 700; word-wrap: break-word">
      <a href="/same/views/manager/managerIndex.jsp" style="color: #FF5C3D;">SAME SAME</a>
      </div>
      
      <!-- 매니져 제목 -->
      <div class="Manager" style="width: 463px; height: 238px; left: 14px; top: 162px; position: absolute; color: #FF5C3D; font-size: 50px; font-family: Prompt; font-weight: 700; word-wrap: break-word">
      MANAGER
      </div>
      
       <div class="Sidebar">
        
        
        <div class="MenuItems">
            <div class="MenuItem" id="memberInfo">
                <div class="LogoPlaceholder"></div>
                <div class="Label">회원정보</div>
            </div>
            <div class="SubMenu" id="subMenu">
                <div class="MenuItem">
                    <div class="LogoPlaceholder gray"></div>
                    <div class="Label"><a href="/same/views/manager/mentorInfoList.jsp">멘토 회원정보</a></div>
                </div>
                <div class="MenuItem">
                    <div class="LogoPlaceholder gray"></div>
                    <div class="Label"><a href="/same/views/manager/menteeInfoList.jsp">멘티 회원정보</a></div>
                </div>
            </div>
            
            <div class="MenuItem" id="boardMenu">
                <div class="LogoPlaceholder gray"></div>
                <div class="Label">게시판</div>
            </div>
            <div class="SubMenu" id="boardSubMenu">
                <div class="MenuItem">
                    <div class="LogoPlaceholder gray"></div>
                    <div class="Label"><a href="/same/views/manager/boardAList.jsp">자유게시판</a></div>
                </div>
                <div class="MenuItem">
                    <div class="LogoPlaceholder gray"></div>
                    <div class="Label"><a href="/same/views/manager/boardBList.jsp">리뷰게시판</a></div>
                </div>
                <div class="MenuItem">
                    <div class="LogoPlaceholder gray"></div>
                    <div class="Label"><a href="/same/views/manager/boardCList.jsp">문의게시판</a></div>
                </div>
            </div>
            
            <div class="MenuItem">
                <div class="LogoPlaceholder gray"></div>
                <div class="Label"><a href="/same/views/manager/category.jsp">카테고리</a></div>
            </div>
            <div class="MenuItem">
                <div class="LogoPlaceholder gray"></div>
                <div class="Label"> <a href="/same/views/manager/transactionList.jsp">결제관리</a></div>
            </div>
            <div class="MenuItem">
                <div class="LogoPlaceholder gray"></div>
                <div class="Label"><a href="/same/views/manager/complaintList.jsp">신고관리</a></div>
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
    
     
</div>



  
  <!-- 페이징 바-->
  <!-- <div align="center" class="paging-area">
 <%--    <% if(currentPage != 1){ %>
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




</body>
</html>