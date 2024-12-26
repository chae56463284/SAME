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
	left: 5%;
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
		<div class="SidebarTitle">BOARD</div>
		

		<div class="MenuItems">
			<div class="MenuItem" id="memberInfo">
				<div class="LogoPlaceholder"></div>
				<div class="Label">전체글보기</div>
			</div>
			
			<div class="MenuItem">
				<div class="LogoPlaceholder gray"></div>
				<div class="Label">인기글모음</div>
			</div>

			<div class="MenuItem" id="boardMenu">
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
	</div>

	<script>

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