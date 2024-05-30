<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-05-16
  Time: 오후 5:49
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
  <link rel="stylesheet" href="${path}/css/galleryBoard.css" />
</head>
<body>
<header>
  <img src="${path}/img/header_bg6.jpg" alt="" />
</header>

<%@include file="nav.jsp"%>

<main>
<%--  action="<c:url value="/gallery/write"/>" method="post" enctype="multipart/form-data" --%>
  <form id="form" enctype="multipart/form-data">
  <div class="project_board_wrap">
    <h2>새 프로젝트 등록</h2>
      <div class="project_detail_title_container">
        <input type="hidden" name="gno" value="${galleryDto.gno}">
        <table>
          <tr>
            <th>제목</th>
            <td><input type="text" name="title" id="title" value="${galleryDto.title}"/></td>
          </tr>
          <tr>
            <th>부제목</th>
            <td><input type="text" name="sub_title" id="sub_title" value="${galleryDto.sub_title}"/></td>
          </tr>
          <tr>
            <th>이미지 업로드</th>
            <td>
              <div class="img_upload_container">
                <div class="preview_container">
                  <c:forEach var="img" items="${imgList}">
                    <div class="img_container existing">
                      <img src="<c:url value="${rootPath}/${img.save_folder}/${img.save_name}"/>" alt=""/>
                      <a class="delete_link">X</a>
                      <input type="hidden" name="existingImages" value="${img.fno}"/>
                    </div>
                  </c:forEach>
                </div>
                <div class="upload_container">
                  <label class="custom_file_upload"> <i class="fas fa-plus"></i> </label>
                  <input type="file" name="file_upload" id="file_upload" style="display: none" multiple />
                </div>
              </div>
            </td>
          </tr>
        </table>
      </div>
      <div class="project_detail_text_container">
        <div class="project_detail_text">
          <h4>Project Detail</h4>
          <div class="detail_textBox detailBox">
            <textarea name="explanation" id="explanation">${galleryDto.explanation}</textarea>
          </div>
        </div>
        <div class="project_detail_info">
          <h4>Project Info</h4>
          <div class="detail_infoBox detailBox">
            <table>
              <tr>
                <th>Location</th>
                <td><input type="text" name="location" id="location" value="${galleryDto.location}"/></td>
              </tr>
              <tr>
                <th>Type</th>
                <td>
                  <select name="type">
                    <option value="">Type</option>
                    <option value="office">Office</option>
                    <option value="education">Education</option>
                    <option value="healthecare_culture">Healthecare / Culture</option>
                    <option value="housing_residentials">Housing / Residentials</option>
                    <option value="industiral_btltk">Industiral / BTLTK</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>Area</th>
                <td><input type="text" name="area" id="area" value="${galleryDto.area}"/></td>
              </tr>
              <tr>
                <th>Year</th>
                <td><input type="text" name="year" id="year" value="${galleryDto.year}"/></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
      <div class="project_board_button">
        <c:if test="${mode eq 'modify'}">
          <button type="button" id="modify_button" class="btn">게시글 수정</button>
        </c:if>
        <c:if test="${mode ne 'modify'}">
          <button type="button" id="upload_button" class="btn">게시글 등록</button>
        </c:if>
        <button type="button" id="back_button" class="sub_btn">취소</button>
      </div>
  </div>
  </form>
</main>
<%@include file="footer.jsp"%>
<script>
  let msg = "${msg}";
  if(msg=="WRT_ERR") alert("프로젝트 등록에 실패하였습니다. 다시 시도해주세요.");

  $(document).ready(function () {
    const dataTransfer = new DataTransfer();

    // 미리보기 삭제 버튼 클릭 시 이벤트
    function deleteLinkClick(){
      const imgContainer = $(this).closest('.img_container');
      const isExisting = imgContainer.hasClass('existing'); // existing 클래스를 가지고 있으면 true

      if (isExisting) {
        // 기존 이미지의 경우
        const index = imgContainer.index('.img_container.existing');
        console.log("Existing image index: ", index);
      } else {
        // 새로 추가된 이미지의 경우
        const index = imgContainer.index('.img_container:not(.existing)');
        console.log("New image index: ", index);
        dataTransfer.items.remove(index);
        console.log(dataTransfer);
      }

      // 미리보기 제거
      imgContainer.remove();
    }

    $(document).on('click', '.delete_link', deleteLinkClick);

    // '+' 버튼에 파일 선택 기능 연결
    $(".upload_container").on("click", ".custom_file_upload", function () {
      $(this).siblings("input").click()
    })
    // 파일 선택 시 미리보기 생성
    $("#file_upload").change(function (event) {
      const files = event.target.files;

      $.each(files, function (index, file) {
        // 이미지 파일만 받아오게
        if(!file.type.startsWith('image/')){
          alert("이미지 파일만 업로드할 수 있습니다.")
          return;
        }

        const reader = new FileReader(); // 읽을때마다 새로운 readr를 할당하지 않으면 여러개 선택했을 때 한개밖에 못읽어옴
        reader.onload = function (e) {
          // 이미지를 담을 div
          const imgContainer = $("<div>").addClass("img_container");

          // 이미지 요소
          const imgHtml = $("<img>").attr("src", e.target.result)

          // 삭제 링크
          const deleteLink = $("<a>").addClass("delete_link").text("X");

          // div에 이미지와 삭제 링크
          imgContainer.append(imgHtml).append(deleteLink)

          // 미리보기 컨테이너에 div 추가
          $(".preview_container").append(imgContainer)

          dataTransfer.items.add(file);
          // console.log(dataTransfer)
        }
        reader.readAsDataURL(file) // 이미지 파일 읽기
      })
      $("#file_upload").val(''); // 파일 입력값이 동일하면 change 트리거가 발생하지 않으니 초기화해서 동일한 파일도 다시 입력 가능하게
    })

    // 게시물 등록 버튼
    $("#upload_button").click(function (e){
      const form = $("#form");
      e.preventDefault()

      if($("#title").val().trim() == '') {
        alert("제목은 필수 입력 사항입니다.")
        return false;
      }

      if($(".preview_container .img_container").length === 0) {
        alert("이미지는 하나 이상 등록해야 합니다.");
        return false;
      }

      // DOM 요소는 오리지널 js로 접근 가능
      const fileInput =$("#file_upload")[0]; // Jquery 객체를 DOM 요소로 변환
      fileInput.files = dataTransfer.files;

      // 폼을 다시 제출 (파일 리스트가 설정된 후)
      // console.log(fileInput.files)
      form.attr("action","<c:url value="/gallery/write"/>");
      form.attr("method","post");
      form.submit();
    })

    $("#modify_button").click(function (e){
      const form = $("#form");
      e.preventDefault()

      if($("#title").val().trim() == '') {
        alert("제목은 필수 입력 사항입니다.")
        return false;
      }

      if($(".preview_container .img_container").length === 0) {
        alert("이미지는 하나 이상 등록해야 합니다.");
        return false;
      }

      // DOM 요소는 오리지널 js로 접근 가능
      // const fileInput = document.getElementById('file_upload');
      const fileInput =$("#file_upload")[0]; // Jquery 객체를 DOM 요소로 변환
      fileInput.files = dataTransfer.files;

      form.attr("action","<c:url value="/gallery/modify${searchCondition.queryString}"/>");
      form.attr("method","post");
      form.submit();
    })

    $("#back_button").click(function (){
      history.back();
    })

  })

</script>
</body>
</html>
