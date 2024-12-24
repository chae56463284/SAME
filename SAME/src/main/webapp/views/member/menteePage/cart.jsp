<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.cart-container {
	width: 800px;
	margin: 0 auto;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 20px;
	margin-left: 23%;
}

.cart-summary {
	font-size: 18px;
	margin-bottom: 10px;
}

.cart-table {
	border: 1px solid #ddd;
	border-radius: 8px;
}

.cart-header, .cart-product {
	display: flex;
	align-items: center;
	padding: 10px;
}

.cart-header {
	background-color: #f5f5f5;
	font-weight: bold;
}

.cart-product {
	border-bottom: 1px solid #ddd;
}

.cart-product:last-child {
	border-bottom: none;
}

.header-item, .header-price, .header-quantity, .product-total,
	.header-check {
	text-align: center;
	flex: 5;
}

.product-total, .product-price, .product-quantity, .product-total,
	.product-actions {
	text-align: center;
	flex: 5;
}

.product-info {
	display: flex;
	align-items: center;
}

.product-info img {
	width: 80px;
	height: 80px;
	border-radius: 5px;
	margin-right: 10px;
}

.product-details {
	font-size: 14px;
}

.product-name {
	font-weight: bold;
	margin-bottom: 5px;
}

.product-quantity input {
	width: 50px;
	text-align: center;
}

.btn {
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 14px;
}

.pay-btn {
	background-color: #ff5c3d;
	color: white;
}

.delete-btn {
	background-color: #828282;
	color: white;
}

.cart-footer {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	padding: 10px 0;
	font-size: 18px;
}

.final-price {
	font-weight: bold;
	margin-right: 20px;
}

.checkout-btn {
	background-color: #ff5c3d;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
}

.cart-header, .cart-product {
	display: flex;
	align-items: center;
	padding: 10px;
}

.product-select, .header-item:first-child {
	flex: 0 0 50px; /* 고정된 너비로 설정 */
	text-align: center;
}

.product-select input[type="checkbox"] {
	margin: 0 auto; /* 체크박스를 가운데 정렬 */
}

.cart-product {
	border-bottom: 1px solid #ddd;
}

.cart-product:last-child {
	border-bottom: none;
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
			<%@ include file="/views/common/sidebarMentee.jsp"%>

			<div class="cart-container">
				<!-- 상단 정보 -->
				<div class="cart-summary">
					<span>총 ( 2 ) 개</span>
				</div>

				<!-- 테이블 -->
				<div class="cart-table">
					<!-- 헤더 -->
					<div class="cart-header">
						<div class="product-select">
							<input type="checkbox">
						</div>
						<div class="header-item">상품 정보</div>
						<div class="header-price">판매가</div>
						<div class="header-quantity">수량</div>
						<div class="product-total">결제 예정가</div>
						<div class="header-check">선택</div>
					</div>

					<!-- 상품 1 -->
					<div class="cart-product">
						<div class="product-select">
							<input type="checkbox" />
						</div>
						<div class="product-info">
							<img src="https://via.placeholder.com/80" alt="안광주 이미지" />
							<div class="product-details">
								<div class="product-name">안광주</div>
								<div class="product-info">컴퓨터 / JAVA</div>
								<div class="product-info">백엔드의 모든 것</div>
								<div>2024.12.02 - 12.16</div>
							</div>
						</div>
						<div class="product-price">7,000</div>
						<div class="product-quantity">
							<input type="number" value="5" min="1" />
						</div>
						<div class="product-total">7,000</div>
						<div class="product-actions">
							<button class="btn pay-btn">결제</button>
							<button class="btn delete-btn">삭제</button>
						</div>
					</div>

					<!-- 상품 2 -->
					<div class="cart-product">
						<div class="product-select">
							<input type="checkbox" checked />
						</div>
						<div class="product-info">
							<img src="https://via.placeholder.com/80" alt="채소연 이미지" />
							<div class="product-details">
								<div class="product-name">채소연</div>
								<div>컴퓨터 / PPT</div>
								<div>PPT 너도 할 수 있어</div>
								<div>2024.12.16</div>
							</div>
						</div>
						<div class="product-price">3,000</div>
						<div class="product-quantity">
							<input type="number" value="1" min="1" />
						</div>
						<div class="product-total">3,000</div>
						<div class="product-actions">
							<button class="btn pay-btn">결제</button>
							<button class="btn delete-btn">삭제</button>
						</div>
					</div>
				</div>

				<!-- 하단 합계 -->
				<div class="cart-footer">
					<div class="final-price">
						최종 금액: <span>3,000</span>원
					</div>
					<button class="btn checkout-btn">결제하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>