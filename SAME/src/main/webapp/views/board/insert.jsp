<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kh.board.model.vo.Category" %>	

<% 
	List<Category> list = (List<Category>)  request.getAttribute("list");
	String[] boardType = (String[]) request.getAttribute("boardType");	
%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	background-color: white;
}

.container {
	width: 100%;
	position: relative;
	display: flex;
	flex-direction: column;
}

.form-container {
	width: 800px;
	margin: 10px auto;
	padding: 40px;
	background: #ffffff;
	border: 1px solid #828282;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	position: relative;
	margin-left: 25%;
}

.anonymous {
	position: absolute;
	top: 10px;
	right: 40px;
	display: flex;
	align-items: center;
}

.anonymous input {
	margin-right: 5px;
}

.form-group {
	margin-bottom: 20px;
	display: flex;
	align-items: center;
}

.form-group label {
	width: 100px;
	font-weight: bold;
	color: white;
	background: #ff5c3d;
	padding: 8px;
	text-align: center;
	border-radius: 5px;
	margin-right: 20px;
}

.form-group input[type="text"], .form-group textarea, .form-group select
	{
	flex: 1;
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

.form-group textarea {
	resize: none;
	height: 120px;
}

.file-upload {
	display: flex;
	align-items: center;
}

.submit-button {
	display: block;
	margin: 20px auto;
	padding: 10px 20px;
	background-color: #ff5c3d;
	color: #fff;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.submit-button:hover {
	background-color: #e54c2e;
}

/* 리뷰폼시작 */
#reviewForm {
    display: none;  /* 초기에는 숨김 */
    width: 100%;
}

.star-rating {
    display: flex;
    margin-bottom: 10px;
}

.star {
    font-size: 24px;
    color: #ccc;
    cursor: pointer;
}

.star.selected {
    color: #ffcc00;
}


</style>
</head>
<body>
	<div class="main">
		<%@ include file="/views/common/mainHeader.jsp"%>
		<%@ include file="/views/common/searchbar.jsp"%>
		<br> <br>
		<!-- 컨테이너 시작-->
		<div class="container">
			<%@ include file="/views/common/sidebarBoard.jsp"%>
			<div class="form-container">
				<!-- 익명 체크 -->
				<div class="anonymous">
					<input type="checkbox" id="anonymous" name="anonymous"> <label
						for="anonymous">익명</label>
				</div>
				<form action="<%= contextPath%>/board/insert" method="post" enctype="multipart/form-data">
					
					
					
					<!-- 게시판 타입 선택 부분 수정 -->
					<div class="form-group">
					    <label for="boardType">작성게시판</label>
					    <select id="boardType" name="boardType" onchange="toggleForms()">  
					    <!-- id="category"를 "boardType"으로 수정 -->
					        <% for(String str : boardType) { %>
					            <option value="<%= str %>"><%=str %></option>
					        <% } %>
					    </select>
					</div>
					
					 <!-- 일반 게시글 폼 -->
                    <div id="normalForm">
                        <div class="form-group">
                            <label for="category">말머리</label>
                            <select id="category" name="category">
                                <% for(Category c : list) { %>
                                    <option value="<%= c.getCategoryType() %>"><%=c.getCategoryName() %></option>
                                <% } %>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="title">제목</label>
                            <input type="text" id="title" name="title" placeholder="제목을 입력하세요." required>
                        </div>

                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea id="content" name="content" placeholder="내용을 입력하세요." required></textarea>
                        </div>
                    </div>

                    <!-- 리뷰 게시글 폼 -->
                    <div id="reviewForm">
                        <div class="form-group">
							<label for="category">말머리</label>
                            <select id="category" name="category">
                                <% for(Category c : list) { %>
                                    <option value="<%= c.getCategoryType() %>"><%=c.getCategoryName() %></option>
                                <% } %>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="reviewTitle">제목</label>
                            <input type="text" id="reviewTitle" name="title" required>
                        </div>

                        <div class="form-group">
                            <label>평점</label>
                            <div class="star-rating" id="starRating">
                                <span class="star" data-value="1">★</span>
                                <span class="star" data-value="2">★</span>
                                <span class="star" data-value="3">★</span>
                                <span class="star" data-value="4">★</span>
                                <span class="star" data-value="5">★</span>
                            </div>
                            <input type="hidden" name="rating" id="ratingValue">
                        </div>

                        <div class="form-group">
                            <label for="reviewContent">내용</label>
                            <textarea id="reviewContent" name="content" rows="5" required></textarea>
                        </div>
                    </div>

                    <!-- 첨부파일 -->
                    <div class="form-group">
                        <label for="upfile">첨부파일</label>
                        <div class="file-upload">
                            <input type="file" id="upfile" name="upfile" accept="image/*">
                        </div>
                    </div>

                    <button type="submit" class="submit-button">등록</button>
                </form>
            </div>
        </div>
    </div>

	<script>
		// 페이지 로드 시 초기 폼 상태 설정
		document.addEventListener('DOMContentLoaded', function() {
			toggleForms(); // 페이지 로드 시 초기 상태 설정
		});
		
		// 폼 전환 함수
		function toggleForms() {
			const boardType = document.getElementById('boardType').value;
			const normalForm = document.getElementById('normalForm');
			const reviewForm = document.getElementById('reviewForm');
			
			console.log('Selected board type:', boardType); // 디버깅용
			
			if(boardType === '리뷰') {
				normalForm.style.display = 'none';
				reviewForm.style.display = 'block';
				// 리뷰 폼의 필드들을 required로 설정
				document.getElementById('reviewTitle').required = true;
				document.getElementById('reviewContent').required = true;
				// 일반 폼의 필드들은 required 해제
				document.getElementById('title').required = false;
				document.getElementById('content').required = false;
			} else {
				normalForm.style.display = 'block';
				reviewForm.style.display = 'none';
				// 일반 폼의 필드들을 required로 설정
				document.getElementById('title').required = true;
				document.getElementById('content').required = true;
				// 리뷰 폼의 필드들은 required 해제
				document.getElementById('reviewTitle').required = false;
				document.getElementById('reviewContent').required = false;
			}
		}
		
		// 별점 기능
		const stars = document.querySelectorAll('.star');
		let selectedRating = 0;
		
		stars.forEach(star => {
			star.addEventListener('click', () => {
				selectedRating = parseInt(star.getAttribute('data-value'));
				document.getElementById('ratingValue').value = selectedRating;
				stars.forEach(s => s.classList.remove('selected'));
				for (let i = 0; i < selectedRating; i++) {
					stars[i].classList.add('selected');
				}
			});
		});
		
		// 폼 제출 전 유효성 검사
		document.querySelector('form').addEventListener('submit', function(e) {
			e.preventDefault(); // 일단 제출을 막음
			
			const boardType = document.getElementById('boardType').value;
			
			if(boardType === '리뷰') {
				if(!selectedRating) {
					alert('평점을 선택해주세요.');
					return;
				}
				
				const reviewTitle = document.getElementById('reviewTitle').value.trim();
				const reviewContent = document.getElementById('reviewContent').value.trim();
				
				if(!reviewTitle) {
					alert('제목을 입력해주세요.');
					return;
				}
				
				if(!reviewContent) {
					alert('내용을 입력해주세요.');
					return;
				}
			} else {
				const title = document.getElementById('title').value.trim();
				const content = document.getElementById('content').value.trim();
				
				if(!title) {
					alert('제목을 입력해주세요.');
					return;
				}
				
				if(!content) {
					alert('내용을 입력해주세요.');
					return;
				}
			}
			
			// 모든 검증을 통과하면 폼 제출
			this.submit();
		});
	</script>
</body>
</html>