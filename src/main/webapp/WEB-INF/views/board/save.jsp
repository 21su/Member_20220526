<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오전 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글쓰기</title>
</head>
<body>
<div class="container">
    <br />
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <br />
    <h1>글쓰기</h1>
    <form action="/board/save" method="post" enctype="multipart/form-data">
        <table class="table table-striped">
            <tr>
                <td>제목: </td>
                <td><input type="text" name="boardTitle" placeholder="제목입력" required></td>
            </tr>
            <tr>
                <td>작성자: </td>
                <td><input type="text" name="boardWriter" value="${sessionScope.loginMemberName}" readonly></td>
            </tr>
            <tr>
                <td>내용: </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2"><textarea name="boardContents" rows="40" cols="80" required></textarea></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="file" name="boardFile"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="작성"></td>
            </tr>
        </table>
        <input type="hidden" name="m_id" value="${sessionScope.loginId}">

    </form>
</div>
</body>
</html>
