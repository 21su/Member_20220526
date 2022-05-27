<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 4:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원정보</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <h2>${loginDTO.memberName}님의 마이페이지</h2>
    <br />
    <c:choose>
        <c:when test="${loginDTO.memberProfileName.length() != 14}">
            <img src='${pageContext.request.contextPath}/upload/${loginDTO.memberProfileName}' alt='' height='60' width='60'>&nbsp;&nbsp;
        </c:when>
        <c:otherwise>
            <img src='${pageContext.request.contextPath}/upload/기본프로필.jpg' alt="기본이미지" height='60' width='60'>&nbsp;&nbsp;
        </c:otherwise>
    </c:choose>
    <table>
        <tr>
            <td>Id: </td>
            <td>
                ${loginDTO.memberId}
            </td>
        </tr>
        <tr>
            <td>이름: </td>
            <td>
                ${loginDTO.memberName}
            </td>
        </tr>
        <tr>
            <td>이메일: </td>
            <td>
                ${loginDTO.memberEmail}
            </td>
        </tr>
        <tr>
            <td>전화 번호</td>
            <td>
                ${loginDTO.memberMobile}
            </td>
        </tr>
    </table>
    <button onclick="location.href='/member/findAll'">뒤로가기</button>
</div>
</body>
</html>
