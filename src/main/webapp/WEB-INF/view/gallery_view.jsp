<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-05-18
  Time: 오후 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="gno" value="${galleryDto.gno}" />
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
  <link rel="stylesheet" href="${path}/css/gallery_view.css" />

  <!-- swiper -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</head>
<body>
<header>
  <img src="${path}/img/header_bg6.jpg" alt="" />
</header>
<%@include file="nav.jsp"%>
<main>
  <div class="project_detail_wrap">
    <div class="project_detail_title_container">
      <h2>${galleryDto.title}</h2>
      <span>${galleryDto.sub_title}</span>
      <div class="line"></div>
    </div>
    <div class="swiper mySwiper2">
      <div class="swiper-wrapper">
        <c:forEach var="img" items="${imgList}">
          <div class="swiper-slide">
            <img src="<c:url value="${rootPath}/${img.save_folder}/${img.save_name}"/>" alt=""/>
          </div>
        </c:forEach>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>
    <div thumbsSlider="" class="swiper mySwiper">
      <div class="swiper-wrapper">
        <c:forEach var="img" items="${imgList}">
          <div class="swiper-slide">
            <img src="<c:url value="${rootPath}/${img.save_folder}/${img.save_name}"/>" alt=""/>
          </div>
        </c:forEach>
      </div>
    </div>
    <div class="project_detail_text_container">
      <div class="project_detail_text">
        <h4>Project Detail</h4>
        <div class="detail_textBox detailBox">${galleryDto.explanation}</div>
      </div>
      <div class="project_detail_info">
        <h4>Project Info</h4>
        <div class="detail_infoBox detailBox">
          <table>
            <tr>
              <th>Location</th>
              <td>${galleryDto.location}</td>
            </tr>
            <tr>
              <th>Type</th>
              <td>${galleryDto.type}</td>
            </tr>
            <tr>
              <th>Area</th>
              <td>${galleryDto.area}</td>
            </tr>
            <tr>
              <th>Year</th>
              <td>${galleryDto.year}</td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <div class="btn_container gallery_view_btn">
      <c:if test="${role == 'MANAGER'}">
        <button type="button" class="btn" id="modifyBtn">수정하기</button>
        <button type="button" class="sub_btn" id="deleteBtn">삭제</button>
      </c:if>
      <button type="button" class="sub_btn" id="listBtn">목록</button>
    </div>
  </div>
</main>
<%@include file="footer.jsp"%>
<script>
  const gno = '${gno}'

  let msg = "${msg}";
  if(msg=="MODIFY_OK") alert("프로젝트 수정이 완료되었습니다.");
  if(msg=="MODIFY_ERR") alert("프로젝트 수정에 실패하였습니다. 다시 시도해주세요.");

  $(document).ready(function () {

    const swiper = new Swiper(".mySwiper", {
      loop: false,
      spaceBetween: 10,
      centeredSlides: true,
      slidesPerView: 4,
      freeMode: true,
      slideToClickedSlide: true,
    });
    const swiper2 = new Swiper(".mySwiper2", {
      loop: true,
      centeredSlides: true,
      spaceBetween: 0,
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      thumbs: {
        swiper: swiper,
      },
    });

    $("#listBtn").click(function (){
      location.href = "<c:url value="/gallery/list${searchCondition.queryString}"/>"
    })

    $("#modifyBtn").click(function (){
      location.href = "<c:url value="/gallery/modify${searchCondition.queryString}&gno="/>" + gno
    })

    $("#deleteBtn").click(function (){
      if(!confirm("프로젝트를 삭제하시겠습니까?")) return;

      // 동적으로 form 생성해서 Post 요청 보내야 함
      const form = $('<form>', {
        'method': 'POST',
        'action': '<c:url value="/gallery/delete${searchCondition.queryString}"/>'
      });

      // 지울 게시글의 gno도 보내줘야함
      const gnoInput = $('<input>', {
        'type': 'hidden',
        'name': 'gno',
        'value': gno
      });

      form.append(gnoInput);

      form.appendTo('body').submit();
    })

  })
</script>
</body>
</html>

