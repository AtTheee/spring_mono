<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-05-16
  Time: 오후 5:38
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/5270e3d1c1.js" crossorigin="anonymous"></script>
    <!-- font -->
    <link rel="stylesheet" href="https://webfontworld.github.io/NexonLv1Gothic/NexonLv1Gothic.css" />

    <link rel="stylesheet" href="${path}/css/reset.css" />
    <link rel="stylesheet" href="${path}/css/gallery.css" />
</head>
<body>
<header>
    <img src="${path}/img/header_bg6.jpg" alt="" />
</header>

<%@include file="nav.jsp"%>

<main>
    <div class="project_list_wrap">
        <div class="project_text_container">
            <div class="project_subtitle subtitle">
                <span class="circle"></span>
                <span class="circle"></span>
                <span class="circle"></span>
                <span>Project</span>
            </div>
        </div>
        <div class="project_write_button">
            <c:if test="${role == 'MANAGER'}">
                <a href="${path}/gallery/write">글쓰기</a>
            </c:if>
        </div>
        <div class="project_nav">
            <ul>
                <li><a href="<c:url value="/gallery/list"/>" class="${ph.sc.type == '' ? 'nav_active' : ''}">All</a></li>
                <li><a href="<c:url value="/gallery/list?type=office"/>" class="${ph.sc.type == 'office' ? 'nav_active' : ''}">Office</a></li>
                <li><a href="<c:url value="/gallery/list?type=education"/>" class="${ph.sc.type == 'education' ? 'nav_active' : ''}">Education</a></li>
                <li><a href="<c:url value="/gallery/list?type=healthecare_culture"/>" class="${ph.sc.type == 'healthecare_culture' ? 'nav_active' : ''}">Healthecare / Culture</a></li>
                <li><a href="<c:url value="/gallery/list?type=housing_residentials"/>" class="${ph.sc.type == 'housing_residentials' ? 'nav_active' : ''}">Housing / Residentials</a></li>
                <li><a href="<c:url value="/gallery/list?type=industiral_btltk"/>" class="${ph.sc.type == 'industiral_btltk' ? 'nav_active' : ''}">Industiral / BTLTK</a></li>
            </ul>
        </div>
        <div class="project_list_container">
            <ul>
                <c:forEach var="galleryDto" items="${list}" varStatus="status">
                    <li>
                        <a href="<c:url value="/gallery/read${ph.sc.queryString}&gno=${galleryDto.gno}"/>">
                            <img src="<c:url value="${rootPath}/${galleryDto.save_folder}/${galleryDto.save_name}"/>" alt=""/>
                            <div class="imgHover">${titleList[status.index]}</div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="paging_container">
            <c:if test="${ph.totalCnt != null && ph.totalCnt != 0}">
                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                    <a class="page ${i==ph.sc.page ? "paging_active" : ""}" href="<c:url value="/gallery/list${ph.sc.getQueryString(i)}"/>">${i}</a>
                </c:forEach>
            </c:if>
        </div>
    </div>
</main>
<%@include file="footer.jsp"%>
<script>
    let msg = "${msg}";
    if(msg=="WRT_OK") alert("프로젝트 등록이 완료되었습니다.");

    if(msg=="DELETE_OK") alert("프로젝트 삭제가 완료되었습니다.");
    if(msg=="DELETE_ERR") alert("프로젝트 삭제에 실패하였습니다. 다시 시도해주세요.");

    // // project_nav
    // $(".project_nav ul li a").click(function (e) {
    //     e.preventDefault()
    //     $(".project_nav ul li a").removeClass("nav_active")
    //     $(this).addClass("nav_active")
    // })
</script>
</body>
</html>

