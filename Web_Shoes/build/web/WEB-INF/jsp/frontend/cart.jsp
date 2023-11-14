<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="i" uri="http://www.springframework.org/tags" %>
<html lang="en">
    <head>
        <jsp:include page="linkcss.jsp"></jsp:include>
        <link rel="stylesheet" href="<c:url value="/resources/frontend/css/toastr.min.css"/>">
        <style>
            .message{
                color: red;
            }
            .error{
                color: red;
            }
            .success{
                color: #00c853;
            }
        </style>
    </head>
    <body>
        <div class="header--sidebar"></div>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="header-services">
                <div class="ps-services owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="7000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="false" data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1" data-owl-duration="1000" data-owl-mousedrag="on">
                    <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order with Sky Store</p>
                    <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order with Sky Store</p>
                    <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order with Sky Store</p>
                </div>
            </div>
            <main class="ps-main">

                <div class="ps-content pt-80 pb-80">
                <c:if test="${soluong<=0}">
                    <h1>không có sản phẩm nào trong giỏ hàng</h1>
                </c:if>
                <c:if test="${soluong>0}">
                    <div class="ps-container">
                        <div class="error" >
                            ${error}
                            <div class="invalid-feedback" id="kiemtrasl" style="display:block;color: red;"></div>
                        </div>
                        <div class="ps-cart-listing">
                            <table class="table ps-cart__table">
                                <thead>
                                    <tr>
                                        <th>All Products</th>
                                        <th>Màu Size</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="gio" items="${gioHangs}">
                                        <tr>
                                            <td class="maSanpham" data-idchitiet="${gio.idChiTietSP}"><a class="ps-product__preview" href="#"><img class="mr-15" src="<i:url value='/images/${gio.anh}'/>"  width="100px;" height="100px;" alt=""><span>${gio.tenSanPham}</span>
                                                </a></td>
                                            <td class="mau"><span >Màu: ${gio.tenMau} -</span><span> Size: ${gio.size}</span></td>
                                            <td class="giatien" data-value="${gio.giaTien}">${gio.getGiaString()}</td>
                                            <td class="soluong">
                                                <div class="form-group--number">
                                                    <button class="minus"><span>-</span></button>
                                                    <input class="soluong-giohang form-control" min="1" id="soluong${gio.idChiTietSP}" type="number" value="${gio.soluong}">
                                                    <button class="plus"><span>+</span></button>
                                                </div>
                                            </td>
                                            <td class="thanhtien" id="tong${gio.idChiTietSP}">${gio.getTinhTongtien()}</td>
                                            <td>
                                                <div class="ps-remove"></div>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                            <div class="ps-cart__actions">
                                <div class="ps-cart__promotion">

                                    <div class="form-group" style="padding-top: 85px">
                                        <a href="/Web_Shoes/"><button class="ps-btn ps-btn--gray">Tiếp Tục Mua Hàng</button></a>
                                    </div>
                                </div>

                                <div class="ps-cart__total">
                                    <h3>Total Price: <span id="tongtien">${tongtien} </span></h3><a class="ps-btn" href="checkout.html" style="width: 330px;    text-align: center;">Đặt hàng<i class="ps-icon-next"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>



            <jsp:include page="footer.jsp"></jsp:include>
            </main>
            <!-- JS Library-->
        <jsp:include page="script.jsp"></jsp:include>
        <script type="text/javascript" src="<c:url value="/resources/frontend/js/toastr.min.js"/>"></script>
        <script>

            $(document).ready(function () {


                GanTongTien();
                function GanTongTien(isEventChange) {
                    var tongtienss = 0;
                    $(".thanhtien").each(function () {
                        var format2 = new Intl.NumberFormat('vi-VN', {
                            style: 'currency',
                            currency: 'VND'
                        })

                        var giatien = $(this).text();
                        var gia1 = giatien.replaceAll(".", "");
                        var gia2 = gia1.replaceAll("₫", "");
                        var gia3 = gia2.replaceAll("đ", "");
                        var gia = gia3.replaceAll(" ", "");

                        tongtienss = tongtienss + parseFloat(gia);
                        if (!isEventChange) {
                            $(this).html(format2.format(gia))
                        }
                        Number.prototype.format = function (n, x) {
                            var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\.' : '$') + ')';
                            return this.toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&.');
                        };
                        var tong = tongtienss.format();
                        $("#tongtien").html(tong + " đ");
                    })
                }
                $(".soluong-giohang").change(function () {

                    var quantity = $(this).val();

                    var giatien = $(this).closest("tr").find(".giatien").attr("data-value");
                    Number.prototype.format = function (n, x) {
                        var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\.' : '$') + ')';
                        return this.toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&.');
                    };
                    var tongtien = giatien * quantity;
                    var tong = tongtien.format();
                    $(this).closest("tr").find(".thanhtien").html(tong + " đ");
                    GanTongTien(true);
                    var idChiTietSP = $(this).closest("tr").find(".maSanpham").attr("data-idchitiet");
                    $.ajax({
                        url: "${pageContext.request.contextPath}/Capnhapsoluong",
                        type: "GET",
                        data: {
                            idChiTietSP: idChiTietSP,
                            quantity: quantity

                        },
                        success: function (response) {


                            if (response.status == false) {
                                $("#giohang").find("span").addClass(".circle-giohang");
                                $("#giohang").find("span").html("<i>" + response.soluong + "</i>");
                                var quantity = $("#soluong" + response.chitiet).val(response.so);
                                var tongtien = $("#tong" + response.chitiet).html(response.gia);
                                $('#kiemtrasl').text("Số lượng sản phẩm tồn kho chỉ còn: " + response.quantity + " sản phẩm. Bạn vui lòng kiểm tra lại giỏ hàng.");
                            }
                            else if (response.status == true) {
                                $("#giohang").find("span").addClass(".circle-giohang");
                                $("#giohang").find("span").html("<i>" + response.soluong + "</i>");

                                $('#kiemtrasl').text('');
                                toastr.success('update giỏ hàng thành công', 'Success!', {
                                    closeButton: true,
                                    tapToDismiss: false
                                });
                            } else {
                                toastr.error('update thất bại!', 'Error!', {
                                    closeButton: true,
                                    tapToDismiss: false
                                });
                            }



                        }

                    })
                })
                $(".minus").click(function () {
                    var soluong = $(this).closest("tr").find(".soluong-giohang").val();
                    var giam = soluong - 1;
                    var giatien = $(this).closest("tr").find(".giatien").attr("data-value");
                    var idChiTietSP = $(this).closest("tr").find(".maSanpham").attr("data-idchitiet");
                    if (giam >= 1) {
                        var tongtien = giatien * giam;
                        $(this).closest("tr").find(".soluong-giohang").val(giam);
                    } else {
                        var seft = $(this);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/xoagiohang",
                            type: "GET",
                            data: {
                                idChiTietSP: idChiTietSP


                            },
                            success: function (value) {
                                if (value != 0) {
                                    seft.closest("tr").remove();
                                    GanTongTien(true);
                                    $("#giohang").find("span").addClass(".circle-giohang");
                                    $("#giohang").find("span").html("<i>" + value + "</i>");
                                } else {
                                    $('.giohang').html("<h1>không có sản phẩm nào trong giỏ hàng</h1>")
                                }

                                location.reload();
                            }

                        })
                    }

                    Number.prototype.format = function (n, x) {
                        var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\.' : '$') + ')';
                        return this.toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&.');
                    };

                    var tong = tongtien.format();
                    $(this).closest("tr").find(".thanhtien").html(tong + " đ");
                    GanTongTien(true);

                    $.ajax({
                        url: "${pageContext.request.contextPath}/Capnhapsoluonggiam",
                        type: "GET",
                        data: {
                            idChiTietSP: idChiTietSP

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
                                $('#kiemtrasl').text('');
                                toastr.success('update giỏ hàng thành công', 'Success!', {
                                    closeButton: true,
                                    tapToDismiss: false
                                });
                            } else {
                                toastr.error('update thất bại!', 'Error!', {
                                    closeButton: true,
                                    tapToDismiss: false
                                });
                            }
                        }

                    })


                })
                $(".plus").click(function () {
                    var soluong = $(this).closest("tr").find(".soluong-giohang").val();
                    var giam = parseInt(soluong) + 1;
                    $(this).closest("tr").find(".soluong-giohang").val(giam);
                    var giatien = $(this).closest("tr").find(".giatien").attr("data-value");
                    Number.prototype.format = function (n, x) {
                        var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\.' : '$') + ')';
                        return this.toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&.');
                    };
                    var tongtien = giatien * giam;
                    var tong = tongtien.format();
                    $(this).closest("tr").find(".thanhtien").html(tong + " đ");
                    GanTongTien(true);
                    var idChiTietSP = $(this).closest("tr").find(".maSanpham").attr("data-idchitiet");

                    $.ajax({
                        url: "${pageContext.request.contextPath}/Capnhapsoluongtang",
                        type: "GET",
                        data: {
                            idChiTietSP: idChiTietSP


                        },
                        success: function (response) {
                            if (response.status == false) {
                                $("#giohang").find("span").addClass(".circle-giohang");
                                $("#giohang").find("span").html("<i>" + response.soluong + "</i>");
                                var quantity = $("#soluong" + response.chitiet).val(response.so);
                                var tongtien = $("#tong" + response.chitiet).html(response.gia);
                                $('#kiemtrasl').text("Số lượng sản phẩm tồn kho chỉ còn: " + response.quantity + " sản phẩm. Bạn vui lòng kiểm tra lại giỏ hàng.");

                            }
                            else if (response.status == true) {
                                $("#giohang").find("span").addClass(".circle-giohang");
                                $("#giohang").find("span").html("<i>" + response.soluong + "</i>");

                                $('#kiemtrasl').text('');
                                toastr.success('update giỏ hàng thành công', 'Success!', {
                                    closeButton: true,
                                    tapToDismiss: false
                                });
                            } else {
                                toastr.error('update thất bại!', 'Error!', {
                                    closeButton: true,
                                    tapToDismiss: false
                                });
                            }

                        }

                    })
                })
                $(".ps-remove").click(function () {
                    var seft = $(this);
                    var idChiTietSP = $(this).closest("tr").find(".maSanpham").attr("data-idchitiet");
                    $.ajax({
                        url: "${pageContext.request.contextPath}/xoagiohang",
                        type: "GET",
                        data: {
                            idChiTietSP: idChiTietSP


                        },
                        success: function (value) {
                            if (value != 0) {
                                seft.closest("tr").remove();
                                GanTongTien(true);
                                $("#giohang").find("span").addClass(".circle-giohang");
                                $("#giohang").find("span").html("<i>" + value + "</i>");
                            } else {
                                $('.giohang').html("<h1>không có sản phẩm nào trong giỏ hàng</h1>")
                            }

                            location.reload();
                        }

                    })
                })


            })
        </script>
    </body>
</html>