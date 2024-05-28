
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginId" value="${empty sessionScope.id ? '' : sessionScope.id}"/>
<c:set var="loginOutLink" value="${empty loginId ? '/login/login' : '/login/myPage'}"/>
<%--<c:set var="loginOut" value="${empty loginId ? 'Login' : 'ID='+=loginId}"/>--%>

<nav id="nav">
  <div id="nav__container">
    <div id="nav__logo">
      <a href="${path}"><img src="${path}/img/logo_img.png" alt="" /></a>
    </div>
    <div id="nav__menu">
      <ul>
        <li><a href="<c:url value="/about"/>">ABOUT US</a></li>
        <li><a href="<c:url value="/gallery/list?pageSize=9"/>">PROJECT</a></li>
        <li><a href="<c:url value="/contact/list"/>">CONTACT</a></li>
<%--        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>--%>
        <li class="${not empty loginId ? 'logged_in' : ''}">

          <a href="<c:url value='${loginOutLink}'/>">
              <c:choose>
                  <%-- 로그인 상태일 때--%>
                  <c:when test="${not empty loginId}">
                      <i class="fa fa-user"></i>
                  </c:when>
                  <%-- 로그아웃 상태일 때  --%>
                  <c:otherwise>
                      Login
                  </c:otherwise>
              </c:choose>
          </a>
          <div class="sub_menu ${not empty loginId ? 'show' : ''}">
            <ul>
              <li><a href="<c:url value="/login/myPage"/>">MyPage</a></li>
              <li><a href="<c:url value="/login/logout"/>">Logout</a></li>
            </ul>
          </div>
        </li>
      </ul>
    </div>
    <a href="#" class="nav__toggleBtn"><i class="fa-solid fa-bars fa-2xl"></i></a>
  </div>
</nav>
<script>
$(window).ready(function (){
  $(window).scroll(function () {
    var scroll = $(window).scrollTop()

    if (scroll > 100) {
      $("#nav").addClass("nav__scrolled")
    } else {
      $("#nav").removeClass("nav__scrolled")
    }
  })

  $(".nav__toggleBtn").click(function (e) {
    e.preventDefault()
    $("#nav__menu").toggleClass("show")
    $("#nav .nav__toggleBtn").toggleClass("on")
    $(this).find("i").toggleClass("fa-bars fa-xmark")
  })
})
</script>

