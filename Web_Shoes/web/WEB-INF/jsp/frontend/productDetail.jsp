
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="i" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <head>
        <jsp:include page="linkcss.jsp"></jsp:include>
        <link rel="stylesheet" href="<c:url value="/resources/frontend/css/toastr.min.css"/>">

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



            .css-12whm6j {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 7px;
            }
            .mt2-sm {
                margin-top: 8px;
            }
            .visually-hidden {
                position: absolute!important;
                height: 1px;
                width: 1px;
                overflow: hidden;
                clip: rect(1px 1px 1px 1px);
                clip: rect(1px,1px,1px,1px);
                white-space: nowrap;
            }
            .css-1pj6y87 input[type="radio"]:disabled + label {
                cursor: default;
                color: rgb(221, 221, 221);
                background: rgb(247, 247, 247);
                border: none;
            }.css-1pj6y87 input[type="radio"].visually-hidden + label {
                outline: none;
            }.css-12whm6j > :not(input):not(label) > label {
                -webkit-box-flex: 1;
                flex-grow: 1;
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                -webkit-box-pack: center;
                justify-content: center;
            }
            .css-1pj6y87 label {
                background: rgb(255, 255, 255);
                color: rgb(17, 17, 17);
                box-shadow: rgb(229 229 229) 0px 0px 0px 1px;
            }.css-xf3ahq {
                height: 48px;
                border-radius: 4px;
            }.swatch input {
                display: none;
            }
            .swatch input:checked + label {
                border: 1px solid rgb(17, 17, 17);
            }
            .css-1pj6y87 input[type="radio"]:not(:disabled) + label {
                cursor: pointer;
            }
            .css-1pj6y87 input[type="radio"]:checked + label {
                box-shadow: rgb(17 17 17) 0px 0px 0px 1px inset;
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
                <div class="test">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 ">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ps-product--detail pt-60">
                    <div class="ps-container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div class="ps-product__thumbnail"   >
                                    <div class="ps-product__preview">
                                        <div class="ps-product__variants" id="anhSp">
                                        <c:forEach var="p" items="${lctsp}">
                                            <c:if test="${p.anhChinh!=null}">
                                                <div class="item"><img src="<i:url value='/images/${p.anhChinh}'/>" height="55px" alt=""></div>
                                                </c:if>
                                            </c:forEach> 

                                    </div>
                                </div>
                                <div class="ps-product__image" id="anh">
                                    <c:forEach var="p" items="${lctsp}">
                                        <c:if test="${p.anhChinh!=null}">
                                            <div class="item"><img class="zoom" src="<i:url value='/images/${p.anhChinh}'/>" alt="" height="500px"></div>


                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="ps-product__thumbnail--mobile">
                                <div class="ps-product__main-img"><img src="images/shoe-detail/1.jpg" alt=""></div>
                                <div class="ps-product__preview owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="5000" data-owl-gap="20" data-owl-nav="true" data-owl-dots="false" data-owl-item="3" data-owl-item-xs="3" data-owl-item-sm="3" data-owl-item-md="3" data-owl-item-lg="3" data-owl-duration="1000" data-owl-mousedrag="on"><img src="images/shoe-detail/1.jpg" alt=""><img src="images/shoe-detail/2.jpg" alt=""><img src="images/shoe-detail/3.jpg" alt=""></div>
                            </div>
                            <div class="ps-product__info">

                                <h1>${sanpham.tenSanPham}</h1>
                                <p class="ps-product__category"><a href="#">${sanpham.maDanhMuc.tenDanhMuc}</a></p>
                                    <c:if test="${ctjoin!=null}">
                                        <c:if test="${!sanpham.khuyenMaiCollection.isEmpty()}">
                                            <c:forEach items="${sanpham.khuyenMaiCollection}" var="c">
                                            <span id="giakhuyenmai" class="ps-product__price"><fmt:formatNumber type="number" pattern="###,###,###" value="${ctjoin.getGia()-(ctjoin.getGia()/100)* c.giaGiam}" /> đ</span>
                                            <del id="gia">${ctjoin.getGiaString()}</del><span class="ps-product__price">${c.giaGiam}%</span>
                                            </c:forEach>
                                        </c:if>




                                    <c:if test="${sanpham.khuyenMaiCollection.isEmpty()}">
                                        <span  class="ps-product__price" id="giakhuyenmai">${ctjoin.getGiaString()}</span>
                                    </c:if>
                                </c:if>
                                <c:if test="${ctjoin==null}">
                                    <span class="ps-shoe__price">
                                        ${sanpham.getGiaMin()}~${sanpham.getGiaMax()}
                                    </span>
                                </c:if>
                                <div class="ps-product__block ps-product__quickview">
                                    <h4>${sanpham.maNhanHang.tenNhanHang}</h4>
                                    
                                </div>
                                <div class="ps-product__block ps-product__style " id="chonmau">
                                    <h4>CHOOSE YOUR STYLE</h4>
                                    <ul class="swatch" >

                                        <c:forEach var="p" items="${sanpham.Anh()}">
                                            <c:if test="${p.maMau.maMau==maMau}">
                                                <li>

                                                    <input id="${p.maMau.maMau}" type="radio" checked name="option-0" value="${p.maMau.maMau}">

                                                    <label for="${p.maMau.maMau}"><a href="/Web_Shoes/SanPhamDetail?maSanPham=${sanpham.maSanPham}&maDanhMuc=${sanpham.maDanhMuc.maDanhMuc}&maMau=${p.maMau.maMau}"><img id="pic" src="<i:url value='/images/${p.anhChinh}'/>" width="54px" height="54px" alt=""></a></label><input id="anhChinh" type="text" value="${p.anhChinh}"></li>

                                            </c:if>
                                            <c:if test="${p.maMau.maMau!=maMau}">
                                                <li>
                                                    <input id="${p.maMau.maMau}" type="radio" name="option-0" value="${p.maMau.maMau}">

                                                    <label for="${p.maMau.maMau}"><a href="/Web_Shoes/SanPhamDetail?maSanPham=${sanpham.maSanPham}&maDanhMuc=${sanpham.maDanhMuc.maDanhMuc}&maMau=${p.maMau.maMau}"><img id="pic" src="<i:url value='/images/${p.anhChinh}'/>" width="54px" height="54px" alt=""></a></label></li>

                                            </c:if>
                                        </c:forEach>







                                    </ul>
                                    <div class="invalid-feedback" style="display:block;color: red;"></div>

                                </div>
                                <div class="ps-product__block ps-product__size css-1pj6y87" id="size">
                                    <h4>CHOOSE SIZE<a href="#">Size chart</a></h4>
                                    <div class="mt2-sm css-12whm6j" id="masize">

                                        <c:forEach var="a" items="${lctsp}">

                                            <c:if test="${!sanpham.khuyenMaiCollection.isEmpty()}">
                                                <c:forEach items="${sanpham.khuyenMaiCollection}" var="b">
                                                    <c:if test="${a.idChiTietSP==ctjoin.idChiTietSP}">
                                                        <div class="masiz">

                                                            <input id="${a.size}" type="radio"  checked name="option-1" class="visually-hidden" value="${a.maSize}">
                                                            <label for="${a.size}" tabindex="-1" class="css-xf3ahq" onclick="chaneImages(${a.idChiTietSP},${a.getGia()},${b.getGiaGiam()})">${a.size}</label>
                                                            <input id="idchitiet${a.maSize}" type="radio" value="${a.idChiTietSP}" hidden>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${a.getStatus()=='true' && a.idChiTietSP!=ctjoin.idChiTietSP}">
                                                        <div class="masiz">

                                                            <input id="${a.size}" type="radio"  name="option-1" class="visually-hidden" value="${a.maSize}">
                                                            <label for="${a.size}" tabindex="-1" class="css-xf3ahq" onclick="chaneImages(${a.idChiTietSP},${a.getGia()},${b.getGiaGiam()})">${a.size}</label>
                                                            <input id="idchitiet${a.maSize}" type="radio" value="${a.idChiTietSP}" hidden>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${a.getStatus()=='false'}">
                                                        <div class="masiz">

                                                            <input id="${a.size}" type="radio" name="option-1" disabled class="visually-hidden" value="${a.maSize}">
                                                            <label for="${a.size}" tabindex="-1" class="css-xf3ahq" onclick="chaneImages(${a.idChiTietSP},${a.getGia()},${b.getGiaGiam()})">${a.size}</label>
                                                            <input id="idchitiet${a.maSize}" type="radio" value="${a.idChiTietSP}" hidden>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${sanpham.khuyenMaiCollection.isEmpty()}">
                                                <c:if test="${a.idChiTietSP==ctjoin.idChiTietSP}">
                                                    <div class="masiz">

                                                        <input id="${a.size}" type="radio"  checked name="option-1" class="visually-hidden" value="${a.maSize}">
                                                        <label for="${a.size}" tabindex="-1" class="css-xf3ahq" onclick="chaneImages(${a.idChiTietSP},${a.getGia()})">${a.size}</label>
                                                        <input id="idchitiet${a.maSize}" type="radio" value="${a.idChiTietSP}" hidden>
                                                    </div>
                                                </c:if>
                                                <c:if test="${a.getStatus()=='true' && a.idChiTietSP!=ctjoin.idChiTietSP}">
                                                    <div class="masiz">

                                                        <input id="${a.size}" type="radio"  name="option-1" class="visually-hidden" value="${a.maSize}">
                                                        <label for="${a.size}" tabindex="-1" class="css-xf3ahq" onclick="chaneImages(${a.idChiTietSP},${a.getGia()})">${a.size}</label>
                                                        <input id="idchitiet${a.maSize}" type="radio" value="${a.idChiTietSP}" hidden>
                                                    </div>
                                                </c:if>
                                                <c:if test="${a.getStatus()=='false'}">
                                                    <div class="masiz">

                                                        <input id="${a.size}" type="radio" name="option-1" disabled class="visually-hidden" value="${a.maSize}">
                                                        <label for="${a.size}" tabindex="-1" class="css-xf3ahq" onclick="chaneImages(${a.idChiTietSP},${a.getGia()})">${a.size}</label>
                                                        <input id="idchitiet${a.maSize}" type="radio" value="${a.idChiTietSP}" hidden>
                                                    </div>
                                                </c:if>
                                            </c:if>

                                        </c:forEach>



                                    </div>
                                    <div class="invalid-feedback" id="kiemtrasl" style="display:block;color: red;"></div>
                                    <div class="form-group" style="padding-top: 20px;">
                                        <input id="sanPham" type="radio" value="${sanpham.maSanPham}" hidden>

                                        <input class="form-control quantity" type="number" min="1" value="1" style="width: 135px;">
                                    </div>
                                    <div class="ps-product__shopping"><a class="ps-btn mb-10 btn-add-to-cart">Add to cart<i class="ps-icon-next"></i></a>
                                        <div class="ps-product__actions"><a class="mr-10" href="whishlist.html"><i class="ps-icon-heart"></i></a><a href="compare.html"><i class="ps-icon-share"></i></a></div>
                                    </div>


                                </div>
                                <div class="clearfix"></div>

                            </div>
                            <div class="ps-product__content mt-50">
                                <ul class="tab-list" role="tablist">
                                    <li class="active"><a href="#tab_01" aria-controls="tab_01" role="tab" data-toggle="tab">Overview</a></li>
                                    <li><a href="#tab_02" aria-controls="tab_02" role="tab" data-toggle="tab">Review</a></li>
                                    <li><a href="#tab_03" aria-controls="tab_03" role="tab" data-toggle="tab">PRODUCT TAG</a></li>
                                    <li><a href="#tab_04" aria-controls="tab_04" role="tab" data-toggle="tab">ADDITIONAL</a></li>
                                </ul>
                            </div>
                            <div class="tab-content mb-60">
                                <div class="tab-pane active" role="tabpanel" id="tab_01">
                                    ${sanpham.moTa}
                                </div>
                                <div class="tab-pane" role="tabpanel" id="tab_02">
                                    <p class="mb-20">1 review for <strong>Shoes Air Jordan</strong></p>
                                    <div class="ps-review">
                                        <div class="ps-review__thumbnail"><img src="images/user/1.jpg" alt=""></div>
                                        <div class="ps-review__content">
                                            <header>
                                                <select class="ps-rating">
                                                    <option value="1">1</option>
                                                    <option value="1">2</option>
                                                    <option value="1">3</option>
                                                    <option value="1">4</option>
                                                    <option value="5">5</option>
                                                </select>
                                                <p>By<a href=""> Alena Studio</a> - November 25, 2017</p>
                                            </header>
                                            <p>Soufflé danish gummi bears tart. Pie wafer icing. Gummies jelly beans powder. Chocolate bar pudding macaroon candy canes chocolate apple pie chocolate cake. Sweet caramels sesame snaps halvah bear claw wafer. Sweet roll soufflé muffin topping muffin brownie. Tart bear claw cake tiramisu chocolate bar gummies dragée lemon drops brownie.</p>
                                        </div>
                                    </div>
                                    <form class="ps-product__review" action="_action" method="post">
                                        <h4>ADD YOUR REVIEW</h4>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                                                <div class="form-group">
                                                    <label>Name:<span>*</span></label>
                                                    <input class="form-control" type="text" placeholder="">
                                                </div>
                                                <div class="form-group">
                                                    <label>Email:<span>*</span></label>
                                                    <input class="form-control" type="email" placeholder="">
                                                </div>
                                                <div class="form-group">
                                                    <label>Your rating<span></span></label>
                                                    <select class="ps-rating">
                                                        <option value="1">1</option>
                                                        <option value="1">2</option>
                                                        <option value="1">3</option>
                                                        <option value="1">4</option>
                                                        <option value="5">5</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12 ">
                                                <div class="form-group">
                                                    <label>Your Review:</label>
                                                    <textarea class="form-control" rows="6"></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <button class="ps-btn ps-btn--sm">Submit<i class="ps-icon-next"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="tab_03">
                                    <p>Add your tag <span> *</span></p>
                                    <form class="ps-product__tags" action="_action" method="post">
                                        <div class="form-group">
                                            <input class="form-control" type="text" placeholder="">
                                            <button class="ps-btn ps-btn--sm">Add Tags</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="tab_04">
                                    <div class="form-group">
                                        <textarea class="form-control" rows="6" placeholder="Enter your addition here..."></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button class="ps-btn" type="button">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ps-section ps-section--top-sales ps-owl-root pt-40 pb-80">
                        <div class="ps-container">
                            <div class="ps-section__header mb-50">
                                <div class="row">
                                    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 ">
                                        <h3 class="ps-section__title" data-mask="Related item">- YOU MIGHT ALSO LIKE</h3>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
                                        <div class="ps-owl-actions"><a class="ps-prev" href="#"><i class="ps-icon-arrow-right"></i>Prev</a><a class="ps-next" href="#">Next<i class="ps-icon-arrow-left"></i></a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="ps-section__content">
                                <div class="ps-owl--colection owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="5000" data-owl-gap="30" data-owl-nav="false" data-owl-dots="false" data-owl-item="4" data-owl-item-xs="1" data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="4" data-owl-duration="1000" data-owl-mousedrag="on">
                                    <c:forEach var="s" items="${sp}">
                                        <c:if test="${s.check()!=null}">
                                            <div class="ps-shoes--carousel">
                                                <div class="ps-shoe">
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
                                                                class="ps-shoe__favorite" href="#"><i class="ps-icon-heart"></i></a><img id="pic${s.maSanPham}" src="<i:url value='/images/${p.anhChinh}'/>"
                                                                                                                                     alt="" height="330px" ><a class="ps-shoe__overlay" id="link${s.maSanPham}" href="/Web_Shoes/SanPhamDetail?maSanPham=${s.maSanPham}&maDanhMuc=${s.maDanhMuc.maDanhMuc}&maMau=${p.maMau.maMau}">
                                                            </a>

                                                        </c:forEach> 
                                                    </div>
                                                    <div class="ps-shoe__content">
                                                        <div class="ps-shoe__variants">
                                                            <div class="ps-shoe__variant normal">
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
                                                                    <c:forEach var="p" items="${s.getChiTietSanPhamCollection()}" end="0">
                                                                        <del id="gia" style="font-size: 12px;">${p.getGiaString()}</del>
                                                                        <span style="color: red;">
                                                                            ${p.getGiaKmString()}
                                                                        </span>
                                                                    </c:forEach>
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
                </div>
            </div>
            <jsp:include page="footer.jsp"></jsp:include>
            </main>
            <!-- JS Library-->
        <jsp:include page="script.jsp"></jsp:include>
        <script type="text/javascript" src="<c:url value="/resources/frontend/js/toastr.min.js"/>"></script>

        <script>

                                                                        $(document).ready(function () {

                                                                            $(".btn-add-to-cart").click(function () {
                                                                                if (ValidateScreening()) {
                                                                                    var maSanPham = $("#sanPham").val();
                                                                                    var str = $("#giakhuyenmai").text();
                                                                                    var quantity = $(".quantity").val();
                                                                                    var checkbox = document.getElementsByName("option-0");
                                                                                    for (var i = 0; i < checkbox.length; i++) {
                                                                                        if (checkbox[i].checked === true) {
                                                                                            var maMau = checkbox[i].value;
                                                                                        }
                                                                                    }
                                                                                    var anh = $("#anhChinh").val();
                                                                                    var gia1 = str.replaceAll(".", "");
                                                                                    var gia2 = gia1.replaceAll("đ", "");
                                                                                    var gia = gia2.replaceAll(" ", "");
                                                                                    var checkbox1 = document.getElementsByName("option-1");
                                                                                    for (var i = 0; i < checkbox1.length; i++) {
                                                                                        if (checkbox1[i].checked === true) {
                                                                                            var maSize = checkbox1[i].value;
                                                                                        }
                                                                                    }
                                                                                    var idChiTietSP = $("#idchitiet" + maSize).val();
                                                                                    $.ajax({
                                                                                        url: "${pageContext.request.contextPath}/ThemGioHang",
                                                                                        type: "GET",
                                                                                        data: {
                                                                                            idChiTietSP: idChiTietSP,
                                                                                            quantity: quantity,
                                                                                            gia: gia,
                                                                                            anh: anh

                                                                                        },
                                                                                        success: function (response) {
                                                                                            if (response.status == false) {
                                                                                                $("#giohang").find("span").addClass(".circle-giohang");
                                                                                                $("#giohang").find("span").html("<i>" + response.soluong + "</i>");
                                                                                                
                                                                                                $('#kiemtrasl').text("Số lượng sản phẩm tồn kho chỉ còn: " + response.quantity + " sản phẩm. Bạn vui lòng kiểm tra lại giỏ hàng.");
                                                                                            }
                                                                                            else if (response.status == true) {
                                                                                                $("#giohang").find("span").addClass(".circle-giohang");
                                                                                                $("#giohang").find("span").html("<i>" + response.soluong + "</i>");
                                                                                                var quantity = $(".quantity").val(1);
                                                                                                toastr.success('thêm giỏ hàng thành công', 'Success!', {
                                                                                                    closeButton: true,
                                                                                                    tapToDismiss: false
                                                                                                });
                                                                                            } else {
                                                                                                toastr.error('thêm thất bại!', 'Error!', {
                                                                                                    closeButton: true,
                                                                                                    tapToDismiss: false
                                                                                                });
                                                                                            }

                                                                                        }

                                                                                    })
                                                                                }





                                                                            })
                                                                            function ValidateScreening() {
                                                                                var check = true;
                                                                                var checkbox = document.getElementsByName("option-0");
                                                                                for (var i = 0; i < checkbox.length; i++) {
                                                                                    if (checkbox[i].checked === true) {
                                                                                        var maMau = checkbox[i].value;
                                                                                    }
                                                                                }

                                                                                var checkbox1 = document.getElementsByName("option-1");
                                                                                for (var i = 0; i < checkbox1.length; i++) {
                                                                                    if (checkbox1[i].checked === true) {
                                                                                        var maSize = checkbox1[i].value;
                                                                                    }
                                                                                }

                                                                                if (maMau == null) {
                                                                                    $('#chonmau ul li').parent().next().html('bạn chưa chọn mau!');
                                                                                    check = false;
                                                                                } else {
                                                                                    $('#chonmau ul li').parent().next().html('');
                                                                                }
                                                                                if (maSize == null) {
                                                                                    $('#size div div').parent().next().html('bạn chưa chọn size!');
                                                                                    check = false;
                                                                                } else {
                                                                                    $('#size div div').parent().next().html('');
                                                                                }




                                                                                return check;
                                                                            }
                                                                        })
        </script>
        <script>




            function chaneImages(idchitietsp, gia, giamgia) {
                $("#idchitiet").val(idchitietsp);
                var format2 = new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                })



                Number.prototype.format = function (n, x) {
                    var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\.' : '$') + ')';
                    return this.toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&.');
                };
                if (giamgia != null) {

                    var giagoc = format2.format(gia);
                    $("#gia").text(giagoc);
                    var giaKm = gia - ((gia / 100) * giamgia);
                    var giakhuyen = giaKm.format();
                    $("#giakhuyenmai").text(giakhuyen + " đ");
                } else {
                    var giagoc = gia.format();
                    $("#giakhuyenmai").text(giagoc + " đ");
                }


            }

        </script>


    </body>
</html>