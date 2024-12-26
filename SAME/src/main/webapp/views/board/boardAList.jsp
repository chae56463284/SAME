<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kh.board.model.vo.Board, com.kh.common.model.vo.PageInfo" %>
<%
	/* List<Board> list = (List<Board>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage= pi.getEndPage();
	int maxPage = pi.getMaxPage(); */
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>자유게시판</title>
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
		
		.Title {
			width: 100%;
			font-weight: 900;
			font-size: 20px;
			text-align: left; /*텍스트 정렬*/
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
		<%@ include file="/views/common/searchbar.jsp" %> <!-- 검색바 -->
	
	
		<div class="container">
			
				<div class="table">
					<%@ include file="/views/common/sidebarBoard.jsp" %> <!-- 사이드바메뉴 -->
				<div class="Title">
					<div class="PlaylistSectionTitle">자유게시판_관리모드</div>
				</div>
				<div class="table-header">
					<div>Border_No</div>
					<div class="title">글제목</div>
					<div>작성자ID</div>
					<div>작성일</div>
					<div>조회수</div>
				</div>
				<!-- 반복되는 행 -->
				<%--  <% for(Board b : list) { %>
				<div class="table-row">
					<div><%= b.getboardNo() %></div>
					<div class="title"><a href=""> <%= b.getboardTitle() %> </a></div>
					<div> <%= b.getmemberNo() %> </div>
					<div> <%= b.getCreateDate() %> </div>
					<div> <%= b.getCount() %> </div> 
				</div>
				 <% } %>
                <% } %> --%>
				<!-- 추가 행들 -->

				<div class="table-row">
					<div>NO_100</div>
					<div class="title"><a href="">최근 가장 인기 있는 멘토는?</a></div>
					<div>mentor02</div>
					<div>2024-12-01</div>
					<div></div>
				</div>
				<div class="table-row">
					<div>NO_100</div>
					<div class="title"><a href="">가장 기억에 남는 포트폴리오 추천해주세요!</a></div>
					<div>mentor01</div>
					<div>2024-12-15</div>
					<div><button>삭제</button></div>
				</div>
				<div class="table-row">
					<div>NO_100</div>
					<div class="title"><a href="">기억에 남는 수강 경험이 있나요?</a></div>
					<div>mentor02</div>
					<div>2024-12-01</div>
					<div><button>삭제</button></div>
				</div>
				<div class="table-row">
					<div>NO_100</div>
					<div class="title"><a href="">궁금한점 무엇이든 물어보세요!</a></div>
					<div>mentor01</div>
					<div>2024-12-15</div>
					<div><button>삭제</button></div>
				</div>
				<div class="table-row">
					<div>NO_100</div>
					<div class="title"><a href="">나의 공부법을 공개합니다!</a></div>
					<div>mentor02</div>
					<div>2024-12-01</div>
					<div><button>삭제</button></div>
				</div>
				<div class="table-row">
					<div>NO_100</div>
					<div class="title"><a href="">어떤 음악을 듣고 계신가요?</a></div>
					<div>mentor01</div>
					<div>2024-12-15</div>
					<div><button>삭제</button></div>
				</div>
				<div class="table-row">
					<div>NO_100</div>
					<div class="title"><a href="">내생각을 적어본다</a></div>
					<div>mentor02</div>
					<div>2024-12-01</div>
					<div><button>삭제</button></div>
				</div>
				<div class="table-row">
					<div>NO_100</div>
					<div class="title"><a href="">관리자님 프로모션 계획은 없나요?~</a></div>
					<div>mentor02</div>
					<div>2024-12-01</div>
					<div><button>삭제</button></div>
				</div>
						
				<!--강의시 사용한 페이징 바-->
				<%-- <div align="center" class="paging-area">
					<% if(currentPage != 1){ %>
					<button onclick="movePage(<%= currentPage -1 %>)">&lt;</button>
					<% }%>

					<% for(int p = startPage; p <= endPage; p++) { %>
					<button onclick="movePage(<%=p %>);" <% if(currentPage == p) { %>
						class="on" <% } %>><%= p %></button>
					<% } %>

					<% if(maxPage != currentPage) { %>
					<button onclick="movePage(<%= currentPage + 1 %>)">&gt;</button>
					<% } %>
				</div>
			</dis>
			<script>
				function movePage(cpage){
					location.assign('<%= contextPath %>/board/list?cpage='+cpage);
				}
			</script> --%>
			<!--강의시 사용한 페이징 바-->


		</div>
</div>
		
	

</body>
</html>