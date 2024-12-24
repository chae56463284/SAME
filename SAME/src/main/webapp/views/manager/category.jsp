<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 관리</title>


  <style>
    /* 메인화면기준 중앙 배치 스타일 적용 */
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* 화면 전체 높이에 맞추기 */
        margin: 0; /* 기본 마진 제거 */
        background-color: white; /* 배경색 추가 */
    }
 
    /*상세설정기본박스설정값*/
    .container {
        position: absolute; /*절대위치설정*/ 
        top: 230px;  /*화면 위치 조정*/
        left: 300px; 
        width: 821px; /*전체 컨테이너 너비 */
        flex-grow: 1; /* 남은 공간 차지 */
        margin: 20px; /* 여백 추가 */
        background: white; /* 배경색 */
        border-radius: 5px; /* 경계선 둥글게 */
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    }

    /*상세시작*/
    
    h1 {
            text-align: center;
            background-color: #FF5C3D;
            color: white;
            margin: auto;
        }

    .category-management {
        display: flex;
        justify-content: space-between;
        height: 500px;
    }

    .existing-categories, .details {
        width: 45%;
    }

    h2 {
        font-size: 1.2em;
    }

    ul {
        list-style: none;
        padding: 0;
        border: 1px solid #ccc;
        height: 350px;
        overflow-y: auto;
    }

    li {
        padding: 10px;
        border-bottom: 1px solid #eee;
        display: flex;
        justify-content: space-between;
    }

    li:last-child {
        border-bottom: none;
    }

    .controls, .sub-category-controls {
        margin: 10px 0;
    }

    button {
        padding: 10px;
        border: none;
        background-color: #FF5C3D;
        color: white;
        border-radius: 5px;
        cursor: pointer;
        margin-right: 5px;
    }

    button:hover {
        background-color: #FF5C3D;
    }

    .footer {
        text-align: center;
        margin-top: 20px;
    }

    select {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
    }

    .delete-btn {
        background-color: #FF5C3D;
        border: none;
        color: white;
        border-radius: 5px;
        cursor: pointer;
        margin-left: 10px;
    }

    .delete-btn:hover {
        background-color: #FF5C3D;
    }


    
    /*상세끝*/
    
     a {
    text-decoration: none; /* 링크의 밑줄 제거 */
    color: black;
    }
    
    /* 사이드바시작 */
    .Sidebar {

            position: absolute;
            width: 256px;
            top: 270px;
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

    /* 모달 스타일 */
    .modal {
        display: none; /* 기본적으로 숨김 */
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .modal-content {
        background-color: #fff;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 300px;
        text-align: center;
        border-radius: 5px;
    }

    .modal-confirm {
        background-color: #FF5C3D; /* 기존 버튼 색상과 동일 */
        color: white;
        border: none;
        padding: 10px;
        border-radius: 5px;
        cursor: pointer;
    }

    .modal-confirm:hover {
        background-color: #FF5C3D; /* 호버 색상 */
    }

    
</style>
</head>
<body>
  <!-- 상세정보시작 -->
  <div style="width: 1440px; height: 960px; position: relative; background: white"> 
    <div class="container">
        <h1>카테고리 관리</h1>
        <div class="category-management">
            <div class="existing-categories">
                <h2>기존 카테고리</h2>
                <ul id="existing-category-list">
                    <li>러시아어 <button class="delete-btn">삭제</button></li>
                    <li>정치학 <button class="delete-btn">삭제</button></li>
                </ul>
            </div>
            <div class="controls">
                <input type="text" id="new-category-input" placeholder="새 카테고리 이름">
                <button id="add-category-btn">추가</button>
                <button id="add-all-btn">모두 추가 >></button>
            </div>
            <div class="details">
                <h2>세부 카테고리</h2>
                <select id="sub-category-select">
                    <option value="">카테고리 선택</option>
                    <option value="과목">과목</option>
                    <option value="과정">과정</option>
                    <option value="영어">영어</option>
                </select>
                <div class="sub-category-controls">
                    <button id="add-sub-category-btn">상위 카테고리 추가</button>
                    <button id="add-sub-category-btn-2">하위 카테고리 추가</button>
                </div>
            </div>
        </div>
        <div class="footer">
            <button id="save-btn">저장하기</button>
            <button id="cancel-btn">취소하기</button>
        </div>
    </div>
    <script>
        document.getElementById('add-category-btn').addEventListener('click', function() {
            const newCategoryInput = document.getElementById('new-category-input');
            const newCategory = newCategoryInput.value.trim();
            
            if (newCategory) {
                showModal(`"${newCategory}" 카테고리를 추가하시겠습니까?`, function() {
                    const categoryList = document.getElementById('existing-category-list');
                    const li = document.createElement('li');
                    li.innerHTML = `${newCategory} <button class="delete-btn">삭제</button>`;
                    categoryList.appendChild(li);
                    addDeleteListener(li.querySelector('.delete-btn'));
                    newCategoryInput.value = ''; // 입력 필드 초기화
                });
            } else {
                showModal('카테고리 이름을 입력하세요.');
            }
        });

        document.getElementById('add-sub-category-btn').addEventListener('click', function() {
            const selectedSubCategory = document.getElementById('sub-category-select').value;

            if (selectedSubCategory) {
                showModal(`"${selectedSubCategory}" 세부 카테고리를 추가하시겠습니까?`, function() {
                    const categoryList = document.getElementById('existing-category-list');
                    const li = document.createElement('li');
                    li.innerHTML = `${selectedSubCategory} <button class="delete-btn">삭제</button>`;
                    categoryList.appendChild(li);
                    addDeleteListener(li.querySelector('.delete-btn'));
                });
            } else {
                showModal('세부 카테고리를 선택하세요.');
            }
        });

        document.getElementById('save-btn').addEventListener('click', function() {
            showModal('변경사항을 저장하시겠습니까?', function() {
                showModal('저장되었습니다.');
                // 실제 저장 로직을 여기에 추가
            });
        });

        document.getElementById('cancel-btn').addEventListener('click', function() {
            showModal('작업을 취소하시겠습니까?', function() {
                showModal('작업이 취소되었습니다.');
                // 실제 취소 로직을 여기에 추가
            });
        });

        // 삭제 버튼에 대한 이벤트 리스너 추가 함수 
        function addDeleteListener(deleteButton) {
            deleteButton.addEventListener('click', function() {
                showModal('이 카테고리를 삭제하시겠습니까?', function() {
                    deleteButton.parentElement.remove();
                    // showModal('카테고리가 삭제되었습니다.');
                });
            });
        }

        // 초기 삭제 버튼에 이벤트 리스너 추가
        const deleteButtons = document.querySelectorAll('.delete-btn');
        deleteButtons.forEach(button => addDeleteListener(button));


    </script>
        
  <!-- 상세정보끝 -->
    
  
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

    <!-- 모달 창 -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <p id="modal-message"></p>
            <button id="modal-confirm-btn" class="modal-confirm">확인</button>
        </div>
    </div>
    <script>
    // 모달을 표시하는 함수
    function showModal(message, onConfirm) {
        const modal = document.getElementById('modal');
        const modalMessage = document.getElementById('modal-message');
        const modalConfirmBtn = document.getElementById('modal-confirm-btn');
    
        modalMessage.textContent = message;
        modal.style.display = 'block';
    
        modalConfirmBtn.onclick = function() {
            modal.style.display = 'none';
            if (onConfirm) onConfirm();
            // showModal('작업이 완료되었습니다.'); // 확인 후 알림 추가
        };
    
        // 모달 외부 클릭 시 모달 닫기
        window.onclick = function(event) {
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        };
    }

    </script>

    



</body>
</html>


