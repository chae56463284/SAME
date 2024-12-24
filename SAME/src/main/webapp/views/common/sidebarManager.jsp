<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	left: 26px;
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
		<div class="SidebarTitle">MANAGER</div>
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
				<div class="Label">신고관리</div>
			</div>
			<div class="MenuItem">
				<div class="LogoPlaceholder gray"></div>
				<div class="Label">카테고리</div>
			</div>
			<div class="MenuItem">
				<div class="LogoPlaceholder gray"></div>
				<div class="Label">결제관리</div>
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
</body>
</html>