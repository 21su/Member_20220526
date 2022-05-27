<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 2:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div class="container">
    <br />
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <br />
    <h2>회원 가입</h2>
    <form action="/member/update" class="row g-3" method="post" enctype="multipart/form-data">
        <input type="hidden" name="m_id" value="${loginDTO.m_id}">
        <input type="hidden" name="memberProfileName" value="${loginDTO.memberProfileName}">
        <table class="table">
            <tr>
                <td>ID: </td>
                <td>
                    <input type="text" name="memberId" class="form-control" value="${loginDTO.memberId}" readonly><br />
                </td>
            </tr>
            <tr>
                <td>Password: </td>
                <td>
                    <input type="password" name="memberPassword" class="form-control" value="${loginDTO.memberPassword}" readonly><br />
                </td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="memberName" class="form-control" value="${loginDTO.memberName}" readonly></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" id="email" name="memberEmail" class="form-control" value="${loginDTO.memberEmail}" required></td>
            </tr>
            <tr>
                <td>PhoneNum: </td>
                <td>
                    <input type="text" id="memberMoblie" name="memberMobile" class="form-control" value="${loginDTO.memberMobile}" required><br />
                </td>
            </tr>
            <tr>
                <td>프로필 사진 변경</td><br />
                <td><input type="file" name="memberProfile" class="form-control"></td>
            </tr>
            <tr>
                <td><input type="submit" value="회원정보 수정"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
