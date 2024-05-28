<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-05-07
  Time: 오전 3:12
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
  <!-- fontawesome -->
  <script src="https://kit.fontawesome.com/5270e3d1c1.js" crossorigin="anonymous"></script>
  <!-- font -->
  <link rel="stylesheet" href="https://webfontworld.github.io/NexonLv1Gothic/NexonLv1Gothic.css" />

  <link rel="stylesheet" href="${path}/css/reset.css" />
  <link rel="stylesheet" href="${path}/css/loginForm_style.css" />
</head>
<body>
<header>
  <img src="${path}/img/header_bg6.jpg" alt="" />
</header>
<%@include file="nav.jsp"%>
<main>
<form action="<c:url value="/login/login"/>" method="post" onsubmit="return formCheck(this)">
  <div class="login_wrap">
    <div class="login_container">
      <h3>회원 로그인</h3>
      <div class="login_inputBox">
        <ul>
          <li>
            <!-- <label for="input_id"></label> -->
            <input type="text" name="id" id="input_id" placeholder="아이디" value="${cookie.id.value}"/>
          </li>
          <li>
            <input type="password" name="pw" id="input_pw" placeholder="비밀번호" />
          </li>
          <input type="hidden" name="toURL" value="${param.toURL}">
        </ul>
      </div>
      <div class="login_checkBox">
        <div id="msg">
<%--          <c:if test="${not empty msg}">${msg}</c:if>--%>
          <c:choose>
            <c:when test="${msg eq 'ID_ERR'}">
              존재하지 않는 아이디입니다.
            </c:when>
            <c:when test="${msg eq 'PW_ERR'}">
              아이디 또는 비밀번호가 일치하지 않습니다.
            </c:when>
          </c:choose>
        </div>
        <div class="id_saveBox">
          <input type="checkbox" name="rememberId" id="rememberId" value="on" ${empty cookie.id.value ? "" : "checked"}/>
          <label for="rememberId">아이디 저장</label>
        </div>
      </div>
      <div class="login_serviceBox">
            <span>
              <a href="<c:url value="/login/join"/>">회원가입</a>
            </span>
        <span>
              <a href="<c:url value="/login/find_id"/>">아이디 찾기</a>
            </span>
        <span>
              <a href="<c:url value="/login/find_pw"/>">비밀번호 찾기</a>
            </span>
      </div>
      <button>로그인</button>
    </div>
  </div>
</form>
</main>
<%@include file="footer.jsp"%>

<script>
  let msg = "${msg}";
  if(msg=="ERR") alert("알 수 없는 오류가 발생했습니다.");
  if(msg=="LOGIN_ERR") alert("로그인 처리 중 에러가 발생했습니다. 다시 시도해주세요.");
  
  function formCheck(frm) {
    // let msg ='';
    if (frm.id.value.length == 0) {
      setMessage("아이디를 입력해주세요.", frm.id)
      return false
    }
    if (frm.pw.value.length == 0) {
      setMessage("비밀번호를 입력해주세요.", frm.pw)
      return false
    }
    return true
  }
  function setMessage(msg, element) {
    document.getElementById("msg").innerHTML = ` ${'${msg}'}`
    if (element) {
      element.select()
    }
  }
</script>
</body>
</html>

