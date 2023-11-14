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

                .container {
                    display: block;
                    position: relative;
                    padding-left: 35px;
                    margin-bottom: 12px;
                    cursor: pointer;
                    font-size: 22px;
                    -webkit-user-select: none;
                    -moz-user-select: none;
                    -ms-user-select: none;
                    user-select: none;
                }

                /* Hide the browser's default checkbox */
                .container input {
                    position: absolute;
                    opacity: 0;
                    cursor: pointer;
                    height: 0;
                    width: 0;
                }

                /* Create a custom checkbox */
                .checkmark {
                    position: absolute;
                    top: 0;
                    left: 0;
                    height: 20px;
                    width: 20px;
                    border: solid 1px #8d8d8d;
                }
                /* On mouse-over, add a grey background color */
                .container:hover input ~ .checkmark {
                    background-color: #2AC37D;
                    border-color: #2AC37D;


                }

                /* When the checkbox is checked, add a blue background */
                .container input:checked ~ .checkmark {
                    background-color: #2AC37D;
                    border-color: #2AC37D;
                }

                /* Create the checkmark/indicator (hidden when not checked) */
                .checkmark:after {
                    content: "";
                    position: absolute;
                    display: none;
                }

                /* Show the checkmark when checked */
                .container input:checked ~ .checkmark:after {
                    display: block;
                }

                /* Style the checkmark/indicator */
                .container .checkmark:after {
                    left: 7px;
                    top: 5px;
                    width: 5px;
                    height: 10px;
                    border: solid white;
                    border-width: 0 3px 3px 0;
                    -webkit-transform: rotate(45deg);
                    -ms-transform: rotate(45deg);
                    transform: rotate(45deg);
                }
                .container .checkmark:before {
                    left: 7px;
                    top: 5px;
                    width: 5px;
                    height: 10px;
                    border: solid white;
                    border-width: 0 3px 3px 0;
                    -webkit-transform: rotate(45deg);
                    -ms-transform: rotate(45deg);
                    transform: rotate(45deg);
                    display: inline-block;
                    position: absolute;
                    content: '';

                }

                .ps-widget__content ul li label a{

                    display: block;

                    font-size: 14px;
                    color: #313131;
                }


                /* Create the checkmark/indicator (hidden when not checked) */


                /* Show the checkmark when checked */
                .tenmau input:checked ~ label .mauden:after {
                    display: block;
                }
                .tenmau input:checked ~ label .maukhac:after {
                    display: block;
                }
                .maukhac:after {
                    content: "";
                    position: relative;
                    display: none;
                }
                .mauden:after {
                    content: "";
                    position: relative;
                    display: none;
                }
                /* Style the checkmark/indicator */
                .tenmau .maukhac:after {
                    left: 10px;
                    top: 5px;
                    width: 5px;
                    height: 10px;
                    border: solid white;
                    border-width: 0 3px 3px 0;
                    -webkit-transform: rotate(45deg);
                    -ms-transform: rotate(45deg);
                    transform: rotate(45deg);
                }
                .tenmau .mauden:after {
                    left: 10px;
                    top: 5px;
                    width: 5px;
                    height: 10px;
                    border: solid black;
                    border-width: 0 3px 3px 0;
                    -webkit-transform: rotate(45deg);
                    -ms-transform: rotate(45deg);
                    transform: rotate(45deg);
                }

                .sizech li {
                    display: inline-block;
                    margin-right: 17px;
                    margin-bottom: 20px;
                }
                .sizech li label{
                    width: 40px;

                    border: solid 2px #e5e5e5;
                    height: 30px;

                    text-align: center;
                }
                .sizech li label span{
                    position: relative;
                    top: 3px;
                }

                .sizech .chonsi input:checked ~ .masize {
                    background-color: #2AC37D;
                    border-color: #2AC37D;
                    color: white;
                }
                .sizech .chonsi:hover input ~ .masize {
                    background-color: #2AC37D;
                    border-color: #2AC37D;
                    color: white;
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
            <main class="ps-main" >
                <div  class="ps-products-wrap pt-80 pb-80" >
                    <div  id="phantrang" class="ps-products" data-mh="product-listing">
                        <div class="ps-product-action">
                            <div class="ps-product__filter">
                                <select id="loaiSapXep" class="ps-select selectpicker">
                                    <option value="0">mặc định</option>
                                    <option value="1">tên giảm dần</option>
                                    <option value="2">tên tăng dần</option>
                                    <option value="3">giá tăng</option>
                                    <option value="4">giá giảm</option>
                                </select>
                            </div>
                        </div>
                        <div  id="filterproduct">
                            <div class="ps-product__columns">
                            <c:forEach var="s" items="${sanpham}">
                                <c:if test="${s.check()!=null}">
                                    <div class="ps-product__column">
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
                                                    <p class="ps-shoe__categories"><a href="#"> ${s.maDanhMuc.tenDanhMuc}</a></p>

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
                                </c:if>
                            </c:forEach>

                        </div>
                        <c:if test="${num>1}">
                            <div class="ps-product-action">

                                <div class="ps-pagination" id="paginationa">
                                    <ul class="pagination" id="pagination">

                                        <c:if test="${page>1}">
                                            <li><a class="${page-1}"><i class="fa fa-angle-left"></i></a></li>
                                                </c:if>
                                                <c:forEach begin="1" end="${num}" var="i">
                                            <li class="${page==i?"active":""}"><a class="${i}">${i}</a></li>
                                            </c:forEach>
                                            <c:if test="${page<num}">
                                            <li><a class="${page+1}"><i class="fa fa-angle-right"></i></a></li>
                                                </c:if>

                                    </ul>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="ps-sidebar" data-mh="product-listing">
                    <aside class="ps-widget--sidebar ps-widget--category">
                        <div class="ps-widget__header">
                            <h3>Category</h3>
                        </div>
                        <div class="ps-widget__content">
                            <ul>
                                <c:forEach var="d" items="${danhmuc}">
                                    <c:if test="${dm!=null}">
                                        <c:if test="${dm.maDanhMuc==d.maDanhMuc}">
                                            <input type="text" hidden id="danhmuc" value="${d.maDanhMuc}"/>
                                            <li><label class="container"><a>${d.tenDanhMuc}</a>
                                                    <input type="checkbox" checked class="danhmuc" name="option-0" value="${d.maDanhMuc}"/>
                                                    <span class="checkmark"></span>
                                                </label></li>
                                            </c:if>
                                            <c:if test="${dm.maDanhMuc!=d.maDanhMuc}">
                                            <li><label class="container"><a>${d.tenDanhMuc}</a>
                                                    <input type="checkbox" class="danhmuc" name="option-0" value="${d.maDanhMuc}"/>
                                                    <span class="checkmark"></span>
                                                </label></li>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${dm==null}">
                                        <li><label class="container"><a>${d.tenDanhMuc}</a>
                                                <input type="checkbox" class="danhmuc" name="option-0" value="${d.maDanhMuc}"/>
                                                <span class="checkmark"></span>
                                            </label></li>
                                        </c:if>
                                    </c:forEach>
                            </ul>
                        </div>
                    </aside>
                    <aside class="ps-widget--sidebar ps-widget--filter">
                        <div class="ps-widget__header">
                            <h3>Category</h3>
                        </div>
                        <div class="ps-widget__content">
                            <div class="ac-slider" data-default-min="1" data-default-max="10000000" data-max="10000000" data-step="1" data-unit="đ"></div>
                            <p class="ac-slider__meta">Price:<span class="ac-slider__value ac-slider__min"></span>-<span class="ac-slider__value ac-slider__max"></span></p><button class="ac-slider__filter ps-btn" id="filtergia">Filter</button>
                        </div>
                    </aside>
                    <aside class="ps-widget--sidebar ps-widget--category">
                        <div class="ps-widget__header">
                            <h3>Sky Brand</h3>
                        </div>
                        <div class="ps-widget__content">
                            <ul>
                                <c:forEach items="${nhan}" var="nhan">
                                    <li><label class="container"><a>${nhan.tenNhanHang}</a>
                                            <input type="checkbox"  name="option-1" class="nhanhang" value="${nhan.maNhanHang}"/>
                                            <span class="checkmark"></span>
                                        </label></li>
                                    </c:forEach>

                            </ul>
                        </div>
                    </aside>

                    <div class="ps-sticky desktop">
                        <aside class="ps-widget--sidebar">
                            <div class="ps-widget__header">
                                <h3>Size</h3>
                            </div>
                            <div class="ps-widget__content">
                                <ul class="sizech">
                                    <c:forEach items="${size}" var="size">

                                        <li class="chonsi">

                                            <input id="${size.size}" type="checkbox" name="option-2" hidden class="size" value="${size.maSize}">

                                            <label for="${size.size}"  class="masize"><span>${size.size}</span></label></li>



                                    </c:forEach>

                                </ul>
                            </div>
                        </aside>
                        <aside class="ps-widget--sidebar">
                            <div class="ps-widget__header">
                                <h3>Color</h3>
                            </div>
                            <div class="ps-widget__content">
                                <ul class="ps-list--color">
                                    <c:forEach items="${mau}" var="mau">
                                        <c:if test="${mau.tenMau=='trắng'}">
                                            <li class="tenmau">

                                                <input id="${mau.maMau}" type="checkbox" name="option-3" hidden class="mau" id="den" value="${mau.maMau}">

                                                <label for="${mau.maMau}"><a class="mauden" style="background-color: ${mau.hexCode} !important;border: solid 1px #e5e5e5;"></a><span>${mau.tenMau}</span></label></li>

                                        </c:if>
                                        <c:if test="${mau.tenMau!='trắng'}">
                                            <li class="tenmau">

                                                <input id="${mau.maMau}" type="checkbox"  name="option-3" hidden class="mau mamau" value="${mau.maMau}">

                                                <label for="${mau.maMau}"><a class="maukhac" style="background-color: ${mau.hexCode} !important;border: solid 1px #e5e5e5;"></a><span>${mau.tenMau}</span></label></li>

                                        </c:if>


                                    </c:forEach>

                                </ul>
                            </div>
                        </aside>
                    </div>

                </div>
            </div>
            <jsp:include page="footer.jsp"></jsp:include>
            </main>
            <!-- JS Library-->
        <jsp:include page="script.jsp"></jsp:include>
        
            <script>

                function chaneImage(sanpham, href, imgSrc) {
                    var pic = document.getElementById('#pic' + sanpham);
                    var link = document.getElementById('link' + sanpham);
                    pic.img = imgSrc;
                    link.href = href;
                }



            </script>
            <script>

let pages = $(".active a").attr('class');
                        let nhanhangs = [];
                        let danhmucs = [];
                        let sizes = [];
                        let maus = [];
                        let danh = $("#danhmuc").val();
                        let loaiSapXep = 0;
                        let giamin = 1;
                        let giamax = 0;
                        if (danh != null){
                danhmucs.push(danh); }
                $(".nhanhang").click(function() {
                     
               nhanhangs = [];
                        const mang = document.getElementsByClassName("nhanhang");
                        for (const x of mang) {
                if (x.checked) {
                nhanhangs.push(x.value);
                }
                }
                    var giamin1 = $('.ac-slider__min').text();
                    var giamin2 = giamin1.replaceAll("đ", "");
                    var gia = giamin2.replaceAll(" ", "");
                    giamin = gia;
                    var giamax1 = $('.ac-slider__max').text();
                    var giamax2 = giamax1.replaceAll("đ", "");
                    var giamax3 = giamax2.replaceAll(" ", "");
                    giamax = giamax3;
                timKiem();
                });
                        $(".danhmuc").click(function() {
                danhmucs = [];
                        const mang = document.getElementsByClassName("danhmuc");
                        for (const x of mang) {
                if (x.checked) {
                danhmucs.push(x.value);
                }
                }
                    var giamin1 = $('.ac-slider__min').text();
                    var giamin2 = giamin1.replaceAll("đ", "");
                    var gia = giamin2.replaceAll(" ", "");
                    giamin = gia;
                    var giamax1 = $('.ac-slider__max').text();
                    var giamax2 = giamax1.replaceAll("đ", "");
                    var giamax3 = giamax2.replaceAll(" ", "");
                    giamax = giamax3;
                        timKiem();
                });
                        $(".mau").click(function() {
                maus = [];
                        const mang = document.getElementsByClassName("mau");
                        for (const x of mang) {
                if (x.checked) {
                maus.push(x.value);
                }
                }
                    var giamin1 = $('.ac-slider__min').text();
                    var giamin2 = giamin1.replaceAll("đ", "");
                    var gia = giamin2.replaceAll(" ", "");
                    giamin = gia;
                    var giamax1 = $('.ac-slider__max').text();
                    var giamax2 = giamax1.replaceAll("đ", "");
                    var giamax3 = giamax2.replaceAll(" ", "");
                    giamax = giamax3;
                timKiem();
                });
                 $(".size").click(function() {
                sizes = [];
                        const mang = document.getElementsByClassName("size");
                        for (const x of mang) {
                if (x.checked) {
                sizes.push(x.value);
                }
                }
                    var giamin1 = $('.ac-slider__min').text();
                    var giamin2 = giamin1.replaceAll("đ", "");
                    var gia = giamin2.replaceAll(" ", "");
                    giamin = gia;
                    var giamax1 = $('.ac-slider__max').text();
                    var giamax2 = giamax1.replaceAll("đ", "");
                    var giamax3 = giamax2.replaceAll(" ", "");
                    giamax = giamax3;
                timKiem();
                });
                        $('#loaiSapXep').on('change', function() {

                loaiSapXep = this.value;
                        timKiem();
                });
                        $("#filtergia").click(function() {
                var giamin1 = $('.ac-slider__min').text();
                        var giamin2 = giamin1.replaceAll("đ", "");
                        var gia = giamin2.replaceAll(" ", "");
                        giamin = gia;
                        var giamax1 = $('.ac-slider__max').text();
                        var giamax2 = giamax1.replaceAll("đ", "");
                        var giamax3 = giamax2.replaceAll(" ", "");
                        giamax = giamax3;
                        timKiem();
                });
                        $("#pagination li").on('click', 'a', function () {
                pages = $(this).attr('class');
                        timKiem();
                });
                        function timKiem() {
                           
                                const dataTimKiem = { nhanhangs, danhmucs, maus, sizes, pages, giamin, giamax, loaiSapXep};
                                const query = jQuery.param(dataTimKiem).replaceAll("%5B%5D", "");
                                const url = "${pageContext.request.contextPath}/producta?" + query;                               
                                                                                       
                                                                                        $.get(url, function(data) {

                                $("#filterproduct").html(data) 
                            });

                                                                                   
                        }

                
        </script>


    </body>
</html>