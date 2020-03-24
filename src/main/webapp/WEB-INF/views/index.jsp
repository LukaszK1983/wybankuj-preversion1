<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Wybankuj</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.6.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Lora:400i|Roboto+Condensed:400,700|Amatic+SC|Cormorant+Garamond:300,400|Roboto+Slab:700&amp;subset=latin-ext" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/appindex.js"></script>
</head>
<body>
<%--<div class="jumbotron jumbotron-fluid text-center border-bottom" style="background-color: #3D78B8; color: #FFFFFF">--%>
<%--    <h2>Wybankuj.pl - wszystkie kredyty w jednym miejscu</h2>--%>
<%--<div class="text-left border-bottom">--%>
<div class="div-header">
    <%@ include file="/WEB-INF/JSPF/mainheader.jspf"%>
</div>

<br />

<div class="container">

    <div class="slider" id="slider" style="width: 75vmax">
        <img src="<c:url value="/img/slider_image_1.jpg" />" alt="" class="img-slide" />
        <img src="<c:url value="/img/slider_image_2.jpg" />" alt="" class="img-slide" />
        <img src="<c:url value="/img/slider_image_3.jpg" />" alt="" class="img-slide" />
        <img src="<c:url value="/img/slider_image_4b.jpg" />" alt="" class="img-slide" />
    </div>

    <div class="mx-auto" style="width: 60vmax; margin-top: 5%">
        <h3 class="h3-simulation">Wybankuj teraz najlepszą ofertę dla siebie</h3>
        <br />
        <div id="loan" class="rounded shadow p-4 mb-4 div-simulation-left"><a href="${pageContext.request.contextPath}/loanParameters" class="a-simulation"><p class="p-simulation">Kredyt gotówkowy</p></a></div>
        <div id="mortgage" class="rounded shadow p-4 mb-4 div-simulation-right"><a href="${pageContext.request.contextPath}/mortgageParameters" class="a-simulation"><p class="p-simulation">Kredyt hipoteczny</p></a></div>
    </div>

</div>

<div class="div-details">
    <h3 class="h3-details">Wybankuj, a zyskasz:</h3>
    <div class="div-details-ul centered">
        <ul>
            <li>Bezpłatne porównanie ofert kredytowych dostępnych na rynku</li>
            <br />
            <li>Wszystkie banki w jednym miejscu</li>
            <br />
            <li>Brak nachalnych telefonów! Ty wybierasz bank i sam się z nim kontaktujesz</li>
            <br />
            <li>Brak pośredników wybierających za Ciebie - to Ty tu rządzisz</li>
            <br />
            <li>Brak magazynowania Twoich danych osobowych w celach marketingowych</li>
            <br />
            <li>Komfort, wygoda, spokój</li>
        </ul>
    </div>
    <h4 class="h3-details">Sprawdź, jakie to proste!</h4>
</div>

<div class="div-image-footer">
    <img src="${pageContext.request.contextPath}/img/slider_kredyty.jpg" alt="" class="image-footer" />
</div>

<div class="div-footer">
    <%@ include file="/WEB-INF/JSPF/footer.jspf"%>
</div>

<script type="module">
    class Slider {
        constructor(elemSelector, opts) {
            const defaultOpts = {
                pauseTime: 0,
                prevText: "Poprzedni slide",
                nextText: "Następny slide"
            };
            this.options = Object.assign({}, defaultOpts, opts);
            this.sliderSelector = elemSelector;
            this.currentSlide = 0;
            this.time = null;
            this.slider = null;
            this.elem = null;
            this.slides = null;

            this.generateSlider();
            this.changeSlide(this.currentSlide);
        }

        generateSlider() {
            this.slider = document.querySelector(this.sliderSelector);
            this.slider.classList.add('slider');

            const slidesCnt = document.createElement('div');
            slidesCnt.classList.add('slider-slides-cnt');

            this.slides = this.slider.children;

            while (this.slides.length) {
                this.slides[0].classList.add('slider-slide');
                slidesCnt.appendChild(this.slides[0]);
            }
            this.slides = slidesCnt.querySelectorAll('.slider-slide');
            this.slider.appendChild(slidesCnt);
        }

        slidePrev() {
            this.currentSlide--;
            if (this.currentSlide < 0) {
                this.currentSlide = this.slides.length - 1;
            }
            this.changeSlide(this.currentSlide);
        }

        slideNext() {
            this.currentSlide++;
            if (this.currentSlide > this.slides.length - 1) {
                this.currentSlide = 0;
            }
            this.changeSlide(this.currentSlide);
        }

        changeSlide(index) {
            this.slides.forEach(slide => {
                slide.classList.remove('slider-slide-active');
                slide.setAttribute('aria-hidden', true);
            });

            this.slides[index].classList.add('slider-slide-active');
            this.slides[index].setAttribute('aria-hidden', false);

            this.currentSlide = index;

            if (this.options.pauseTime !== 0) {
                clearInterval(this.time);
                this.time = setTimeout(() => this.slideNext(), this.options.pauseTime)
            }
        }
    }

    const opts = {
        pauseTime : 4000
    };

    const slide = new Slider('#slider', opts);
</script>

</body>
</html>
