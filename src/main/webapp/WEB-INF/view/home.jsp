<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-04-24
  Time: 오후 7:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mono</title>
    <!-- script -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- swiper -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <!-- gsap -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.4/gsap.min.js"></script>
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <!-- animatie -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/5270e3d1c1.js" crossorigin="anonymous"></script>
    <!-- font -->
    <link rel="stylesheet" href="https://webfontworld.github.io/NexonLv1Gothic/NexonLv1Gothic.css" />

    <link rel="stylesheet" href="css/main_style.css" />
    <link rel="stylesheet" href="css/reset.css" />
</head>
<body>
<header id="header__wrap">
    <div class="container">
        <span class="txt1">MONO</span>
        <span class="txt2">Your Partner in Crafting Beautiful Living Spaces.</span>
        <div class="bar"></div>
    </div>
    <div class="owl-theme owl-carousel">
        <div class="item"><img src="img/header_bg5.jpg" alt="Image 1" /></div>
        <div class="item"><img src="img/header_bg4.jpg" alt="Image 2" /></div>
        <div class="item"><img src="img/header_bg3.jpg" alt="Image 3" /></div>
    </div>
</header>
<%@include file="nav.jsp"%>
<main>
    <section id="section__project">
        <div class="project__text reveal reveal_TTB">
            <h5 class="h5_title_text">Project :</h5>
            <span>From Concept to Creation: Our Project Journey</span>
            <a href="<c:url value="gallery/list?pageSize=9"/>" class="a_more_text">more ▶ </a>
        </div>
        <div class="project__img">
            <img class="item" src="img/header_bg.jpg" alt="" />
            <img class="item" src="img/header_bg3.jpg" alt="" />
            <img class="item" src="img/header_bg.jpg" alt="" />
            <img class="item" src="img/header_bg.jpg" alt="" />
            <img class="item" src="img/header_bg.jpg" alt="" />
        </div>
        <div class="swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img class="front__img" src="img/header_bg.jpg" />
                </div>
                <div class="swiper-slide">
                    <img class="front__img" src="img/header_bg3.jpg" />
                </div>
                <div class="swiper-slide">
                    <img class="front__img" src="img/header_bg.jpg" />
                </div>
                <div class="swiper-slide">
                    <img class="front__img" src="img/header_bg.jpg" />
                </div>
                <div class="swiper-slide">
                    <img class="front__img" src="img/header_bg.jpg" />
                </div>
            </div>
            <div class="swiper-button-prev"><i class="fas fa-chevron-left"></i></div>
            <div class="swiper-button-next"><i class="fas fa-chevron-right"></i></div>
        </div>
    </section>
    <section id="section__about">
        <div class="about_wrap">
            <div class="about_container">
                <div class="about__img">
                    <img class="img1" src="img/header_bg.jpg" alt="Image 1" />
                </div>
                <div class="about__text">
                    <h5 class="h5_title_text">About us :</h5>
                    <span>ARCHITECTS THE MONO</span>
                    <span>건축을 통해 더 나은 미래를 만들어가고자 하는 MONO 입니다.</span>
                    <span>저희의 핵심 철학은 '사람 중심의 공간'을 창조하는 것입니다.</span>
                    <span>각 프로젝트는 사용자의 요구와 환경적 조건을 깊이 있게 고려하여, 기능적이면서도 심미적인 공간을 구현합니다.</span>
                    <a href="<c:url value="about"/>" class="a_more_text">more ▶ </a>
                </div>
            </div>
        </div>
    </section>

    <section id="section__service">
        <div class="service__wrapper">
            <div class="service__text">
                <h5 class="h5_title_text reveal reveal_TTB">Service :</h5>
                <span class="reveal reveal_TTB">저희 사무소는 도시부터 주거, 상업, 문화 시설까지 다양한 건축 분야에서 </span>
                <span class="reveal reveal_TTB">전문 설계와 친환경 솔루션을 제공합니다. </span>
                <span class="reveal reveal_TTB">혁신적인 접근과 정밀한 시공 감리로 고객의 꿈을 실현합니다. </span>
            </div>
            <div class="scroll-container">
                <ul>
                    <li>
                        <div class="service__item">
                            <div class="imgBox">
                                <img src="img/header_bg.jpg" alt="" />
                            </div>
                            <div class="textBox">
                                <p class="title">건축 설계</p>
                                <p class="text en2">맞춤형 설계로 당신의 공간에 생명을 불어넣습니다.</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="service__item">
                            <div class="imgBox">
                                <img src="img/header_bg.jpg" alt="" />
                            </div>
                            <div class="textBox">
                                <p class="title">도시 설계</p>
                                <p class="text en2">더 나은 도시 환경을 위한 종합적인 계획과 실행.</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="service__item">
                            <div class="imgBox">
                                <img src="img/header_bg.jpg" alt="" />
                            </div>
                            <div class="textBox">
                                <p class="title">친환경 설계</p>
                                <p class="text en2">환경을 생각하는 지속 가능한 건축 솔루션.</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="service__item">
                            <div class="imgBox">
                                <img src="img/header_bg.jpg" alt="" />
                            </div>
                            <div class="textBox">
                                <p class="title">시공감리</p>
                                <p class="text en2">정밀한 감리와, 시공 과정의 완벽함 보장.</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </section>
</main>
<%@include file="footer.jsp"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.5/gsap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.5/ScrollTrigger.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.1/ScrollToPlugin.min.js"></script>
<!-- 글씨 쪼개주는 효과 -->
<script src="https://unpkg.com/split-type"></script>

<script>
    //footer
    $(".sns__icons").click(function (e) {
        e.preventDefault()
    })
</script>
<script>
    $(document).ready(function () {
        var owl = $(".owl-carousel")
        owl.owlCarousel({
            items: 1, // 한번에 보여지는 이미지 수
            loop: true, // 항목들을 무한으로 반복하여 보여줄지 여부
            autoplay: true, // 자동으로 슬라이드 쇼를 시작할지 여부
            autoplayTimeout: 5000, // 다음 이미지로 넘어가는 시간 (단위 : 밀리초)
            autoplayHoverPause: false, // 마우스가 이미지에 위에 있을 때 자동 슬라이드를 일시중지 할지 여부
            animateOut: "animate__animated animate__fadeOut", // 슬라이드가 나갈 때 애니메이션
            animateIn: "animate__animated animate__fadeIn", // 슬라이드가 들어올 때 애니메이션
        })
    })
</script>
<script>
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

    // owl-carousel이 완전히 로드되고 특정 이벤트 호출
    $(".owl-carousel").on("initialized.owl.carousel", function (event) {
        // const ani1 = gsap.timeline().to(".about__img img", { width: "50%" }).from(".about__text", { x: 100, autoAlpha: 0 }, "-=0.25")

        // ScrollTrigger.create({
        //   animation: ani1,
        //   trigger: ".about__img img",
        //   start: "top center",
        //   toggleActions: "play none none reverse",
        // })

        let test = gsap.matchMedia()

        function createScrollTrigger(animation, triggerElement) {
            ScrollTrigger.create({
                animation: animation,
                trigger: triggerElement,
                start: "top center",
                toggleActions: "play none none reverse",
                markers: true,
            })
        }

        test.add("(min-width: 990px)", () => {
            // 대형 화면에서는 이미지와 텍스트 모두에 애니메이션 적용
            const ani1 = gsap.timeline().to(".about__img img", { width: "50%" }).from(".about__text", { x: 100, autoAlpha: 0 }, "-=0.25")

            createScrollTrigger(ani1, ".about__img img")
        })

        test.add("(max-width: 989px)", () => {
            // 소형 화면에서는 텍스트에만 애니메이션 적용
            const ani1 = gsap.from(".about__text", { x: 100, autoAlpha: 0 })

            createScrollTrigger(ani1, ".about__img img")
        })

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

        var moveBar = () => {
            gsap.set(".bar", { left: gsap.getProperty(".txt1", "width") + 1 })
        }

        gsap
            .timeline({ delay: 0.2 })
            .set(".txt1", { fontWeight: "bold", autoAlpha: 1 })
            .set(".bar", { left: 1, immediateRender: true })
            // .to(".bar", { duration: 0.1, autoAlpha: 0, ease: "expo.in", yoyo: true, repeat: 5, repeatDelay: 0.3 }, 0)
            .from(".txt1", { duration: 1.1, width: 0, ease: "steps(14)", onUpdate: moveBar })
            .to(".bar", { duration: 0.4, x: 290, width: 0, ease: "power4.in" })
            .set(".txt1", { width: "auto" })
            .to(".txt2", { duration: 0.2, autoAlpha: 1, y: 20, ease: "power2.out" })

        const items = document.querySelectorAll(".project__img .item")

        const expand = (item, i) => {
            items.forEach((it, ind) => {
                if (i === ind) return
                it.clicked = false
            })

            gsap.to(items, {
                width: item.clicked ? "11vw" : "8vw",

                duration: 0.5,
                ease: "power2.out",
            })

            item.clicked = !item.clicked

            gsap.to(item, {
                width: item.clicked ? "42vw" : "11vw",
                duration: 1,

                ease: "expo.out",
            })
        }

        items.forEach((item, i) => {
            item.clicked = false
            item.addEventListener("click", () => expand(item, i))
        })

        var swiper = new Swiper(".swiper", {
            parallax: true,
            slidesPerView: 1,
            spaceBetween: 10,
            pagination: false,
            loop: true,
            autoplay: {
                delay: 5000,
                disableOnInteraction: false,
            },
            effect: "coverflow", // Coverflow 효과 적용
            coverflowEffect: {
                rotate: 50, // 회전 각도
                stretch: 0, // 슬라이드 간 거리
                depth: 100, // 깊이 효과
                modifier: 1, // 효과의 영향
                slideShadows: true, // 슬라이드 그림자
            },
            speed: 500,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            simulateTouch: true,
        })
    })
</script>
<script>
    // service

    ScrollTrigger.matchMedia({
        "(min-width: 768px)": function () {
            let list = gsap.utils.toArray("#section__service ul li")

            let scrollTween = gsap.to(list, {
                xPercent: -100 * list.length,
                ease: "none",
                scrollTrigger: {
                    trigger: "#section__service",
                    pin: true,
                    scrub: 1,
                    start: "center center",
                    end: "300%",
                    // markers: true,
                },
            })
        },
    })
</script>
</body>
</html>

