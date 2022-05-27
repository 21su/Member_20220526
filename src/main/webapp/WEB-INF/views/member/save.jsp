<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 1:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
        let checkMemId = false;
        let checkPassword = false;
        let checkMobile = false;
        const check = () =>{
            const memberID = document.getElementById("memberId").value;
            $.ajax({
                type: "post",
                url: "/member/memberIdCheck",
                data: {"memberId": memberID},
                dataType: "json",
                success: function (result){
                    const idcheck = document.getElementById("idcheck");
                    if(memberID == ""){
                        alert("아이디를 입력해주세요")
                    }
                    else if(result){
                           idcheck.innerHTML = "아이디 사용 가능합니다."
                        idcheck.style.color="green";
                        checkMemId = result;
                    }else{
                        idcheck.innerHTML = "중복 아이디입니다."
                        idcheck.style.color="red";
                    }
                },
                error: function (){
                    alert("오류")
                }
            })
        }
        const pwCheck = () =>{
            const memberPassword = document.getElementById("memberPassword").value;
            const exp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
            const pc = document.getElementById("pc");
            if(memberPassword == ""){
                pc.innerHTML = "비밀번호를 입력해주세요.";
                pc.style.color = "red";
                checkPassword = false;
            }else if(memberPassword.match(exp)){
                pc.innerHTML = "사용가능한 비밀번호입니다.";
                pc.style.color = "green";
                checkPassword = true;
            }else{
                pc.innerHTML = "8 ~ 16자 영문, 숫자를 조합해서 만들어주세요.";
                pc.style.color = "red";
                checkPassword = false;
            }
        }
        const mobileCheck = () =>{
            const memberMobile = document.getElementById("memberMoblie").value;
            const exp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
            const mc = document.getElementById("mc");
            if(memberMobile == ""){
                mc.innerHTML = "전화번호를 입력해주세요.";
                mc.style.color = "red";
                checkMobile = false;
            }else if(memberMobile.match(exp)){
                mc.innerHTML = "완벽합니다.";
                mc.style.color = "green";
                checkMobile = true;
            }else{
                mc.innerHTML = "000-00000-0000";
                mc.style.color = "red";
                checkMobile = false;
            }
        }
        const saveF = () =>{
            const name = document.getElementById("name").value;
            const email = document.getElementById("email").value;
            if(checkMemId){
                if(checkPassword){
                    if(name != ''){
                        if(email != ''){
                            if(checkMobile){
                                saveForm.submit();
                            }else{
                                $('#memberMoblie').focus();
                                alert("전화번호를 확인해주세요.")
                            }
                        }else{
                            $('#email').focus();
                            alert("이메일을 입력해주세요.")
                        }
                    }
                    else{
                        $('#name').focus();
                        alert("이름을 입력해 주세요.")
                    }
                }
                else {
                    $('#memberPassword').focus();
                    alert("비밀번호를 확인해주세요.")
                }
            }else{
                $('#memberId').focus();
                alert("아이디 중복 체크를 해주세요.")
            }
        }
    </script>
    <style>
        .mg{
            color: red;
            font-size: 7px;
        }
    </style>
</head>
<body>

<div class="container">
    <br />
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <br />
    <h2>회원 가입</h2>
    <form action="/member/save" name="saveForm" class="row g-3" method="post" enctype="multipart/form-data">
        <table class="table">
            <tr>
                <td>ID: </td>
                <td>
                    <input type="text" id="memberId" name="memberId" class="form-control" placeholder="UserId" required><br />
                    <input type="button" onclick="check()" value="아이디 중복 체크"><p id="idcheck" class="mg"></p>
                </td>
            </tr>
            <tr>
                <td>Password: </td>
                <td>
                    <input type="password" id="memberPassword" onblur="pwCheck()" name="memberPassword" class="form-control" placeholder="Password" required><br />
                    <p id="pc" class="mg"></p>
                </td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" id="name" name="memberName" class="form-control" placeholder="UserName" required></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" id="email" name="memberEmail" class="form-control" placeholder="UserEmail" required></td>
            </tr>
            <tr>
                <td>PhoneNum: </td>
                <td>
                    <input type="text" id="memberMoblie" onblur="mobileCheck()" name="memberMobile" class="form-control" placeholder="PhoneNum" required><br />
                    <p id="mc" class="mg"></p>
                </td>
            </tr>
            <tr>
                <td>프로필 사진 등록</td><br />
                <td><input type="file" name="memberProfile" class="form-control"></td>
            </tr>
            <tr>
                <td><input type="button" onclick="saveF()" value="회원가입"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
