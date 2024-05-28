<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-05-10
  Time: 오전 3:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mono</title>
    <!-- script -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- font -->
    <link rel="stylesheet" href="https://webfontworld.github.io/NexonLv1Gothic/NexonLv1Gothic.css" />
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/5270e3d1c1.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="${path}/css/reset.css" />
    <link rel="stylesheet" href="${path}/css/myPage.css" />
</head>
<body>
<header>
    <img src="${path}/img/header_bg6.jpg" alt="" />
</header>
<%@include file="nav.jsp"%>
<main>
    <div class="mypage_wrap">
        <h1>마이페이지</h1>
        <div class="cont_wrap">
            <div class="cont_box">
                <a href="<c:url value="/login/myPage_check"/>">
                    <i class="fas fa-user-cog"></i>
                    <h3>내 정보 관리</h3>
                    <p>회원 정보 수정 / 탈퇴</p>
                </a>
            </div>
            <div class="cont_box">
                <a href="<c:url value="/login/myBoard"/>">
                    <i class="fas fa-file-alt"></i>
                    <h3>게시글 확인</h3>
                    <p>작성한 게시글 확인</p>
                </a>
            </div>
        </div>
    </div>
</main>
<%@include file="footer.jsp"%>
</body>
</html>

