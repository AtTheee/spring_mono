<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-05-10
  Time: 오전 4:04
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
  <link rel="stylesheet" href="${path}/css/myPage_check.css" />
</head>
<body>
<header>
  <img src="${path}/img/header_bg6.jpg" alt="" />
</header>
<%@include file="nav.jsp"%>
<main>
  <div class="mypage_check_wrap">
    <div class="titleBox">
      <h1>회원정보를 수정하시려면 <br /><strong>비밀번호</strong>를 입력하셔야 합니다.</h1>
      <p>고객님의 개인정보보호를 위해 필요한 본인 확인 절차입니다.</p>
    </div>
    <form action="<c:url value="/login/myPage_info"/> " class="pw_check_f" method="post" onsubmit="return pw_check(this)">
      <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해 주세요." />
      <button>내 정보 변경</button>
    </form>
  </div>
</main>
<%@include file="footer.jsp"%>
<script>
  let msg = "${msg}";
  if(msg=="pwCheck_ERR") alert("비밀번호가 일치하지 않습니다.");
  if(msg=="userModify_OK") alert("수정이 완료되었습니다.");

  function pw_check(f){
    if(f.pw.value.length == 0){
        f.pw.select();
        return false;
    }
    return true;
  }

</script>
</body>
</html>

