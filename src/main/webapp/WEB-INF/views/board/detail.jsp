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
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
        window.onload = function (){
            if(${boardDTO.boardFileName != null} && ${boardDTO.boardFileName.length() != 14}){
                const image = document.getElementById("img");
                image.innerHTML = image.innerHTML + "<br /> <img src='${pageContext.request.contextPath}/upload/${boardDTO.boardFileName}'" +
                    "alt='' height='100' width='100'>"+"<br />";
            }
        }
        const updateBoard = () =>{
            location.href = "/board/updateBoard?b_id=${boardDTO.b_id}&page=${page}";
        }
        const deleteBoard = () =>{
            location.href = "/board/deleteBoard?b_id=${boardDTO.b_id}";
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
    <div class="container">
        <div id="commentList">
            <table class="table">
                <tr>
                    <th>작성자</th>
                    <th>댓글</th>
                    <th>시간</th>
                </tr>
            <c:forEach var="comment" items="${commentList}">
                <tr>
                    <td>${comment.commentWriter}</td>
                    <td>${comment.commentContents}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>
                </tr>
            </c:forEach>
            </table>
        </div>
            <div>
                <input type="text" id="commentContents">
                <button id="comment-write-btn">작성</button>
            </div>
    </div>
    <script>
        $("#comment-write-btn").click(function (){
            const contents = document.getElementById("commentContents").value;
            const commentId = document.getElementById("commentList");
            const comname = '${sessionScope.loginMemberName}';
            const combid = '${boardDTO.b_id}';
            const commid = '${sessionScope.loginId}';
            if(contents != "") {
                $.ajax({
                    type: "post",
                    url: "/comment/save",
                    data: {
                        "commentContents": contents,
                        "commentWriter": comname,
                        "b_id": combid,
                        "m_id": commid
                    },
                    dataType: "json",
                    success: function (result) {
                        let rc = "<table class='table'><tr><th>작성자</th><th>댓글</th><th>시간</th></tr>";
                        for (let i in result) {
                            rc += "<tr>"
                            rc += "<td>" + result[i].commentWriter + "</td>";
                            rc += "<td>" + result[i].commentContents + "</td>";
                            rc += "<td>" + moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";
                            rc += "<tr>"
                        }
                        rc += "</table>";
                        commentId.innerHTML = rc;
                        document.getElementById("commentContents").value = "";
                        alert("댓글을 작성했습니다.")
                    },
                    error: function () {
                        alert("왜안되");
                    }
                });
            }
        });
    </script>
</body>
</html>
