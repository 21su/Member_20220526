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
    <button onclick="">글쓰기</button>
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
                <td>${board.boardTitle}</td>
                <td>${board.writer}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.boardCreatedDate}"></fmt:formatDate></td>
                <td>${board.boardHits}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
