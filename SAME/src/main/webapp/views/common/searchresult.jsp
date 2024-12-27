<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
</head>
<body>
    <h1>검색 결과</h1>
    <c:if test="${not empty filteredPosts}">
        <ul>
            <c:forEach var="post" items="${filteredPosts}">
                <li>
                    <h3><a href="<%=contextPath%>/board/view?boardNo=${post.boardNo}">${post.boardTitle}</a></h3>
                    <p>${post.boardContent}</p>
                    <p><small>${post.createDate}</small></p>
                </li>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${empty filteredPosts}">
        <p>검색 결과가 없습니다.</p>
    </c:if>
</body>
</html>