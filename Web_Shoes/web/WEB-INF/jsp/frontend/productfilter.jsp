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

                /* Hide the browser's default radio */
                .container input {
                    position: absolute;
                    opacity: 0;
                    cursor: pointer;
                    height: 0;
                    width: 0;
                }

                /* Create a custom radio */
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

                /* When the radio is checked, add a blue background */
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

            <div class="ps-product__columns">
            <c:if test="${sanpham.isEmpty()}"><h3>không có sản phẩm nào</h3></c:if>
            <c:if test="${!sanpham.isEmpty()}">
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
                                        <img id="picc${s.maSanPham}" src="<i:url value='/images/${p.anhChinh}'/>" alt="" height="330px" >
                                        <a class="ps-shoe__overlay" id="linkc${s.maSanPham}" href="/Web_Shoes/SanPhamDetail?maSanPham=${s.maSanPham}&maDanhMuc=${s.maDanhMuc.maDanhMuc}&maMau=${p.maMau.maMau}">
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
            </c:if>

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
        <script>

                    function chaneImage(sanpham, href, imgSrc) {
                    var pic = document.getElementById('#pic' + sanpham);
                            var link = document.getElementById('link' + sanpham);
                            pic.img = imgSrc;
                            link.href = href;
                    }



        </script>
        <script>

            let page = $(".active a").attr('class');
                    let pages = 1;
                    if (page == null){
            pages = 1;
            } else{
            pages = page;
            }
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

            $("#pagination li").on('click', 'a', function () {
            nhanhangs = [];
                    const mang = document.getElementsByClassName("nhanhang");
                    for (const x of mang) {
            if (x.checked) {
            nhanhangs.push(x.value);
            }
            }
            danhmucs = [];
                    const mang1 = document.getElementsByClassName("danhmuc");
                    for (const x of mang1) {
            if (x.checked) {
            danhmucs.push(x.value);
            }
            }
            maus = [];
                    const mang2 = document.getElementsByClassName("mau");
                    for (const x of mang2) {
            if (x.checked) {
            maus.push(x.value);
            }
            }
            sizes = [];
                    const mang3 = document.getElementsByClassName("size");
                    for (const x of mang3) {
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
                    loaiSapXep = $("#loaiSapXep").val();
                    pages = $(this).attr('class');
                    const dataTimKiem = { nhanhangs, danhmucs, maus, sizes, pages, giamin, giamax, loaiSapXep};
                    const query = jQuery.param(dataTimKiem).replaceAll("%5B%5D", "");
                    const url = "${pageContext.request.contextPath}/producta?" + query;
                    $.get(url, function(data) {

                    $("#filterproduct").html(data)
                    });
            });


        </script>




