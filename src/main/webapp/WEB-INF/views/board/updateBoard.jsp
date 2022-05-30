<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오후 1:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수정</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <br />
        <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
        <br />
        <h2>수정</h2>
        <form enctype="/board/updateBoard?page=${page}" method="post">
            <table class="table">
                <tr>
                    <td>제목: </td>
                    <td><input type="text" name="boardTitle" value="${boardDTO.boardTitle}"></td>
                </tr>
                <tr>
                    <td>작성자: </td>
                    <td><input type="text" name="boardWriter" value="${boardDTO.boardWriter}" readonly></td>
                </tr>
                <tr>
                    <td>${boardDTO.boardHits}</td>
                    <td><fmt:formatDate value="${boardDTO.boardCreatedDate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate> </td>
                </tr>
                <tr>
                    <td colspan="2"><textarea name="boardContents" rows="40" cols="80">${boardDTO.boardContents}</textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="수정">
                        <input type="button" value="취소" onclick="location.href='/board/detail?b_id=${boardDTO.b_id}&page=${page}'">
                    </td>
                </tr>
            </table>
            <input type="hidden" value="${boardDTO.b_id}">
        </form>
    </div>
</body>
</html>
