<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 1:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>메인 화면</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script>
        const saveForm = () =>{
          location.href="/member/save";
        };
        const loginForm = () =>{
            location.href="/member/login";
        }
        const main = () =>{
            location.href="/board/main";
        }
        const detail = () =>{
            location.href="/member/detail";
        }
        const admin = () =>{
            location.href="/member/admin";
        }
    </script>
</head>
<body>
<div class="container">
    <br />
    <jsp:include page="./layout/header.jsp" flush="false"></jsp:include>
    <br />
    <h2>메인 화면</h2>
    <br />
    <c:choose>
        <c:when test="${sessionScope.loginMemberId == null}">
            <button onclick="saveForm()">회원 가입</button><br />
            <button onclick="loginForm()">로그인</button><br />
        </c:when>
        <c:otherwise>
            <button onclick="detail()">마이페이지</button><br /><br />
            <button onclick="main()">게시글</button><br /><br />
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${sessionScope.loginMemberId == 'admin'}">
            <button onclick="admin()">관리자 페이지</button>
        </c:when>
    </c:choose>
</div>
</body>
</html>
