<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시글</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<div class="container">
    <br />
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <br />
    <h2>게시글</h2>
    <br />
</div>
<div class="container">
</div>
<div class="container">
    <table class="table">
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성시간</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="board" items="${boardList}">
            <tr>
                <td>${board.b_id}</td>
                <td><a href="/board/detail?b_id=${board.b_id}&page=${paging.page}">${board.boardTitle}</a></td>
                <td>${board.boardWriter}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.boardCreatedDate}"></fmt:formatDate></td>
                <td>${board.boardHits}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="container">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${paging.page <= 1}">
                <li class="page-item disabled">
                    <a class="page-link">[이전]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a href="/board/main?page=${paging.page-1}" class="page-link">[이전]</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/main?page=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${paging.page >= paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">[다음]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/main?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
<div class="container">
    <button onclick="location.href='/board/save'">글쓰기</button>&nbsp;
    <button onclick="location.href='/'">메뉴</button>
</div>
<br />
<div class="container">
    <form method="get" action="/board/search">
        <select name="type">
            <option value="boardWriter">글쓴이</option>
            <option value="boardTitle">제목</option>
        </select>
        <input type="text" name="search" placeholder="검색어 입력">
        <input type="submit" value="검색">
    </form>
</div>
</body>
</html>
