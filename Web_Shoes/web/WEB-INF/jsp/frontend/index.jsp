<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="i" uri="http://www.springframework.org/tags" %>
<html lang="en">

    <head>
        <jsp:include page="linkcss.jsp"></jsp:include>
            <style>
                .ps-shoe__thumbnail img {
                    height: fit-content;
                    height: 270px;
                    object-fit: cover;
                }
                .ps-shoe__variant img{
                    height:34px
                }
                .pagination>li>a, .pagination>li>span{
                    float: none;
                }
                .dropdown-menu {
                    position: absolute;
                    z-index: 2000;
                }
                .ps-shoe__detail span{
                    top: 25px !important;
                }

                .ps-shoe__detail del{
                    font-size: 16px;

                    color: #cf5050;
                }
                .owl-carousel {
                    width: 100%;
                    height: 90vh;
                }

                .slide {
                    width: 100%;
                    height: 90vh;
                    position: relative;
                    background-size: cover;
                    background-repeat: no-repeat;
                    background-position: center center;
                }

                .slide::before {
                    content: "";
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 90vh;
                }

                .slide-content {
                    position: absolute;
                    top: 50%;
                    transform: translateY(-50%);
                    color: #fff;
                    padding-right: 50%;
                    padding-left: 10%;
                }

                .slide-content h1 {
                    font-family: "Anton", serif;
                    font-size: 45px;
                    text-transform: uppercase;
                }

                .slide-content p {
                    font-family: "Lato", serif;
                    font-size: 18px;
                    color: #333;
                    margin-bottom: 20px;
                }

                .slide-content button {
                    font-family: "Roboto", serif;
                    font-size: 25px;
                    text-transform: uppercase;
                    font-weight: bolder;
                    padding: 10px 25px;
                    border: none;
                }
                .ps-shoe .ps-shoe__variants {

                    top: 44px !important;

                }

                .owl-dots button {
                    border: none !important;
                    outline: none !important;
                }

                .owl-nav button {
                    border: none !important;
                    outline: none !important;
                }
                .ps18{
                    font-size: 18px !important;
                }
                .pic1 {
                    width: 55px !important;
                    height: 55px !important;
                    display: initial !important;
                }
                .hethang{
                    position: absolute;
                    right: 0;
                    top: 0px;
                    width: 97px;
                    display: inline-block;
                    position: absolute;

                    background-color: #cf5050;
                    height: 35px;
                    z-index: 10;

                }
                .ps-shoe:hover .ps-shoe__content {

                    bottom: -60px !important;

                }
                .mb-50 {
                    margin-bottom: 0px !important;
                }
                .ps-shoe .ps-shoe__thumbnail {
                    padding-bottom: 28px !important;
                }
                .hethang > span {
                    text-align: center;
                    width: 100%;
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    -webkit-transform: translate(-50%, -50%);
                    -moz-transform: translate(-50%, -50%);
                    -ms-transform: translate(-50%, -50%);
                    -o-transform: translate(-50%, -50%);
                    transform: translate(-50%, -50%);
                    font-family: "Montserrat", sans-serif;
                    font-size: 16px;
                    font-weight: 500;
                    color: #efefef;
                }
                .ps-shoe__variant .owl-carousel .owl-stage-outer {
                    position: relative;
                    overflow: hidden;
                    top: 30px !important;
                    -webkit-transform: translate3d(0px,0px,0px);
                }
                .ps-section__title {
                    min-width: 100% !important;
                }
                .ps-masonry__filter li a{
                    cursor: pointer;
                }
                .ps-section--features-product .ps-masonry__filter{
                    position: absolute;
                    right: 0;
                    top: 64px;
                }
            </style>
        </head>


        <body>
            <div class="header--sidebar"></div>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="header-services">
                <div class="ps-services owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="7000" data-owl-gap="0"
                     data-owl-nav="true" data-owl-dots="false" data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1"
                     data-owl-item-md="1" data-owl-item-lg="1" data-owl-duration="1000" data-owl-mousedrag="on">
                    <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery
                        on every order with Sky Store</p>
                    <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery
                        on every order with Sky Store</p>
                    <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery
                        on every order with Sky Store</p>
                </div>
            </div>
            <main class="ps-main">
                <div class="ps-banner">
                    <div class="rev_slider fullscreenbanner" id="home-banner">
                        <div class="owl-carousel owl-theme">
                        <c:forEach var="bn" items="${banners}">
                            <c:if test="${bn.viTri == 1}">
                                <div class="slide" style="background-image: url(/Web_Shoes/resources/images/banner/${bn.anhBanner});">

                                </div>
                            </c:if>
                        </c:forEach>
                    </div>



                </div>
            </div>
            <div class="ps-section--features-product ps-section masonry-root pt-100 pb-100">
                <div class="ps-container">
                    <div class="ps-section__header mb-50">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
                                <h3 class="ps-section__title" >- Sản Phẩm Theo Nhãn Hàng</h3>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
                                <ul class="ps-masonry__filter">
                                    <c:forEach items="${nhan}" var="nhan" end="0">
                                        <li class="current" id="current"><a  data-filter=".${nhan.tenNhanHang}">${nhan.tenNhanHang}</a></li>
                                        </c:forEach>
                                        <c:forEach items="${nhan}" var="nhan" begin="1">
                                        <li><a data-filter=".${nhan.tenNhanHang}">${nhan.tenNhanHang}</a></li>
                                        </c:forEach>

                                </ul>
                            </div>
                        </div>


                    </div>
                    <div class="ps-section__content pb-50">
                        <div class="masonry-wrapper" data-col-md="4" data-col-sm="2" data-col-xs="1" data-gap="30" data-radio="100%">
                            <div class="ps-masonry">
                                <c:forEach items="${nhan}" var="nhan">
                                    <c:forEach var="s" items="${nhan.laySptheoNH()}">
                                        <c:if test="${s.check()!=null}">
                                            <div class="grid-item ${nhan.tenNhanHang}">
                                                <div class="grid-item__content-wrapper">
                                                    <div class="ps-shoe mb-30">

                                                        <div class="ps-shoe__thumbnail">
                                                            <c:forEach var="o" items="${spoderby}">
                                                                <c:if test="${s.getMaSanPham()==o.getMaSanPham()}">
                                                                    <div class="ps-badge"><span>New</span></div>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:forEach var="b" items="${s.getKhuyenMaiCollection()}">

                                                                <c:if test="${b.getGiaGiam()!=null}">
                                                                    <div class="ps-badge ps-badge--sale ps-badge--2nd"><span>-${b.getGiaGiam()}%</span></div>

                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${s.Anh1()==null}">
                                                                <div class="hethang"><span>Hết Hàng</span></div>

                                                            </c:if>
                                                            <c:forEach var="p" items="${s.Anh()}" end="0">
                                                                <a
                                                                    class="ps-shoe__favorite" href="#"><i class="ps-icon-heart"></i></a>
                                                                <img id="pic${s.maSanPham}" src="<i:url value='/images/${p.anhChinh}'/>" alt="" height="330px" >
                                                                <a class="ps-shoe__overlay" id="link${s.maSanPham}" href="/Web_Shoes/SanPhamDetail?maSanPham=${s.maSanPham}&maDanhMuc=${s.maDanhMuc.maDanhMuc}&maMau=${p.maMau.maMau}">
                                                                </a>

                                                            </c:forEach>  
                                                        </div>
                                                        <div class="ps-shoe__content">
                                                            <div  class="ps-shoe__variants">
                                                                <div>

                                                                    <c:forEach var="p" items="${s.Anh()}">

                                                                        <img class="pic1" onmouseover="chaneImage(${s.maSanPham}, '<i:url value='/SanPhamDetail?maSanPham=${s.maSanPham}&maDanhMuc=${s.maDanhMuc.maDanhMuc}&maMau=${p.maMau.maMau}'/>', '<i:url value='/images/${p.anhChinh}'/>')" src="<i:url value='/images/${p.anhChinh}'/>" height="55px" width="55px" alt="">

                                                                    </c:forEach>


                                                                </div>

                                                            </div>
                                                            <div class="ps-shoe__detail"><a class="ps-shoe__name">${s.tenSanPham}</a>
                                                                <p class="ps-shoe__categories"><a href="#"> ${s.maNhanHang.tenNhanHang}</a></p>

                                                                <p class="ps-shoe__categories">${s.Anh().size()} Colours</p>

                                                                <p><c:if test="${s.getGiaMin()!=s.getGiaMax()}">
                                                                        <span style="color: red;">
                                                                            ${s.getGiaMin()}~${s.getGiaMax()}
                                                                        </span>
                                                                    </c:if>
                                                                    <c:if test="${s.getGiaMin()==s.getGiaMax()}">

                                                                        <c:if test="${!s.getKhuyenMaiCollection().isEmpty()}">
                                                                            <del id="gia" style="font-size: 12px;">${s.getGiaMin()}</del>
                                                                            <span style="color: red;">
                                                                                ${s.getGiaMin()}
                                                                            </span>
                                                                        </c:if>
                                                                        <c:if test="${s.getKhuyenMaiCollection().isEmpty()}">

                                                                            <span style="color: red;">
                                                                                ${s.getGiaMin()}
                                                                            </span>
                                                                        </c:if>

                                                                    </c:if>
                                                                </p>





                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="ps-section--sale-off ps-section pt-80 pb-40">
                <div class="ps-container">
                    <div class="ps-section__header mb-50">
                        <h3 class="ps-section__title" data-mask="Sale off">- Hot Deal Today</h3>
                    </div>
                    <div class="ps-section__content">
                        <div class="row">
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 ">
                                <div class="ps-hot-deal">
                                    <h3>Nike DUNK Max 95 OG</h3>
                                    <p class="ps-hot-deal__price">Only: <span>£155</span></p>
                                    <ul class="ps-countdown" data-time="December 13, 2017 15:37:25">
                                        <li><span class="hours"></span>
                                            <p>Hours</p>
                                        </li>
                                        <li class="divider">:</li>
                                        <li><span class="minutes"></span>
                                            <p>minutes</p>
                                        </li>
                                        <li class="divider">:</li>
                                        <li><span class="seconds"></span>
                                            <p>Seconds</p>
                                        </li>
                                    </ul><a class="ps-btn" href="#">Order Today<i class="ps-icon-next"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 ">
                                <div class="ps-hotspot"><a class="point first active" href="javascript:;"><i class="fa fa-plus"></i>
                                        <div class="ps-hotspot__content">
                                            <p class="heading">JUMP TO HEADER</p>
                                            <p>Dynamic Fit Collar en la zona del tobillo que une la parte inferior de la pierna y el pie sin
                                                reducir la libertad de movimiento.</p>
                                        </div>
                                    </a><a class="point second" href="javascript:;"><i class="fa fa-plus"></i>
                                        <div class="ps-hotspot__content">
                                            <p class="heading">JUMP TO HEADER</p>
                                            <p>Dynamic Fit Collar en la zona del tobillo que une la parte inferior de la pierna y el pie sin
                                                reducir la libertad de movimiento.</p>
                                        </div>
                                    </a><a class="point third" href="javascript:;"><i class="fa fa-plus"></i>
                                        <div class="ps-hotspot__content">
                                            <p class="heading">JUMP TO HEADER</p>
                                            <p>Dynamic Fit Collar en la zona del tobillo que une la parte inferior de la pierna y el pie sin
                                                reducir la libertad de movimiento.</p>
                                        </div>
                                    </a><img src="images/hot-deal.png" alt=""></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <c:if test="${sa!=null}">
                <div class="ps-section ps-section--top-sales ps-owl-root pt-80 pb-80">
                    <div class="ps-container">
                        <div class="ps-section__header mb-50">
                            <div class="row">
                                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 ">
                                    <h3 class="ps-section__title" data-mask="BEST SALE">- Top Sales</h3>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
                                    <div class="ps-owl-actions"><a class="ps-prev" href="#"><i class="ps-icon-arrow-right"></i>Prev</a><a
                                            class="ps-next" href="#">Next<i class="ps-icon-arrow-left"></i></a></div>
                                </div>
                            </div>
                        </div>
                        <div class="ps-section__content">
                            <div class="ps-owl--colection owl-slider" data-owl-auto="true" data-owl-loop="false" data-owl-speed="5000"
                                 data-owl-gap="30" data-owl-nav="false" data-owl-dots="false" data-owl-item="4" data-owl-item-xs="1"
                                 data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="4" data-owl-duration="1000"
                                 data-owl-mousedrag="on">
                                <c:forEach var="c" items="${spall}">
                                    <c:if test="${c.check()!=null}">
                                        <div class="ps-shoes--carousel">
                                            <div class="ps-shoe">
                                                <div class="ps-shoe__thumbnail">
                                                    <c:forEach var="o" items="${spoderby}">
                                                        <c:if test="${c.getMaSanPham()==o.getMaSanPham()}">
                                                            <div class="ps-badge"><span>New</span></div>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:forEach var="b" items="${c.getKhuyenMaiCollection()}">

                                                        <c:if test="${b.getGiaGiam()!=null}">
                                                            <div class="ps-badge ps-badge--sale ps-badge--2nd"><span>-${b.getGiaGiam()}%</span></div>

                                                        </c:if>
                                                    </c:forEach>

                                                    <c:if test="${c.Anh1()==null}">
                                                        <div class="hethang"><span>Hết Hàng</span></div>

                                                    </c:if>
                                                    <c:forEach var="p" items="${c.Anh()}" end="0">
                                                        <a
                                                            class="ps-shoe__favorite" href="#"><i class="ps-icon-heart"></i></a><img id="picsale${c.maSanPham}" src="<i:url value='/images/${p.anhChinh}'/>"
                                                                                                                                 alt="" height="330px" ><a class="ps-shoe__overlay" id="spsale${c.maSanPham}" href="/Web_Shoes/SanPhamDetail?maSanPham=${c.maSanPham}&maDanhMuc=${c.maDanhMuc.maDanhMuc}&maMau=${p.maMau.maMau}">
                                                        </a>

                                                    </c:forEach> 
                                                </div>
                                                <div class="ps-shoe__content">
                                                    <div class="ps-shoe__variants">
                                                        <div>

                                                            <c:forEach var="p" items="${c.Anh()}">

                                                                <img class="pic1" onmouseover="chaneImages(${c.maSanPham}, '<i:url value='/SanPhamDetail?maSanPham=${c.maSanPham}&maDanhMuc=${c.maDanhMuc.maDanhMuc}&maMau=${p.maMau.maMau}'/>', '<i:url value='/images/${p.anhChinh}'/>')" src="<i:url value='/images/${p.anhChinh}'/>" height="55px" width="55px" alt="">
                                                            </c:forEach>


                                                        </div>

                                                    </div>
                                                    <div class="ps-shoe__detail"><a class="ps-shoe__name">${c.tenSanPham}</a>
                                                        <p class="ps-shoe__categories"><a href="#"> ${c.maNhanHang.tenNhanHang}</a></p>

                                                        <p class="ps-shoe__categories">${c.Anh().size()} Colours</p>
                                                        <p><c:if test="${c.getGiaMin()!=c.getGiaMax()}">
                                                                <span style="color: red;">
                                                                    ${c.getGiaMin()}~${c.getGiaMax()}
                                                                </span>
                                                            </c:if>
                                                            <c:if test="${c.getGiaMin()==c.getGiaMax()}">
                                                                <c:if test="${!c.getKhuyenMaiCollection().isEmpty()}">
                                                                    <del id="gia" style="font-size: 12px;">${c.getGiaMin()}</del>
                                                                    <span style="color: red;">
                                                                        ${c.getGiaMin()}
                                                                    </span>
                                                                </c:if>
                                                                <c:if test="${c.getKhuyenMaiCollection().isEmpty()}">

                                                                    <span style="color: red;">
                                                                        ${c.getGiaMin()}
                                                                    </span>
                                                                </c:if>
                                                            </c:if></p>




                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>  
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>

            <div class="ps-section--offer">
                <c:forEach var="bn" items="${banners}">
                    <c:if test="${bn.viTri == 2}">
                        <div class="ps-column">
                            <a class="ps-offer">
                                <img src="/Web_Shoes/resources/images/banner/${bn.anhBanner}" alt="" height="245px" width="100%;">
                            </a>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <c:if test="${spoderby!=null}">
                <div class="ps-section ps-section--top-sales ps-owl-root pt-80 pb-80">
                    <div class="ps-container">
                        <div class="ps-section__header mb-50">
                            <div class="row">
                                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 ">
                                    <h3 class="ps-section__title" data-mask="BEST SALE">- Sản Phẩm Mới</h3>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
                                    <div class="ps-owl-actions"><a class="ps-prev" href="#"><i class="ps-icon-arrow-right"></i>Prev</a><a
                                            class="ps-next" href="#">Next<i class="ps-icon-arrow-left"></i></a></div>
                                </div>
                            </div>
                        </div>
                        <div class="ps-section__content">
                            <div class="ps-owl--colection owl-slider" data-owl-auto="true" data-owl-loop="false" data-owl-speed="5000"
                                 data-owl-gap="30" data-owl-nav="false" data-owl-dots="false" data-owl-item="4" data-owl-item-xs="1"
                                 data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="4" data-owl-duration="1000"
                                 data-owl-mousedrag="on">
                                <c:forEach var="c" items="${spoderby}">
                                    <c:if test="${c.check()!=null}">
                                        <div class="ps-shoes--carousel">
                                            <div class="ps-shoe">
                                                <div class="ps-shoe__thumbnail">
                                                    <c:forEach var="o" items="${spoderby}">
                                                        <c:if test="${c.getMaSanPham()==o.getMaSanPham()}">
                                                            <div class="ps-badge"><span>New</span></div>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:forEach var="b" items="${c.getKhuyenMaiCollection()}">

                                                        <c:if test="${b.getGiaGiam()!=null}">
                                                            <div class="ps-badge ps-badge--sale ps-badge--2nd"><span>-${b.getGiaGiam()}%</span></div>

                                                        </c:if>
                                                    </c:forEach>

                                                    <c:if test="${c.Anh1()==null}">
                                                        <div class="hethang"><span>Hết Hàng</span></div>

                                                    </c:if>
                                                    <c:forEach var="p" items="${c.Anh()}" end="0">
                                                        <a
                                                            class="ps-shoe__favorite" href="#"><i class="ps-icon-heart"></i></a><img id="picanhm${c.maSanPham}" src="<i:url value='/images/${p.anhChinh}'/>"
                                                                                                                                 alt="" height="330px" ><a class="ps-shoe__overlay" id="spmoi${c.maSanPham}" href="/Web_Shoes/SanPhamDetail?maSanPham=${c.maSanPham}&maDanhMuc=${c.maDanhMuc.maDanhMuc}&maMau=${p.maMau.maMau}">
                                                        </a>

                                                    </c:forEach> 
                                                </div>
                                                <div class="ps-shoe__content">
                                                    <div class="ps-shoe__variants">
                                                        <div>

                                                            <c:forEach var="p" items="${c.Anh()}">

                                                                <img class="pic1" onmouseover="chaneImages1(${c.maSanPham}, '<i:url value='/SanPhamDetail?maSanPham=${c.maSanPham}&maDanhMuc=${c.maDanhMuc.maDanhMuc}&maMau=${p.maMau.maMau}'/>', '<i:url value='/images/${p.anhChinh}'/>')" src="<i:url value='/images/${p.anhChinh}'/>" height="55px" width="55px" alt="">
                                                            </c:forEach>


                                                        </div>

                                                    </div>
                                                    <div class="ps-shoe__detail"><a class="ps-shoe__name">${c.tenSanPham}</a>
                                                        <p class="ps-shoe__categories"><a href="#"> ${c.maNhanHang.tenNhanHang}</a></p>

                                                        <p class="ps-shoe__categories">${c.Anh().size()} Colours</p>
                                                        <p><c:if test="${c.getGiaMin()!=c.getGiaMax()}">
                                                                <span style="color: red;">
                                                                    ${c.getGiaMin()}~${c.getGiaMax()}
                                                                </span>
                                                            </c:if>
                                                            <c:if test="${c.getGiaMin()==c.getGiaMax()}">
                                                                <c:if test="${!c.getKhuyenMaiCollection().isEmpty()}">
                                                                    <del id="gia" style="font-size: 12px;">${c.getGiaMin()}</del>
                                                                    <span style="color: red;">
                                                                        ${c.getGiaMin()}
                                                                    </span>
                                                                </c:if>
                                                                <c:if test="${c.getKhuyenMaiCollection().isEmpty()}">

                                                                    <span style="color: red;">
                                                                        ${c.getGiaMin()}
                                                                    </span>
                                                                </c:if>
                                                            </c:if></p>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>  
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <div class="ps-home-testimonial bg--parallax pb-80"  data-background="/Web_Shoes/resources/images/background/parallax.jpg">
                <div class="container">
                    <div class="owl-slider" style="max-height: 60%;" data-owl-auto="true" data-owl-loop="true" data-owl-speed="5000" data-owl-gap="0"
                         data-owl-nav="false" data-owl-dots="true" data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1"
                         data-owl-item-md="1" data-owl-item-lg="1" data-owl-duration="1000" data-owl-mousedrag="on"
                         data-owl-animate-in="fadeIn" data-owl-animate-out="fadeOut">
                        <div class="ps-testimonial">
                            <div class="ps-testimonial__thumbnail"><img src="/Web_Shoes/resources/images/testimonial/1.jpg" alt=""><i
                                    class="fa fa-quote-left"></i></div>
                            <header>
                                <select class="ps-rating">
                                    <option value="1">1</option>
                                    <option value="1">2</option>
                                    <option value="1">3</option>
                                    <option value="1">4</option>
                                    <option value="5">5</option>
                                </select>
                                <p>Logan May - CEO & Founder Invision</p>
                            </header>
                            <footer>
                                <p>“Dessert pudding dessert jelly beans cupcake sweet caramels gingerbread. Fruitcake biscuit cheesecake.
                                    Cookie topping sweet muffin pudding tart bear claw sugar plum croissant. “</p>
                            </footer>
                        </div>
                        <div class="ps-testimonial">
                            <div class="ps-testimonial__thumbnail"><img src="/Web_Shoes/resources/images/testimonial/2.jpg" alt=""><i
                                    class="fa fa-quote-left"></i></div>
                            <header>
                                <select class="ps-rating">
                                    <option value="1">1</option>
                                    <option value="1">2</option>
                                    <option value="1">3</option>
                                    <option value="1">4</option>
                                    <option value="5">5</option>
                                </select>
                                <p>Logan May - CEO & Founder Invision</p>
                            </header>
                            <footer>
                                <p>“Dessert pudding dessert jelly beans cupcake sweet caramels gingerbread. Fruitcake biscuit cheesecake.
                                    Cookie topping sweet muffin pudding tart bear claw sugar plum croissant. “</p>
                            </footer>
                        </div>
                        <div class="ps-testimonial">
                            <div class="ps-testimonial__thumbnail"><img src="/Web_Shoes/resources/images/testimonial/3.jpg" alt=""><i
                                    class="fa fa-quote-left"></i></div>
                            <header>
                                <select class="ps-rating">
                                    <option value="1">1</option>
                                    <option value="1">2</option>
                                    <option value="1">3</option>
                                    <option value="1">4</option>
                                    <option value="5">5</option>
                                </select>
                                <p>Logan May - CEO & Founder Invision</p>
                            </header>
                            <footer>
                                <p>“Dessert pudding dessert jelly beans cupcake sweet caramels gingerbread. Fruitcake biscuit cheesecake.
                                    Cookie topping sweet muffin pudding tart bear claw sugar plum croissant. “</p>
                            </footer>
                        </div>
                    </div>
                </div>
            </div>


            <jsp:include page="footer.jsp"></jsp:include>
            </main>
            <!-- JS Library-->
        <jsp:include page="script.jsp"></jsp:include>
        <script>
            $(document).ready(function () {
                $(".owl-carousel").owlCarousel({
                    items: 1,
                    lazyLoad: true,
                    loop: true,
                    nav: true,
                    dots: true,
                    autoplay: true,
                    autoplaySpeed: 1000,
                    smartSpeed: 1500,
                    autoplayHoverPause: true
                });
            });
        </script>
        <script>





            function chaneImage(sanpham, href, imgSrc) {
                var pic = document.querySelector('#pic' + sanpham);

                var link = document.getElementById('link' + sanpham);

                pic.img = imgSrc;

                link.href = href;



            }
            function chaneImages(sanpham, href, imgSrc) {
                var pic = document.querySelector('#picsale' + sanpham);
                var link = document.getElementById('spsale' + sanpham);


                pic.img = imgSrc;
                link.href = href;




            }
            function chaneImages1(sanpham, href, imgSrc) {
                var pic = document.querySelector('#picanhm' + sanpham);
                var link = document.getElementById('spmoi' + sanpham);


                pic.img = imgSrc;
                link.href = href;




            }

        </script>
    </body>

</html>