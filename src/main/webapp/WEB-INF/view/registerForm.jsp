<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-05-09
  Time: 오전 2:20
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
  <link rel="stylesheet" href="${path}/css/registerForm.css">

</head>
<body>

<header>
  <img src="${path}/img/header_bg6.jpg" alt="" />
</header>
<%@include file="nav.jsp"%>
<main>
  <div class="loginForm_wrap">
    <div class="loginForm_container">
      <h3>신규 회원가입</h3>
      <div class="agree_wrap">
        <h4>이용약관</h4>
        <div class="agree_box">
          <div class="agree_content">
            <h5>제1조(목적)</h5>
            <p>
              이 약관은 MONO건축사사무소 회사(전자상거래 사업자)가 운영하는 MONO건축사사무소 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다. ※「PC통신, 무선 등을 이용하는
              전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
            </p>
          </div>
          <div class="agree_content">
            <h5>제2조(정의)</h5>
            <p>
              ① “몰”이란 MONO건축사사무소 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다. <br />
              <br />
              ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다. <br />
              <br />
              ③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다. <br />
              <br />
              ④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
            </p>
          </div>
          <div class="agree_content">
            <h5>제3조 (약관 등의 명시와 설명 및 개정)</h5>
            <p>
              ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에
              게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다. <br />
              <br />
              ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다. <br />
              <br />
              ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는
              범위에서 이 약관을 개정할 수 있습니다. <br />
              <br />
              ④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정 전
              내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. <br />
              <br />
              ⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에
              “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. <br />
              <br />
              ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다. <br />
            </p>
          </div>
        </div>
        <div class="agree_checkBox">
          <input type="checkbox" id="agree_check1" />
          <label for="agree_check1">위 이용약관에 동의합니다.</label>
        </div>
      </div>
      <div class="agree_wrap">
        <h4>개인정보처리방침</h4>
        <div class="agree_box">
          <div class="agree_content">
            <h5>수집하는 개인정보의 항목</h5>
            <p>
              회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다. <br />
              - 수집항목 : 아이디, 패스워드, 성명, e-mail, 휴대전화, 생년월일 <br />
              - 개인정보 수집방법 : 홈페이지(회원가입)
            </p>
          </div>
          <div class="agree_content">
            <h5>개인정보의 수집 및 이용목적</h5>
            <p>
              회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. <br /><br />
              (1) 홈페이지 회원 가입 및 관리 <br />
              회원 가입 의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정 이용 방지, 만 14세 미만 아동의 개인정보 처리시 법정대리인의 동의 여부 확인, 각종 고지․통지, 고충 처리 등의 목적 <br /><br />
              (2) 재화 또는 서비스 제공 <br />
              물품 배송, 서비스 제공, 계약서․청구서 발송, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증, 연령인증, 요금 결제 및 정산, 채권추심 등의 목적 <br /><br />
              (3) 고충 처리 <br />
              민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리 결과 통보 등 <br /><br />
            </p>
          </div>
          <div class="agree_content">
            <h5>개인정보 보유 및 이용기간</h5>
            <p><strong>회원탈퇴 시까지</strong> (단, 관계 법령에 보존 근거가 있는 경우 해당 기간 시까지 보유, 개인정보처리방침에서 확인 가능)</p>
          </div>
        </div>
        <div class="agree_checkBox">
          <input type="checkbox" id="agree_check2" />
          <label for="agree_check2">위 개인정보처리방침에 동의합니다.</label>
        </div>
      </div>
      <form action="<c:url value="/login/join"></c:url>" method="post" onsubmit="return fCheck(this)">
        <div class="infoList_container">
          <h4>개인정보입력</h4>
          <div class="infoList_box">
            <table>
              <tr>
                <th><span class="required"></span>이름</th>
                <td><input type="text" name="name" class="widht200" /></td>
              </tr>
              <tr>
                <th><span class="required"></span>아이디</th>
                <td>
                  <input type="text" name="id" id="id" class="widht200" maxlength="12"/>
<%--                  <input type="button" name="id_check" value="중복확인" id="id_checkBtn" />--%>
                  <span id="id_msg"></span>
                </td>
              </tr>
              <tr>
                <th><span class="required"></span>비밀번호</th>
                <td>
                  <input type="password" name="pw" id="pw" class="widht200" maxlength="12"/>
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
                  <input type="tel" id="phone" name="phone" class="widht200" maxlength="11" />
                  <span id="ph_msg"></span>
                </td>
              </tr>
              <tr>
                <th><span class="required"></span>email</th>
                <td class="email">
                  <input type="email" id="email" name="email" class="widht200" />
                  <button type="button" id="emailSendBtn" class="emailBtn">인증메일 발송</button>
                  <div id="emailCheckBox" class="hidden">
                    <input type="email_check" id="email_check" name="email_check" class="widht200" />
                    <button type="button" id="emailCheckBtn" class="emailBtn">인증메일 확인</button>
                  </div>
                  <span id="em_msg"></span>
                </td>
              </tr>
            </table>
          </div>
        </div>
        <div class="loginForm_button">
          <button id="submitBtn" disabled>회원가입</button>
        </div>
      </form>
    </div>
  </div>
</main>
<%@include file="footer.jsp"%>
<script>
  let msg = "${msg}";
  if(msg=="JOIN_ERR") alert("회원가입 처리 중 에러가 발생했습니다. 다시 시도해주세요.");

  let code; // 이메일 인증 번호

  const validationStatus = {
    id: false,
    pw: false,
    pw_check: false,
    phone: false,
    email: false
  };

  // id 유효성 검사
   $(document).ready(function(){
     let debounceTimer;

     $('#id').on('input', function (){
      let id = $(this).val();

      if(!/^[A-Za-z0-9]{4,12}$/.test(id)){
        $('#id_msg').text("아이디는 4~12자 영문자 또는 숫자여야 합니다.")
        validationStatus.id = false;
      } else{
        $("#id_msg").text("");
        clearTimeout(debounceTimer);
        debounceTimer =  setTimeout(function (){
          checkId(id);
        }, 300);
      }
    });

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

       if (!/^\d+$/.test(phone)) {
         $('#ph_msg').text("숫자만 입력해주세요.")
         validationStatus.phone = false;
       } else{
         $("#ph_msg").text("");
         validationStatus.phone = true;
       }
     })

     $("#emailSendBtn").click(function (){
        let email = $("#email").val();

        if(email.trim().length == 0){
          $("#em_msg").text("이메일을 입력해주세요.")
        }
        else if(!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)){
          $("#em_msg").text("유효한 이메일을 입력해주세요.")
          return;
        }
        else{
          $("#em_msg").text("");
          $("#email").attr('readonly', true);
          $("#emailSendBtn").addClass("hidden");
          $('#emailCheckBox').removeClass('hidden').addClass('inline');
        }

        $.ajax({
          type: "POST",
          dataType: "JSON",
          data:{email:email},
          url:"${path}/login/mailCheck",
          success: function (data){
            code = data;
            alert("인증 코드가 입력하신 이메일로 전송되었습니다.");
          }
        })

     })

     $("#emailCheckBtn").click(function (){
       let inputCode = $("#email_check").val();

       if(inputCode == code){
         alert("인증이 완료되었습니다.")
         validationStatus.email = true;
       } else{
         alert("인증번호가 일치하지 않습니다.")
       }
     })

     function checkId(id){
       $.ajax({
         url: '${path}/login/idCheck',
         type: 'POST',
         data: {id: id},
         success: function (cnt) {
           if(cnt != 1){
             $('#id_msg').text("사용 가능한 아이디입니다.");
             validationStatus.id = true;
           } else {
             $('#id_msg').text("이미 사용중인 아이디입니다.");
           }
         },
         error: function(){
           $('#id_msg').text("아이디 중복 검사에 실패했습니다. 다시 시도해주세요.");
         }
       });
     }
  })

  // msg
  function fCheck(f) {
    const inputs = f.querySelectorAll("input[type=text], input[type=password], input[type=tel], input[type=email]");

    for (let i = 0; i < inputs.length; i++) {
      let input = inputs[i]
      let parentTr = input.closest("tr")
      let label = parentTr.querySelector("th")
      let requiredSpan = label.querySelector(".required")

      if (input.value.trim().length == 0) {
        if (!requiredSpan.textContent.includes("* ")) {
          requiredSpan.textContent += "* "
        }
        return false
      } else {
        requiredSpan.textContent = requiredSpan.textContent.replace("* ", "")
      }
    }
    // 유효성 검사 결과 확인
    if (!validationStatus.id || !validationStatus.pw || !validationStatus.pw_check || !validationStatus.phone || !validationStatus.email) {
      if(!validationStatus.email) alert("이메일 인증을 완료해주세요.");
      return false;
    }
    return true
  }


  // button
  $(document).ready(function () {
    $('input[type="checkbox"]').change(function () {
      var allCecked = $("#agree_check1").is(":checked") && $("#agree_check2").is(":checked")

      $("#submitBtn").prop("disabled", !allCecked)
    })
  })
</script>
</body>
</html>

