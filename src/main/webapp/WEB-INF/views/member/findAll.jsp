<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원 목록</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<div class="container">
    <br />
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <br />
    <h2>회원 목록</h2>
    <br />
    <table class="table table-striped">
        <tr>
            <th>회원 번호</th>
            <th>아이디</th>
            <th>이름</th>
            <th>이메일</th>
            <th>전화번호</th>
            <th>삭제</th>
        </tr>
        <c:forEach var="Member" items="${memberList}">
            <tr>
                <td>${Member.m_id}</td>
                <td><a href="/member/detailAdmin?m_id=${Member.m_id}">${Member.memberId}</a></td>
                <td>${Member.memberName}</td>
                <td>${Member.memberEmail}</td>
                <td>${Member.memberMobile}</td>
                <td><a href="/member/deleteAdmin?m_id=${Member.m_id}">회원 삭제</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
