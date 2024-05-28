<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-05-09
  Time: 오후 4:06
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

    <link rel="stylesheet" href="${path}/css/reset.css" />
    <link rel="stylesheet" href="${path}/css/register_s.css" />
</head>
<body>
<header>
    <img src="${path}/img/header_bg6.jpg" alt="" />
</header>
<%@include file="nav.jsp"%>
<main>
    <div class="wrap">
        <div class="info_textBox">
            <h2>MONO 회원가입을 환영합니다.</h2>
            <p><strong>${name}</strong>님의 회원가입이 완료되었습니다. <br />지금부터 아래의 회원ID로 MONO 서비스를 이용하실 수 있습니다.</p>
            <input type="text" value="${id}" disabled />
        </div>
        <div class="info_btBox">
            <a href="<c:url value="/login/login"/>" class="bt">로그인 하기</a>
            <a href="${path}" class="bt white">홈으로 가기</a>
        </div>
    </div>
</main>
<%@include file="footer.jsp"%>
</body>
</html>

