<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>로그인</title>
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
        const loginCheck = () => {
            const memberPassword = document.getElementById("memberPassword").value;
            const memberId = document.getElementById("memberId").value;
            $.ajax({
                type: "post",
                url:"/member/loginCheck",
                data:{
                    "memberPassword": memberPassword,
                    "memberId": memberId
                },
                dataType: "json",
                success: function (result){
                    const check = document.getElementById("check");
                    if(result){
                        loginForm.submit();
                    }else{
                        check.innerHTML = "아이디 또는 비밀번호가 틀렸습니다.";
                    }
                }
            });
        }
    </script>
</head>
<body>
<div class="container">
    <br />
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <br />
    <h2>로그인</h2>
    <form name="loginForm" method="post" action="/member/login">
    <table class="table">
        <tr>
            <td>ID: </td>
            <td>
                <input type="text" name="memberId" id="memberId" placeholder="UserId">
            </td>
        </tr>
        <tr>
            <td>PassWord: </td>
            <td>
                <input type="password" id="memberPassword" name="memberPassword" placeholder="UserPassword">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" onclick="loginCheck()" value="로그인">
            </td>
            <td>
                <a id="check" style="color: red; font-size:7px "></a>
            </td>
        </tr>
    </table>
    </form>
</div>
</body>
</html>
