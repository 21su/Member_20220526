<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 1:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${loginDTO.memberName}님의 마이페이지</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
        let buch = false;
        let buch2 = false;
        const sujong = () =>{
            const pw = document.getElementById("pw");
            const pwb = document.getElementById("pwb");
            if(buch){
                buch = false;
                pw.innerHTML = "";
                pwb.innerHTML = "";
            }else{
                let result = '비밀번호 확인: &nbsp; <br />&nbsp;';
                let result2 = '<input type="password" id="password" placeholder="비밀번호 확인"><br /><button onclick="pwcheck()">비밀번호 확인</button>';
                buch = true;
                pw.innerHTML = result;
                pwb.innerHTML = result2;
            }
        }
        const deleteId = () =>{
            const pw2 = document.getElementById("pw2");
            const pwb2 = document.getElementById("pwb2");
            if(buch){
                buch2 = false;
                pw2.innerHTML = "";
                pwb2.innerHTML = "";
            }else{
                let result = '비밀번호 확인: &nbsp; <br />&nbsp;';
                let result2 = '<input type="password" id="password" placeholder="비밀번호 확인"><br /><button onclick="pwcheck2()">비밀번호 확인</button>';
                buch2 = true;
                pw2.innerHTML = result;
                pwb2.innerHTML = result2;
            }
        }
        const pwcheck = () =>{
            const password = document.getElementById("password").value;
            if(password == '${loginDTO.memberPassword}'){
                location.href="/member/update?m_id=${loginDTO.m_id}";
            }else{
                const pw = document.getElementById("pw");
                pw.innerHTML = '비밀번호 확인: ' + '<p style="font-size: 7px; color: red;">비밀번호가 일치하지 않습니다.</p>'
                alert("비밀번호가 일치하지 않습니다!!");
            }
        }
        const pwcheck2 = () =>{
            const password = document.getElementById("password").value;
            if(password == '${loginDTO.memberPassword}'){
                location.href="/member/deleteId?m_id=${loginDTO.m_id}";
            }else{
                const pw2 = document.getElementById("pw2");
                pw2.innerHTML = '비밀번호 확인: ' + '<p style="font-size: 7px; color: red;">비밀번호가 일치하지 않습니다.</p>'
                alert("비밀번호가 일치하지 않습니다!!");
            }
        }
    </script>

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
        <tr>
            <td>
                <button onclick="sujong()">회원 정보 수정</button>
            </td>
        </tr>
        <tr>
            <td>
                <p id="pw"></p>
            </td>
            <td>
                <p id="pwb"></p>
            </td>
        </tr>
        <tr>
            <td>
                <button onclick="deleteId()">회원 탈퇴</button>
            </td>
        </tr>
        <tr>
            <td>
                <p id="pw2"></p>
            </td>
            <td>
                <p id="pwb2"></p>
            </td>
        </tr>
    </table>
</div>
</body>
</html>