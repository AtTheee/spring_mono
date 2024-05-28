<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-05-21
  Time: 오후 10:07
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
  <link rel="stylesheet" href="${path}/css/findUser.css" />
</head>
<body>
<header>
  <img src="${path}/img/header_bg6.jpg" alt="" />
</header>
<%@include file="nav.jsp"%>
<main>
  <form action="">
    <div class="find_wrap">
      <div class="find_container">
        <h3>${mode=="pw" ? "비밀번호" : "아이디"} 찾기</h3>
        <div class="find_inputBox">
          <table>
            <tr>
              <th>이름</th>
              <td><input type="text" id="name" /></td>
            </tr>
            <c:if test="${mode eq 'pw'}">
              <tr>
                <th>아이디</th>
                <td><input type="text" id="id" /></td>
              </tr>
            </c:if>
            <tr>
              <th>이메일</th>
              <td><input type="email" id="email" /></td>
            </tr>
          </table>
          <span id="check_msg"></span>
        </div>
        <div class="find_btnBox">
          <c:if test="${mode eq 'pw'}">
            <button type="button" id="find_pwBtn" class="btn">확인</button>
          </c:if>
          <c:if test="${mode ne 'pw'}">
            <button type="button" id="find_idBtn" class="btn">확인</button>
          </c:if>
          <button type="button" id="cancleBtn" class="sub_btn">취소</button>
        </div>
      </div>
    </div>
  </form>
</main>
<%@include file="footer.jsp"%>
<script>
  $(document).ready(function (){

    $("#find_idBtn").click(function () {
      const name = $("#name").val();
      const email = $("#email").val();

      if (name.trim().length == 0) {
        $("#check_msg").text("이름을 입력해주세요.")
        return
      } else if (email.trim().length == 0) {
        $("#check_msg").text("이메일을 입력해주세요.")
        return;
      } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        $("#check_msg").text("유효한 이메일을 입력해주세요.")
        return;
      } else{
        $("#check_msg").text("")
      }

      $.ajax({
        type:"POST",
        url:"${path}/login/find_id",
        data: {name:name, email:email},
        success:function (id){
          console.log(id)
          if(id != ''){
            alert("회원님의 아이디는 " + id + "입니다.");
            window.location.pathname = '${path}/login/login';
          } else{
            alert("일치하는 회원 정보가 없습니다.")
          }
        }
      })

    })

    $("#find_pwBtn").click(function () {
      const name = $("#name").val();
      const email = $("#email").val();
      const id = $("#id").val();

      if (name.trim().length == 0) {
        $("#check_msg").text("이름을 입력해주세요.")
        return
      } else if (id.trim().length == 0){
        $("#check_msg").text("아이디를 입력해주세요.")
        return;
      } else if (email.trim().length == 0) {
        $("#check_msg").text("이메일을 입력해주세요.")
        return;
      } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        $("#check_msg").text("유효한 이메일을 입력해주세요.")
        return;
      } else{
        $("#check_msg").text("")
      }

      $.ajax({
        type:"POST",
        url: "${path}/login/find_pw",
        data: {name:name, id:id, email:email},
        success:function (response){
          if(response.status == "null"){
            alert("일치하는 회원 정보가 없습니다.");
          }
          if(response.status == "success"){
            alert("임시 비밀번호가 이메일로 발송되었습니다.");
            window.location.pathname = '${path}/login/login';
          }
        },
        error: function (){
          alert("서버 오류가 발생했습니다. 다시 시도해주세요.")
        }
      })

    })

    $("#cancleBtn").click(function (){
      history.back();
    })

  })
</script>
</body>
</html>

