<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String contextPath = request.getContextPath();

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh; /* 화면 전체 높이에 맞추기 */
      margin: 0; /* 기본 마진 제거 */
      background-color: #f8f8f8; /* 배경색 추가 */
      font-family: 'Arial', sans-serif; /* 기본 폰트 설정 */
    }

.calendar-container {
  position: absolute; 
  border: 1px solid #ff5c3d;
  border-radius: 4px;
  width: 800px;
  margin: auto;
  font-family: 'Inter', sans-serif;
}

.calendar-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #ff5c3d;
  color: white;
  padding: 10px 20px;
}

.nav-button {
  background: none;
  border: none;
  color: white;
  font-size: 18px;
  cursor: pointer;
}

.calendar-grid {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  gap: 5px;
  padding: 10px;
}

.day-name {
  text-align: center;
  font-weight: bold;
  color: #17a1fa;
}

.date-cell {
  text-align: center;
  padding: 5px;
  border-radius: 4px;
}

.date-cell:hover {
  background-color: #f5f5f5;
}

.event {
  font-size: 11px;
  color: white;
  padding: 2px 5px;
  border-radius: 3px;
  margin-top: 5px;
  background-color: #337af7;
}
    </style>
</head>
<body>
    <div id="calendar-container" class="calendar-container">
        <div id="calendar-header" class="calendar-header">
          <button id="prev-month" class="nav-button">◀</button>
          <span id="month-title" class="month-title"></span>
          <button id="next-month" class="nav-button">▶</button>
        </div>
        <div class="calendar-grid">
          <!-- 요일 -->
          <div class="day-name">일</div>
          <div class="day-name">월</div>
          <div class="day-name">화</div>
          <div class="day-name">수</div>
          <div class="day-name">목</div>
          <div class="day-name">금</div>
          <div class="day-name">토</div>
          <!-- 날짜가 여기에 JavaScript로 추가됩니다 -->
           <script>
          const calendarGrid = document.querySelector(".calendar-grid");
          const monthTitle = document.getElementById("month-title");
          const prevMonthButton = document.getElementById("prev-month");
          const nextMonthButton = document.getElementById("next-month");
          
          let currentDate = new Date();
          
          function renderCalendar(date) {
            // 현재 월과 년도
            const year = date.getFullYear();
            const month = date.getMonth();
          
            // 1일이 시작되는 요일과 월의 마지막 날짜 계산
            const firstDayOfMonth = new Date(year, month, 1).getDay();
            const lastDateOfMonth = new Date(year, month + 1, 0).getDate();
          
            // 월 제목 업데이트
            monthTitle.textContent = `${year}년 ${month + 1}월`;
          
            // 기존 날짜 삭제
            calendarGrid.querySelectorAll(".date-cell").forEach((cell) => cell.remove());
          
            // 빈칸 추가
            for (let i = 0; i < firstDayOfMonth; i++) {
              const emptyCell = document.createElement("div");
              emptyCell.className = "empty-cell";
              calendarGrid.appendChild(emptyCell);
            }
          
            // 날짜 추가
            for (let day = 1; day <= lastDateOfMonth; day++) {
              const dateCell = document.createElement("div");
              dateCell.className = "date-cell";
              dateCell.textContent = day;
              calendarGrid.appendChild(dateCell);
            }
          }
          
          // 이전 월로 이동
          prevMonthButton.addEventListener("click", () => {
            currentDate.setMonth(currentDate.getMonth() - 1);
            renderCalendar(currentDate);
          });
          
          // 다음 월로 이동
          nextMonthButton.addEventListener("click", () => {
            currentDate.setMonth(currentDate.getMonth() + 1);
            renderCalendar(currentDate);
          });
          
          // 초기 렌더링
          renderCalendar(currentDate);
        </script>
        </div>
      </div>
</body>
</html>