<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${boardTitle}</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script>
        window.onload = function (){
            if(${boardDTO.boardFileName != null} && ${boardDTO.boardFileName.length() != 14}){
                const image = document.getElementById("img");
                image.innerHTML = image.innerHTML + "<br /> <img src='${pageContext.request.contextPath}/upload/${boardDTO.boardFileName}'" +
                    "alt='' height='100' width='100'>"+"<br />";
            }
        }
        const updateBoard = () =>{

        }
        const deleteBoard = () =>{

        }
    </script>
</head>
<body>
<div class="container">
    <br />
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <br />
    <h1>${boardDTO.boardTitle}</h1>
    ${boardDTO.boardWriter}<br/>
    ${boardDTO.boardHits}
    <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${boardDTO.boardCreatedDate}"></fmt:formatDate><br />
    <p></p>
    <p  id="img" style="font-size: 20px; width: 200px ;height: 300px">${boardDTO.boardContents}</p><br />
    <button onclick="location.href = '/'">메인</button>&nbsp;
    <button onclick="location.href = '/board/main?page=${page}'">페이지로</button>
    <br />
    <c:if test="${boardDTO.m_id eq sessionScope.loginId}">
        <button onclick="updateBoard()">수정</button>&nbsp;
    </c:if>
    <c:if test="${boardDTO.m_id eq sessionScope.loginId or sessionScope.loginMemberId eq 'admin'}">
        <button onclick="deleteBoard()">삭제</button>
    </c:if>
</div>
</body>
</html>
