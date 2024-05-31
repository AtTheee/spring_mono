<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-05-11
  Time: 오전 5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <link rel="stylesheet" href="${path}/css/contactList.css" />
</head>
<body>
<header>
    <img src="${path}/img/header_bg6.jpg" alt="" />
</header>
<%@include file="nav.jsp"%>
<main>
    <div class="contact_wrap">
        <div class="contact_text_container">
            <div class="contact_subtitle subtitle">
                <span class="circle"></span>
                <span class="circle"></span>
                <span class="circle"></span>
                <span>${mode eq 'myBoard' ? "My Board" : "Contact"}</span>
            </div>
            <div class="contact_title reveal reveal_TTB">
                <h2><br />${mode eq 'myBoard' ? "내 게시물" : "문의하기"}</h2>
            </div>
        </div>
        <div class="contact_top_container">
            <div class="search_result_text_container hidden">
                <p></p>
            </div>
            <div class="contact_writeBtn">
                <button onclick="location.href='<c:url value="/contact/write"/>'">문의하기</button>
            </div>
        </div>
        <div class="contact_list_container">
            <table>
                <tr>
                    <th class="no_td">번호</th>
                    <th class="title_td">제목</th>
                    <th class="name_td">이름</th>
                    <th class="date_td">등록일</th>
                </tr>
                <c:forEach var="contactDto" items="${list}">
                    <tr>
                        <td>${contactDto.bno}</td>
                        <td class="title_td">
                            <a href="<c:url value="/contact/read${ph.sc.queryString}&bno=${contactDto.bno}"/>">${contactDto.title}
                                <c:if test="${contactDto.comment_cnt != 0}">(${contactDto.comment_cnt})</c:if>
                            </a>
                        </td>
                        <td>${contactDto.writer}</td>
                        <td>
                            <c:choose>
                                <c:when test="${contactDto.reg_date.time >= startOfToday}">
                                    <fmt:formatDate value="${contactDto.reg_date}" pattern="HH:mm" type="time"/>
                                </c:when>
                                <c:otherwise>
                                    <fmt:formatDate value="${contactDto.reg_date}" pattern="yyyy-MM-dd" type="date"/>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="paging_container">
            <c:if test="${ph.totalCnt != null && ph.totalCnt != 0}">
                <c:if test="${ph.showPrev}">
                    <a class="page" href="<c:url value="${mode eq 'myBoard' ? '/login/myBoard' : '/contact/list'}${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                </c:if>
                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                    <a class="page ${i==ph.sc.page ? "paging_active" : ""}" href="<c:url value="${mode eq 'myBoard' ? '/login/myBoard' : '/contact/list'}${ph.sc.getQueryString(i)}"/>">${i}</a>
                </c:forEach>
                <c:if test="${ph.showNext}">
                    <a class="page" href="<c:url value="${mode eq 'myBoard' ? '/login/myBoard' : '/contact/list'}${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                </c:if>
            </c:if>
            <%--            <a href="" class="page paging_active">1</a>--%>
            <%--            <a href="" class="page">2</a>--%>
        </div>
        <div class="search_container">
            <form action="">
                <select class="search_option" name="option">
                    <option value="A" ${ph.sc.option == 'A' || ph.sc.option == '' ? "selected" : ""}>제목+내용</option>
                    <option value="T" ${ph.sc.option == 'T' ? "selected" : ""}>제목만</option>
                    <option value="W" ${ph.sc.option == 'W' ? "selected" : ""}>작성자</option>
                </select>

                <input type="text" name="keyword" id="keyword" class="search_input" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요" />
                <input type="submit" class="search_button" value="검색" onclick="location.href='<c:url value="/contact/list"/>'"/>
            </form>
        </div>
    </div>
</main>
<%@include file="footer.jsp"%>

<script>
    let msg = "${msg}";
    if(msg=="WRT_OK") alert("건축문의 등록이 성공적으로 완료되었습니다.");

    if(msg=="AUTH_ERR") alert("본인글만 열람 가능합니다.");
    if(msg=="AUTH_NULL") alert("로그인이 필요한 서비스입니다.");

    if(msg=="MODIFY_OK") alert("게시물의 수정이 완료되었습니다.");

    if(msg=="DELETE_OK") alert("게시물이 성공적으로 삭제되었습니다.");
    if(msg=="DELETE_ERR") alert("게시물 삭제에 실패했습니다. 다시 시도해주세요.");

</script>
</body>
</html>

