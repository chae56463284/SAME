<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String contextPath = request.getContextPath();

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
            background-color: #f8f8f8;
            font-family: Arial, sans-serif;
        }

        .calendar-container {
            border: 1px solid #ff5c3d;
            border-radius: 4px;
            width: 917px;
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
            background-color: #ff5c3d;
            color: white;
            padding: 5px;
        }

        .date-cell {
            width: 100px;
            height: 80px;
            text-align: center;
            padding: 5px;
            border-radius: 4px;
            cursor: pointer;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
        }

        .time-list {
            margin-top: 5px;
            font-size: 12px;
            color: #333;
        }

        .date-cell:hover {
            background-color: #f5f5f5;
        }

        /* 팝업 스타일 */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            width: 300px;
            text-align: center;
        }

        .popup h3 {
            margin-bottom: 15px;
        }

        .time-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
        }

        .time-button {
            width: 90px;
            height: 60px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: white;
            text-align: center;
            font-size: 14px;
            line-height: 60px;
            cursor: pointer;
        }

        .time-button.disabled {
            background-color: #e0e0e0;
            color: #a0a0a0;
            cursor: not-allowed;
        }

        .time-button.selected {
            background-color: #ff5c3d;
            color: white;
        }

        #confirm-button, #close-popup {
            margin-top: 20px;
            padding: 10px;
            background-color: #ff5c3d;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100px;
            margin-right: 5px;
        }

        #close-popup {
            background-color: #ccc;
        }

        .popup-background {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
    </style>
</head>
<body>
    <form action="<%=contextPath%>/member/mentorPage/schedule" method="post" name="schedule">
	    <div id="popup-background" class="popup-background"></div>
    <div id="calendar-container" class="calendar-container">
        <div id="calendar-header" class="calendar-header">
            <button id="prev-month" class="nav-button">◀</button>
            <span id="month-title" class="month-title"></span>
            <button id="next-month" class="nav-button">▶</button>
        </div>
        <div class="calendar-grid">
            <div class="day-name">일</div>
            <div class="day-name">월</div>
            <div class="day-name">화</div>
            <div class="day-name">수</div>
            <div class="day-name">목</div>
            <div class="day-name">금</div>
            <div class="day-name">토</div>
        </div>
    </div>

    <!-- 팝업 -->
    <div id="popup" class="popup">
        <h3>시간 선택</h3>
        <div class="time-grid">
            <button class="time-button" data-time="09:00">09:00</button>
            <button class="time-button disabled" data-time="10:00">10:00</button>
            <button class="time-button" data-time="11:00">11:00</button>
            <button class="time-button" data-time="12:00">12:00</button>
            <button class="time-button" data-time="13:00">13:00</button>
            <button class="time-button" data-time="14:00">14:00</button>
            <button class="time-button" data-time="15:00">15:00</button>
            <button class="time-button disabled" data-time="16:00">16:00</button>
            <button class="time-button" data-time="17:00">17:00</button>
        </div>
        <div>
            <button id="confirm-button">선택</button>
            <button id="close-popup">닫기</button>
        </div>
    </div>
    </form>

    <script>
        let currentDate = new Date(); 
        document.addEventListener("DOMContentLoaded", () => {
            renderCalendar(currentDate);
        });
    
        const calendarGrid = document.querySelector(".calendar-grid");
        const monthTitle = document.getElementById("month-title");
        const prevMonthButton = document.getElementById("prev-month");
        const nextMonthButton = document.getElementById("next-month");
        const popup = document.getElementById("popup");
        const popupBackground = document.getElementById("popup-background");
        const confirmButton = document.getElementById("confirm-button");
        const closePopupButton = document.getElementById("close-popup");
        const timeButtons = document.querySelectorAll(".time-button");
        let selectedDayCell = null;
    
        // 날짜별 선택된 시간 저장
        const selectedTimes = {};
    
        function renderCalendar(date) {
            const year = date.getFullYear();
            const month = date.getMonth();
            const firstDayOfMonth = new Date(year, month, 1).getDay();
            const lastDateOfMonth = new Date(year, month + 1, 0).getDate();
    
            monthTitle.textContent = `${year}년 ${month + 1}월`;
            calendarGrid.querySelectorAll(".date-cell").forEach(cell => cell.remove());
    
            for (let i = 0; i < firstDayOfMonth; i++) {
                const emptyCell = document.createElement("div");
                calendarGrid.appendChild(emptyCell);
            }
    
            for (let day = 1; day <= lastDateOfMonth; day++) {
                const dateCell = document.createElement("div");
                dateCell.className = "date-cell";
                dateCell.innerHTML = `<div>${day}</div><div class="time-list"></div>`;
    
                // 날짜 클릭 시 팝업 표시 및 선택 상태 복원
                dateCell.addEventListener("click", () => {
                    selectedDayCell = dateCell;
    
                    // 기존 선택된 시간을 복원
                    const dayKey = `${currentDate.getFullYear()}-${currentDate.getMonth()}-${day}`;
                    timeButtons.forEach(button => {
                        const time = button.getAttribute("data-time");
                        if (selectedTimes[dayKey]?.includes(time)) {
                            button.classList.add("selected");
                        } else {
                            button.classList.remove("selected");
                        }
                    });
    
                    popup.style.display = "block";
                    popupBackground.style.display = "block";
                });
    
                calendarGrid.appendChild(dateCell);
            }
        }
    
        prevMonthButton.addEventListener("click", () => {
            currentDate.setMonth(currentDate.getMonth() - 1);
            renderCalendar(currentDate);
        });
    
        nextMonthButton.addEventListener("click", () => {
            currentDate.setMonth(currentDate.getMonth() + 1);
            renderCalendar(currentDate);
        });
    
        timeButtons.forEach(button => {
            if (!button.classList.contains("disabled")) {
                button.addEventListener("click", () => {
                    const time = button.getAttribute("data-time");
    
                    if (button.classList.contains("selected")) {
                        button.classList.remove("selected");
                    } else {
                        button.classList.add("selected");
                    }
                });
            }
        });
    
        confirmButton.addEventListener("click", () => {
            if (selectedDayCell) {
                const timeList = selectedDayCell.querySelector(".time-list");
                const dayKey = `${currentDate.getFullYear()}-${currentDate.getMonth()}-${selectedDayCell.textContent.trim()}`;
                const selected = Array.from(document.querySelectorAll(".time-button.selected")).map(button => button.getAttribute("data-time"));
    
                // 저장된 시간 업데이트
                selectedTimes[dayKey] = selected;
    
                // time-list 업데이트
                timeList.innerHTML = ""; // 기존 시간 초기화
                selected.forEach(time => {
                    const timeItem = document.createElement("span");
                    timeItem.textContent = time;
                    timeItem.style.marginRight = "5px";
                    timeList.appendChild(timeItem);
                });
    
                // time-list 표시 여부
                timeList.style.display = selected.length > 0 ? "block" : "none";
    
                alert("선택되었습니다.");
            }
    
            popup.style.display = "none";
            popupBackground.style.display = "none";
        });
    
        closePopupButton.addEventListener("click", () => {
            popup.style.display = "none";
            popupBackground.style.display = "none";
        });
    </script>
</body>
</html>