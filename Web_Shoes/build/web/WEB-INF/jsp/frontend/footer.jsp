<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="i" uri="http://www.springframework.org/tags" %>
<div class="ps-subscribe">
    <div class="ps-container">
        <div class="row">
            <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 ">
                <h3><i class="fa fa-envelope"></i>Sign up to Newsletter</h3>
            </div>
            <div class="col-lg-5 col-md-7 col-sm-12 col-xs-12 ">
                <form class="ps-subscribe__form" action="do_action" method="post">
                    <input class="form-control" type="text" placeholder="">
                    <button>Sign up now</button>
                </form>
            </div>
            <div class="col-lg-4 col-md-5 col-sm-12 col-xs-12 ">
                <p>...and receive <span>$20</span> coupon for first shopping.</p>
            </div>
        </div>
    </div>
</div>
<div class="ps-footer bg--cover" data-background="images/background/parallax.jpg">
    <div class="ps-footer__content">
        <div class="ps-container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
                    <aside class="ps-widget--footer ps-widget--info">
                        <header><a class="ps-logo"><img src="/Web_Shoes/images/logo-white.png" alt=""></a>
                            <h3 class="ps-widget__title">Địa Chỉ Cửa Hàng</h3>
                        </header>
                        <footer>
                            <p><strong> 561 Nguyễn Đình Chiểu P.2 Q.3 </strong></p>
                            <p>Email: support@store.com</a></p>
                            <p>HCM Hotline : 0786665444</p>

                        </footer>
                    </aside>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
                    <aside class="ps-widget--footer ps-widget--info second">
                        <header>
                            <h3 class="ps-widget__title">LIÊN KẾT MẠNG XÃ HỘI</h3>
                        </header>
                        <footer>
                            <p>Facebook</p>
                            <p>Instagram</p>
                            <p>Twitter</p>
                            <p>Fax: ++323 32434 5333</p>
                        </footer>
                    </aside>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-4 col-xs-12 ">
                    <aside class="ps-widget--footer ps-widget--link">
                        <header>
                            <h3 class="ps-widget__title">VỀ CHÚNG TÔI</h3>
                        </header>
                        <footer>
                            <ul class="ps-list--link">
                                <li><a href="#">Giới thiệu</a></li>
                                <li><a href="#">Dịch vụ Spa và sửa giày</a></li>
                                <li><a href="#">Tin tức và sự kiện</a></li>
                                <li><a href="#">Tuyển dụng</a></li>
                            </ul>
                        </footer>
                    </aside>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-4 col-xs-12 ">
                    <aside class="ps-widget--footer ps-widget--link">
                        <header>
                            <h3 class="ps-widget__title">HỖ TRỢ KHÁCH HÀNG</h3>
                        </header>
                        <footer>
                            <ul class="ps-list--line">
                                <li><a href="#">Hướng dẫn mua hàng</a></li>
                                <li><a href="#">Chính sách đổi trả và bảo hành</a></li>
                                <li><a href="#">Chính Sách Thanh Toán</a></li>
                                <li><a href="#">Điều khoản trang web</a></li>

                            </ul>
                        </footer>
                    </aside>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-4 col-xs-12 ">
                    <aside class="ps-widget--footer ps-widget--link">
                        <header>
                            <h3 class="ps-widget__title">Products</h3>
                        </header>
                        <footer>
                            <ul class="ps-list--line">

                                <c:forEach var="s" items="${danhmuc}">
                                    <li><a href="/Web_Shoes/DanhMuc?maDanhMuc=${s.maDanhMuc}">${s.tenDanhMuc}</a></li>
                                    </c:forEach>

                            </ul>
                        </footer>
                    </aside>
                </div>
            </div>
        </div>
    </div>
    <div class="ps-footer__copyright">
        <div class="ps-container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                    <p>&copy; <a href="#">SKYTHEMES</a>, Inc. All rights Resevered. Design by <a href="#"> Alena Studio</a>
                    </p>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                    <ul class="ps-social">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>