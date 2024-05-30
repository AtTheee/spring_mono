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
    <link rel="stylesheet" href="${path}/css/about.css" />
</head>
<body>
<header>
    <img src="${path}/img/header_bg6.jpg" alt="" />
</header>
<%@include file="nav.jsp"%>
<main>
    <div class="wrap">
        <section id="section_greetings">
            <div class="greetings_wrap">
                <div class="greetings_img_container">
                    <img src="${path}/img/about_greeting.jpg" alt="" />
                </div>
                <div class="greetings_text_wrap">
                    <div class="greetings_text_container">
                        <div class="greetings_subtitle subtitle">
                            <span class="circle"></span>
                            <span class="circle"></span>
                            <span class="circle"></span>
                            <span>Corporate Greetings</span>
                        </div>
                        <div class="greetings_title1 title1 reveal">
                            <span>더 나은 내일을 위한 지속 가능한 건축의 선구자.</span>
                        </div>
                        <div class="greetings_title2 reveal reveal_LTR">
                            <span>진실성, 창의성, 건축의 탁월함을 바탕으로 미래를 건설하는 MONO</span>
                            <br />
                            <br />
                            <span
                            >각 프로젝트의 독특한 요구사항과 잠재력을 이해하고, <br />
                    지속 가능하고 기능적인 공간을 창조하기 위해 최선을 다하고 있습니다.</span
                            >
                            <br />
                            <br />
                            <span
                            >모노는 각 공간이 인간의 삶에 미치는 영향을 깊이 고민하며, <br />
                    단순한 건축을 넘어서 삶의 질을 향상시키는 환경을 설계합니다.
                  </span>
                            <br />
                            <br />
                            <span>저희와 함께 더 나은 미래를 설계해 나가보세요.</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="exeutive_detailView_wrap">
            <div class="detailView_container">
                <button>
                    <i class="fas fa-times"></i>
                </button>
                <div class="detailViewBox">
                    <div class="detail_imgBox">
                        <img id="detailImage" src="" alt="" />
                    </div>
                    <div class="detail_textBox">
                        <h4 id="detailName">이름</h4>
                        <ul>
                            <li id="detailTitle">대표이사</li>
                            <li id="detailEmail"></li>
                        </ul>
                        <h4>경력</h4>
                        <p id="detailExperience"></p>
                        <h4>학력</h4>
                        <p id="detailEducation"></p>
                        <h4>자격증</h4>
                        <p id="detailCertificates"></p>
                    </div>
                </div>
            </div>
        </div>
        <section id="section_exeutive">
            <div class="exeutive_wrap">
                <div class="exeutive_text_container">
                    <div class="exeutive_subtitle subtitle">
                        <span class="circle"></span>
                        <span class="circle"></span>
                        <span class="circle"></span>
                        <span>Corporate Exeutive</span>
                    </div>
                    <div class="exeutive_title1 title1 reveal reveal_TTB">
                        <span><br />MONO의 임직원들을 소개합니다.</span>
                    </div>
                </div>
                <div class="exeutive_img_container">
                    <ul>
                        <li>
                            <a href="#" onclick="showDetail(0)">
                                <img src="${path}/img/people1.jpg" alt="" />
                            </a>
                            <span>Alan Woker</span>
                            <div class="hover_icons">
                                <a href=""> <i class="fa fa-instagram"></i></a>
                                <a href=""> <i class="fa fa-facebook-square"></i></a>
                                <a href=""> <i class="fab fa-twitter"></i></a>
                            </div>
                        </li>
                        <li>
                            <a href="#" onclick="showDetail(1)">
                                <img src="${path}/img/people2.jpg" alt="" />
                            </a>
                            <span>Alan Woker</span>
                            <div class="hover_icons">
                                <a href=""> <i class="fa fa-instagram"></i></a>
                                <a href=""> <i class="fa fa-facebook-square"></i></a>
                                <a href=""> <i class="fab fa-twitter"></i></a>
                            </div>
                        </li>
                        <li>
                            <a href="#" onclick="showDetail(2)">
                                <img src="${path}/img/people3.jpg" alt="" />
                            </a>
                            <span>Alan Woker</span>
                            <div class="hover_icons">
                                <a href=""> <i class="fa fa-instagram"></i></a>
                                <a href=""> <i class="fa fa-facebook-square"></i></a>
                                <a href=""> <i class="fab fa-twitter"></i></a>
                            </div>
                        </li>
                        <li>
                            <a href="#" onclick="showDetail(3)">
                                <img src="${path}/img/people4.jpg" alt="" />
                            </a>
                            <span>Alan Woker</span>
                            <div class="hover_icons">
                                <a href=""> <i class="fa fa-instagram"></i></a>
                                <a href=""> <i class="fa fa-facebook-square"></i></a>
                                <a href=""> <i class="fab fa-twitter"></i></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <section id="section_history">
            <div class="history_wrap">
                <div class="history_text_container">
                    <div class="history_subtitle subtitle">
                        <span class="circle"></span>
                        <span class="circle"></span>
                        <span class="circle"></span>
                        <span>History</span>
                    </div>
                    <div class="history_title1 title1 reveal reveal_TTB">
                        <span><br />MONO 건축사사무소의 발자취</span>
                    </div>
                </div>
                <div class="history_cont_container">
                    <div class="history_cont1">
                        <div class="history_img_container">
                            <img src="${path}/img/history_img.jpg" alt="" />
                        </div>
                    </div>
                    <div class="history_cont2">
                        <ul>
                            <li>
                                <div class="history_box">
                                    <div class="history_num active">2023</div>
                                    <div class="history_text">
                                        <span>해외건설업-건설엔지니어링업 등록</span>
                                        <span>종합감리업 등록-전력시설물</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="history_box">
                                    <div class="history_num">2022</div>
                                    <div class="history_text">
                                        <span>엔지니어링업-정보통신 등록</span>
                                        <span>설계업(전문설계업 1종) 등록-전력시설물</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="history_box">
                                    <div class="history_num">2019</div>
                                    <div class="history_text">
                                        <span>건설기술용역업-설계, 사업관리(일반) 등록</span>
                                        <span>기업부설연구소 설립</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="history_box">
                                    <div class="history_num">2017</div>
                                    <div class="history_text">
                                        <span>땡땡시 떙땡구 땡떙아파트 시공</span>
                                        <span>어디어디 시공</span>
                                        <span>설계업(전문설계업 1종) 등록-전력시설물</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="history_box">
                                    <div class="history_num">2016</div>
                                    <div class="history_text">
                                        <span>땡땡시 떙땡구 땡떙아파트 시공</span>
                                        <span>어디어디 시공</span>
                                        <span>설계업(전문설계업 1종) 등록-전력시설물</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="history_box">
                                    <div class="history_num">2022</div>
                                    <div class="history_text">
                                        <span>땡땡시 떙땡구 땡떙아파트 시공</span>
                                        <span>어디어디 시공</span>
                                        <span>설계업(전문설계업 1종) 등록-전력시설물</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="history_box">
                                    <div class="history_num">2022</div>
                                    <div class="history_text">
                                        <span>땡땡시 떙땡구 땡떙아파트 시공</span>
                                        <span>어디어디 시공</span>
                                        <span>설계업(전문설계업 1종) 등록-전력시설물</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="history_box">
                                    <div class="history_num">2022</div>
                                    <div class="history_text">
                                        <span>땡땡시 떙땡구 땡떙아파트 시공</span>
                                        <span>어디어디 시공</span>
                                        <span>설계업(전문설계업 1종) 등록-전력시설물</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="history_box">
                                    <div class="history_num">2022</div>
                                    <div class="history_text">
                                        <span>땡땡시 떙땡구 땡떙아파트 시공</span>
                                        <span>어디어디 시공</span>
                                        <span>설계업(전문설계업 1종) 등록-전력시설물</span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <section id="section_directions">
            <div class="directions_wrap">
                <div class="directions_text_container">
                    <div class="directions_subtitle subtitle">
                        <span class="circle"></span>
                        <span class="circle"></span>
                        <span class="circle"></span>
                        <span>Directions</span>
                    </div>
                    <div class="history_title1 title1 reveal reveal_TTB">
                        <span><br />오시는 길</span>
                    </div>
                </div>
                <div class="directions_map_container">
                    <div id="map"></div>
                    <p>
                        <button onclick="setCenter()">
                            <i class="fas fa-sync"></i>
                        </button>
                    </p>
                </div>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a1d996872c07dc90c36476c85fafb86"></script>
                <script>
                    var container = document.getElementById("map")
                    var options = {
                        center: new kakao.maps.LatLng(33.450701, 126.570667),
                        level: 3,
                    }

                    var map = new kakao.maps.Map(container, options)

                    // 마커가 표시될 위치입니다
                    var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667)

                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        position: markerPosition,
                    })

                    // 마커가 지도 위에 표시되도록 설정합니다
                    marker.setMap(map)

                    function setCenter() {
                        // 이동할 위도 경도 위치를 생성합니다
                        var moveLatLon = new kakao.maps.LatLng(33.450701, 126.570667)

                        // 지도 중심을 이동 시킵니다
                        map.setCenter(moveLatLon)
                    }

                    // // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
                    // var iwContent = '<div style="padding:10px; font-size:13px">MONO건축사사무소 <br> 서울 모노구 모노시로 111</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                    //   iwRemoveable = true // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

                    // // 인포윈도우를 생성합니다
                    // var infowindow = new kakao.maps.InfoWindow({
                    //   content: iwContent,
                    //   removable: iwRemoveable,
                    // })

                    // // 마커에 클릭이벤트를 등록합니다
                    // kakao.maps.event.addListener(marker, "click", function () {
                    //   // 마커 위에 인포윈도우를 표시합니다
                    //   infowindow.open(map, marker)
                    // })

                    // kakao.maps.event.addListener(map, "click", function (mouseEvent) {
                    //   // 클릭한 위도, 경도 정보를 가져옵니다
                    //   var latlng = mouseEvent.latLng

                    //   // 마커 위치를 클릭한 위치로 옮깁니다
                    //   marker.setPosition(latlng)
                    // })
                </script>

                <div class="directions_info_container">
                    <div class="directions_info_title">
                        <div class="info_textBox">
                            <h4>
                                MONO <br />
                                ARCHITECTS
                            </h4>
                            <p>모노건축사사무소</p>
                        </div>
                    </div>
                    <div class="directions_infoBox">
                        <div class="directions_infoList">
                            <ul>
                                <li>
                                    <i class="fa fa-map-marker"></i>
                                    <strong>Address</strong>
                                    <span>서울 모노구 모노시로 111, 모노사무사 2층</span>
                                </li>
                                <li>
                                    <i class="fa fa-envelope"></i>
                                    <strong>E-mail</strong>
                                    <span>mono_arch@gmail.com</span>
                                </li>
                                <li>
                                    <i class="fas fa-print"></i>
                                    <strong>Fax</strong>
                                    <span>0504-000-0000</span>
                                </li>
                                <li>
                                    <i class="fa fa-phone"></i>
                                    <strong>Tel</strong>
                                    <span>000-0000-0000</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</main>
<aside>
    <div class="aside_menu">
        <ul>
            <li>Greetings</li>
            <li>Excutive</li>
            <li>History</li>
            <li>Directions</li>
        </ul>
    </div>
</aside>

<%@include file="footer.jsp"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.5/gsap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.5/ScrollTrigger.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.1/ScrollToPlugin.min.js"></script>
<script>
    //
    const path = '${path}';
    function showDetail(num){
        $.ajax({
            url: path + "/about/person/"+num,
            method: "GET",
            success: function (data){
                $("#detailImage").attr("src", path+"/img/people" + (num+1) + ".jpg");
                $("#detailName").text(data.name);
                $("#detailTitle").text(data.title);
                $('#detailEmail').text("email : " + data.email);
                $('#detailExperience').html(data.experience.replace(/\n/g, '<br>'));
                $('#detailEducation').html(data.education.replace(/\n/g, '<br>'));
                $('#detailCertificates').html(data.certificates.replace(/\n/g, '<br>'));
            },
            error: function (){
                alert("직원 정보를 불러오지 못했습니다. 다시 시도해주세요");
            }
        })
    }

    // reveal
    const hide = (item) => {
        gsap.set(item, { autoAlpha: 0 }) //     item.style.opacity = "0"
    }

    const animate = (item) => {
        let x = 0
        let y = 0
        let delay = item.dataset.delay

        if (item.classList.contains("reveal_LTR")) {
            x = -100
            y = 0
        } else if (item.classList.contains("reveal_BTT")) {
            x = 0
            y = 100
        } else if (item.classList.contains("reveal_TTB")) {
            x = 0
            y = -100
        } else {
            ;(x = 100), (y = 0)
        }
        gsap.fromTo(
            item,
            { autoAlpha: 0, x: x, y: y }, //
            { autoAlpha: 1, x: 0, y: 0, delay: delay, duration: 1.25, overwrite: "auto", ease: "expo" }
        )
    }

    gsap.utils.toArray(".reveal").forEach((item) => {
        hide(item)
        ScrollTrigger.create({
            trigger: item,
            start: "top bottom", // 이게 기본값
            // end: "bottom top",
            onEnter: () => {
                animate(item)
            },
            // markers: true,
        })
    })

    // history

    let historyImgHeight
    ScrollTrigger.matchMedia({
        "(min-width: 768px)": function () {
            historyImgHeight = document.querySelector(".history_cont2 ul li").offsetHeight * 5.5
            ScrollTrigger.create({
                trigger: ".history_img_container img",
                start: "top 20%",
                end: "=" + historyImgHeight,
                // end: "300% 60%",
                pin: true,
                // markers: true,
            })
        },
    })

    gsap.utils.toArray(".history_cont2 ul li").forEach((li) => {
        ScrollTrigger.create({
            trigger: li,
            start: "top center",
            end: "center 40%",
            // markers: true,
            // toggleClass: "active",
            // toggleClass: { className: "active", targets: li.querySelector(".history_num") },
            onEnter: () => {
                li.querySelector(".history_num").classList.add("active_on")
            },
            onLeave: () => {
                li.querySelector(".history_num").classList.remove("active_on")
            },
            onEnterBack: () => {
                li.querySelector(".history_num").classList.add("active_on")
            },
            onLeaveBack: () => {
                li.querySelector(".history_num").classList.remove("active_on")
            },
        })
    })

    // exeutive

    var exeutive = $("#section_exeutive")
    exeutive.click(function (e) {
        e.preventDefault()
    })

    $(document).ready(function () {
        // 팝업 초기 숨김 처리
        $(".exeutive_detailView_wrap").hide()

        // 사람 이미지 클릭 이벤트
        $("li a img").on("click", function () {
            $(".exeutive_detailView_wrap").fadeIn(500)
        })

        // 닫기 버튼 클릭 이벤트
        $(".detailView_container button").on("click", function () {
            $(".exeutive_detailView_wrap").fadeOut(500)
        })
    })

    // aside_menu
    var aside = $(".aside_menu > ul > li ")
    var cont = $("main .wrap > section")
    // console.log(cont)

    aside.click(function (e) {
        e.preventDefault()
        var target = $(this)
        var index = target.index()
        var section = cont.eq(index)
        var offset = section.offset().top
        // console.log(offset)
        $("html,body").animate({ scrollTop: offset }, 600, "easeInOutExpo")
    })

    $(window).scroll(function () {
        // nav
        var scroll = $(window).scrollTop()

        if (scroll > 100) {
            $("#nav").addClass("nav__scrolled")
        } else {
            $("#nav").removeClass("nav__scrolled")
        }

        //aside_menu

        if (scroll >= cont.eq(0).offset().top) {
            aside.removeClass("active")
            aside.eq(0).addClass("active")
        }
        if (scroll >= cont.eq(1).offset().top) {
            aside.removeClass("active")
            aside.eq(1).addClass("active")
        }
        if (scroll >= cont.eq(2).offset().top) {
            aside.removeClass("active")
            aside.eq(2).addClass("active")
        }
        if (scroll >= cont.eq(3).offset().top) {
            aside.removeClass("active")
            aside.eq(3).addClass("active")
        }
    })
</script>
</body>
</html>

