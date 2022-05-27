<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 3:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자용 페이지</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <br />
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <br />
    <h1>관리자용 페이지</h1>
    <br />
    <br />
    <a href="/member/findAll">회원 정보</a>
</div>
</body>
</html>
