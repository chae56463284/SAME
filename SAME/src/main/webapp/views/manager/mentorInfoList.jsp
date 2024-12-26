<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.kh.common.model.vo.PageInfo,com.kh.member.model.vo.Member" %>
<%
/*  String contextPath = request.getContextPath();
Member loginUser = (Member)session.getAttribute("loginUser");
System.out.println(loginUser);

String alertMsg = (String)session.getAttribute("alertMsg");
List <Member> list = (List<Member>) request.getAttribute("list");
PageInfo pi = (PageInfo) request.getAttribute("pi");

int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();  */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토회원정보 목록</title>
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
        
     /* 검색바 */
        
    /*상세설정기본박스설정값*/
    /* 게시판스타일 시작 */
    .table {
    position: absolute; /*절대위치설정*/
    width: 910px;
    top: 220px;  /*화면 위치 조정*/
    left: 320px;
    /* border-collapse: collapse; 테이블 경계 합치기 */
    display: flex;
    flex-direction: column; /*태그 컬럼형식으로 표기*/
    /* font-family: 'Inter', sans-serif;  본문 글꼴 설정*/
    font-size: 14px;
    text-align: center; /* 테이블 내용 가운데 정렬 */
    background-color: #fff; /* 배경색 추가로 테이블 강조 */
    border: 1px solid #ddd; /* 테두리 추가 */
    border-radius: 5px; /* 테두리 둥글게 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
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
    <div style="width: 1440px; height: 960px; position: relative; background: white">
        <div class="table">
            <div class="Title">
                <div class="PlaylistSectionTitle">멘토회원정보</div>
            </div>
            <div class="table-header">
            <div>Member_No</div>
            <div class="title">간략프로필</div>
            <div>멘토ID</div>
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



 
      
    
    
  
  
  <!-- 페이징 바-->
  <!-- <div align="center" class="paging-area">
   <%--  <% if(currentPage != 1){ %>
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
      location.assign('/manager/mentorInfoList?cpage='+cpage);
    }
    </script> -->
     <div class="SameSame" style="width: 816px; height: 238px; left: 356px; top: -1px; position: absolute; font-size: 128px; font-family: Prompt; font-weight: 700; word-wrap: break-word">
      <a href="/same/views/manager/managerIndex.jsp" style="color: #FF5C3D;">SAME SAME</a>
      </div>
      
      <!-- 매니져 제목 -->
      <div class="Manager" style="width: 463px; height: 238px; left: 14px; top: 162px; position: absolute; color: #FF5C3D; font-size: 50px; font-family: Prompt; font-weight: 700; word-wrap: break-word">
      MANAGER
      </div>
      
      <!-- 사이드바시작 -->
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

</body>
</html>