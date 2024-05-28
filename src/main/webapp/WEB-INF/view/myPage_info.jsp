<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-05-10
  Time: 오전 4:13
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
  <link rel="stylesheet" href="${path}/css/myPage_info.css" />
</head>
<body>
<header>
  <img src="${path}/img/header_bg6.jpg" alt="" />
</header>
<%@include file="nav.jsp"%>
<main>
  <div class="info_wrap">
    <form action="<c:url value="/login/myPage_modify"/>" id="modifyForm" method="post" onsubmit="return fCheck(this)">
      <h2>내 정보</h2>
      <div class="infoList_box">
        <table>
          <tr>
            <th><span class="required"></span>이름</th>
            <td><input type="text" name="name" id="name" class="widht200 disable" value="<c:out value= '${user.name}'/>" readonly /></td>
          </tr>
          <tr>
            <th><span class="required"></span>아이디</th>
            <td>
              <input type="text" name="id" id="id" class="widht200 w70" value="<c:out value="${user.id}"/>" readonly />
            </td>
          </tr>
          <tr>
            <th><span class="required"></span>비밀번호</th>
            <td>
                <input type="password" name="pw" id="pw" class="widht200" />
                <span id="pw_msg"></span>
            </td>
          </tr>
          <tr>
            <th><span class="required"></span>비밀번호 확인</th>
            <td>
              <input type="password" name="pw_check" id="pw_check" class="widht200" />
              <span id="pw_check_msg"></span>
            </td>
          </tr>
          <tr>
            <th><span class="required"></span>휴대폰 번호</th>
            <td class="phone">
              <input type="tel" id="phone" name="phone" class="widht200" maxlength="11" value="<c:out value="${user.phone}"/>"/>
              <span id="ph_msg"></span>
            </td>
          </tr>
          <tr>
            <th><span class="required"></span>email</th>
            <td class="email">
              <input type="email" id="email" name="email" class="widht200" value="<c:out value="${user.email}"/>" readonly/>
              <span id="em_msg"></span>
            </td>
          </tr>
        </table>
      </div>
      <div class="mypage_btnBox">
        <button type="submit" id="submitBtn">내 정보 변경</button>
        <a href="<c:url value="/login/myPage"/>" class="backBtn">취소</a>
      </div>
      <div class="mypage_btnBox btnBox2"><span>회원 탈퇴를 하시겠습니까? </span> <button id="removeBtn"> 회원 탈퇴</button></div>
    </form>
  </div>
</main>
<%@include file="footer.jsp"%>
<script>
  let msg = "${msg}";
  if(msg=="userModify_ERR") alert("개인정보 수정 중 에러가 발생했습니다. 다시 시도해주세요.");

  const validationStatus = {
    pw: false,
    pw_check: false,
    phone: true
  };

  $(document).ready(function (){
    // 회원 탈퇴
    $('#removeBtn').click(function (e){
        e.preventDefault();
        e.stopPropagation(); // 이벤트 상위 전달 방지

        if(confirm("정말 회원탈퇴를 하시겠습니까?")){
          $.post('${path}/login/remove', function (response){
            if(response.status == 'success'){
              alert('회원 탈퇴가 완료되었습니다.');
              window.location.pathname = '${path}/login/logout';
            } else{
              alert("탈퇴 처리 중 문제가 발생했습니다. 다시 시도해주세요");
              window.location.reload();
            }
          }).fail(function (){
              alert("서버에서 예기치 못한 오류가 발생했습니다. 다시 시도해주세요");
          })
        }
    })

    // 내 정보 수정
    $("#modifyForm").on('submit', function (e){
      e.preventDefault();

      if (!fCheck(this)) {
        alert("입력값을 확인해주세요.");
        return;
      }

      const formDate = $(this).serialize(); // 직렬화 -> URL 인코딩

      $.ajax({
        url:'${path}/login/myPage_modify',
        type: 'POST',
        data: formDate,
        success: function (response){
          if(response.status == 'success'){
            alert("수정이 완료되었습니다.");
            window.location.pathname = '${path}/login/myPage_check';
          } else{
            alert("수정에 실패했습니다. 다시 시도해주세요.");
            window.location.reload();
          }
        },
        error: function (){
          alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
        }
      })
    })

    // pw 유효성 검사
    $('#pw').on('input', function (){
      let pw = $(this).val();

      if(!/^[A-Za-z0-9]{4,12}$/.test(pw)){
        $('#pw_msg').text("비밀번호는 4~12자 영문자 또는 숫자여야 합니다.")
        validationStatus.pw = false;
      } else{
        $("#pw_msg").text("");
        validationStatus.pw = true;
      }
    })

    $("#pw_check").on('input', function (){
      let pw_check = $(this).val();
      let pw = $('#pw').val();

      if(pw_check !== pw){
        $('#pw_check_msg').text("비밀번호가 일치하지 않습니다.")
        validationStatus.pw_check = false;
      } else {
        $("#pw_check_msg").text("");
        validationStatus.pw_check = true;
      }
    })

    $("#phone").on('input', function (){
      let phone = $(this).val();

      if (!/^[0-9]+$/.test(phone)) {
        $('#ph_msg').text("숫자만 입력해주세요.")
        validationStatus.phone = false;
      } else{
        $("#ph_msg").text("");
        validationStatus.phone = true;
      }
    })
  })

  function fCheck(f){
    const inputs = f.querySelectorAll("input[type=password], input[type=tel]");

    for (let i = 0; i < inputs.length; i++) {
      let input = inputs[i]
      let parentTr = input.closest("tr")
      let label = parentTr.querySelector("th")
      let requiredSpan = label.querySelector(".required")

      if (input.value.length == 0) {
        if (!requiredSpan.textContent.includes("* ")) {
          requiredSpan.textContent += "* "
        }
        return false
      } else {
        requiredSpan.textContent = requiredSpan.textContent.replace("* ", "")
      }
    }
    // 유효성 검사 결과 확인
    if (!validationStatus.pw || !validationStatus.pw_check || !validationStatus.phone) {
      return false;
    }
    return true
  }
</script>
</body>
</html>

