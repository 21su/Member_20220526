<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
    <header>
        &nbsp;&nbsp;
        <c:choose>
            <c:when test="${sessionScope.loginMemberId != null}">
                <c:choose>
                    <c:when test="${sessionScope.loginMemberProfileName.length() != 14}">
                        <img src='${pageContext.request.contextPath}/upload/${sessionScope.loginMemberProfileName}' alt='' height='30' width='30'>&nbsp;&nbsp;
                    </c:when>
                    <c:otherwise>
                        <img src='${pageContext.request.contextPath}/upload/기본프로필.jpg' alt="기본이미지" height='30' width='30'>&nbsp;&nbsp;
                    </c:otherwise>
                </c:choose>
                <span>${sessionScope.loginMemberName}님 환영합니다.</span>&nbsp;&nbsp;
                <a href="/member/logout">로그아웃</a>&nbsp;&nbsp;
                <a href="/member/detail">마이 페이지</a>&nbsp;&nbsp;
            </c:when>
            <c:otherwise>
                <a href="/member/login">로그인</a>&nbsp;&nbsp;
                <a href="/member/save">회원 가입</a>&nbsp;&nbsp;
            </c:otherwise>
        </c:choose>
        <a href="/member/main">게시글</a>&nbsp;&nbsp;
        <a href="/">메인</a>&nbsp;&nbsp;
    </header>
</body>
</html>
