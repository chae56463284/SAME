<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath(); // /SAME
String memberType = request.getParameter("memberType"); // URL 파라미터에서 memberType 추출
if (memberType == null || memberType.isEmpty()) {
	memberType = "B"; // 기본값: 멘티
}

// 디버깅 코드
System.out.println("DEBUG: Full URL = " + request.getRequestURL() + "?" + request.getQueryString());
System.out.println("DEBUG: memberType = " + memberType);
System.out.println("DEBUG: Trimmed memberType = [" + memberType.trim() + "]");

if ("A".equals(memberType.trim())) {
	System.out.println("DEBUG: 멘토 회원가입 조건 만족");
} else {
	System.out.println("DEBUG: 멘티 회원가입 조건 만족");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.Sidebar {
	position: absolute;
	width: 256px;
	top: 0; /* 위치 조정 */
	left: 0px;
}

.SidebarTitle {
	font-size: 32px;
	font-family: 'Prompt', sans-serif;
	font-weight: bolder;
	font-weight: 700;
	color: #FF5C3D;
	margin-bottom: 16px;
	text-align: left; /* 텍스트 왼쪽 정렬 */
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

.SubMenu {
	display: none; /* 기본적으로 숨김 */
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
</style>
</head>
<body>
	<div class="Sidebar">
		<!-- 제목 추가 -->
		<div class="SidebarTitle">MEMBERSHIP</div>
		<div class="MenuItem" id="memberInfo">
			<div class="MenuItem" id="memberInfo">
				<div class="LogoPlaceholder gray" id="loginLogo"></div>
				<div class="Label">
					<a href="<%=contextPath%>/views/member/login.jsp">로그인</a>
				</div>
			</div>
			<div class="MenuItem" id="boardMenu">
				<div class="LogoPlaceholder gray"></div>
				<div class="Label">회원가입</div>
			</div>
			<div class="SubMenu" id="boardSubMenu">
				<div class="MenuItem">
					<div class="LogoPlaceholder gray"></div>
					<div class="Label">
						<a href="<%=contextPath%>/views/member/signup.jsp?memberType=B">멘티
							회원가입</a>
					</div>
				</div>
				<div class="MenuItem" id="mentorSignup">
					<div class="LogoPlaceholder gray"></div>
					<div class="Label">
						<a href="<%=contextPath%>/views/member/signup.jsp?memberType=A">멘토
							회원가입</a>
					</div>
				</div>
			</div>

			<div class="MenuItem">
				<div class="LogoPlaceholder gray"></div>
				<div class="Label">문의게시판</div>
			</div>
		</div>
	</div>

	<script>
	// LogoPlaceholder 색상 변경 함수
	function changeLogoColor(clickedLogo) {
	    console.log('DEBUG: Changing color for:', clickedLogo);
	    const placeholders = document.querySelectorAll('.LogoPlaceholder');
	    placeholders.forEach(placeholder => {
	        placeholder.classList.remove('orange'); // 기존 주황색 제거
	    });
	    clickedLogo.classList.add('orange'); // 클릭된 로고에 주황색 추가
	}

	// 게시판 메뉴 클릭 시 서브 메뉴 토글
	document.getElementById('boardMenu').addEventListener('click', function (event) {
	    const boardSubMenu = document.getElementById('boardSubMenu');

	    // 디버깅: 현재 서브메뉴 상태 출력
	    console.log('DEBUG: Current display of boardSubMenu:', boardSubMenu.style.display);

	    // 서브 메뉴 열기/닫기
	    if (boardSubMenu.style.display === 'none' || boardSubMenu.style.display === '') {
	        console.log('DEBUG: Opening submenu');
	        boardSubMenu.style.display = 'flex';
	    } else {
	        console.log('DEBUG: Closing submenu');
	        boardSubMenu.style.display = 'none';
	    }

	    // 기본 동작 차단
	    event.preventDefault();
	});

	// 서브 메뉴의 링크 클릭 시 처리
	document.querySelectorAll('.SubMenu .MenuItem').forEach(menuItem => {
	    menuItem.addEventListener('click', function (event) {
	        const logoPlaceholder = this.querySelector('.LogoPlaceholder');
	        const link = this.querySelector('a');

	        // 디버깅: 클릭된 메뉴 출력
	        console.log('DEBUG: SubMenu item clicked:', menuItem);

	        // 색상 변경
	        if (logoPlaceholder) {
	            changeLogoColor(logoPlaceholder);
	        }

	        // 링크가 있는 경우 페이지 이동 허용
	        if (link) {
	            console.log('DEBUG: Link clicked, allowing navigation to:', link.href);
	            return; // 페이지 이동 허용
	        }

	        // 링크가 없으면 기본 동작 차단
	        event.preventDefault();
	        event.stopPropagation(); // 이벤트 전파 방지
	    });
	});

	// DOM 초기화 시 boardSubMenu를 숨긴 상태로 설정
	document.addEventListener('DOMContentLoaded', function () {
    console.log('DEBUG: JavaScript DOMContentLoaded event fired');

    const boardMenu = document.getElementById('boardMenu');
    const boardSubMenu = document.getElementById('boardSubMenu');

    // DOM 요소 확인
    if (!boardMenu || !boardSubMenu) {
        console.error('ERROR: boardMenu or boardSubMenu is null. Check HTML structure.');
        return;
    }

    // 회원가입 메뉴 클릭 시 서브 메뉴 토글
    boardMenu.addEventListener('click', function (event) {
        console.log('DEBUG: boardMenu clicked');
        console.log('DEBUG: Current display of boardSubMenu:', boardSubMenu.style.display);

        if (boardSubMenu.style.display === 'none' || boardSubMenu.style.display === '') {
            console.log('DEBUG: Opening submenu');
            boardSubMenu.style.display = 'flex';
        } else {
            console.log('DEBUG: Closing submenu');
            boardSubMenu.style.display = 'none';
        }

        event.preventDefault();
    });

    // 서브 메뉴 링크 클릭 처리
    document.querySelectorAll('.SubMenu .MenuItem a').forEach(link => {
        link.addEventListener('click', function (event) {
            console.log('DEBUG: Link clicked, navigating to:', this.href);
        });
    });
});
    </script>

</body>
</html>