<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <jsp:include page="../linkcss.jsp"></jsp:include>
        <script src="<c:url value="/resources/ckeditor/ckeditor.js"/>"></script>
        <link rel="stylesheet" href="<c:url value="/resources/frontend/css/toastr.min.css"/>">
        <style>
            a:hover{text-decoration: none}
        </style>
    </head>
    <body>
        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <jsp:include page="../header.jsp"></jsp:include>
                <!-- partial -->
                <div class="container-fluid page-body-wrapper">
                    <!-- partial:partials/_settings-panel.html -->
                <jsp:include page="../head.jsp"></jsp:include>
                    <!-- partial -->
                    <!-- partial:partials/_sidebar.html -->
                <jsp:include page="../menu.jsp"></jsp:include>
                    <!-- partial -->
                    <div class="main-panel">
                        <div class="content-wrapper">
                            <div class="row">
                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Sản Phẩm</h4>
                                            <p class="card-description">
                                            </p>
                                            <a style="display: inline" class="nav-link" href="${pageContext.request.contextPath}/admin/sanpham/insertSanPham">
                                            <button type="button" class="btn btn-success btn-icon-text">
                                                <i class="ti- btn-icon-prepend"></i> 

                                                Thêm sản phẩm
                                            </button></a>
                                        <div class="table-responsive pt-3">
                                            <table id="sanphamtables" class="table table-bordered table-striped" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>
                                                            STT
                                                        </th>
                                                        <th>
                                                            Mã Sản Phẩm
                                                        </th>
                                                        <th>
                                                            Tên sản phẩm
                                                        </th>
                                                        <th>
                                                            Danh mục
                                                        </th>
                                                        <th>
                                                            Nhãn hàng
                                                        </th>
                                                        <th>
                                                            MoTa
                                                        </th>
                                                        <th>
                                                            Actions
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% int i = 1;  %>
                                                    <c:forEach var="s" items="${sanPhams}">
                                                        <tr>
                                                            <td>
                                                                <% out.println(i);
                                                                    i++;%>
                                                            </td>
                                                            <td class="maSanPham" data-maSanPham="${s.maSanPham}">${s.maSanPham}</td>
                                                            <td>${s.tenSanPham}</td>
                                                            <td>${s.maDanhMuc.tenDanhMuc}</td>
                                                            <td>${s.maNhanHang.tenNhanHang}</td>
                                                            <td><a class="mota"  ><button type="button" data-toggle="modal" data-target="#themchitietspModal" data-idchitiet="${s.moTa}" class="btn btn-warning btn-icon editsp">
                                                                        mô tả
                                                                    </button></a></td>
                                                            <td>
                                                                <a href="${pageContext.request.contextPath}/admin/chitietsanpham/listChiTietSanPham?maSanPham=${s.maSanPham}"  >
                                                                    <button type="button" class="btn btn-success  btn-icon">
                                                                        <i class="ti-arrow-circle-right"></i>
                                                                    </button>
                                                                </a>
                                                                <a>
                                                                    <a class="sua"  ><button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-icon editsp">
                                                                            <i class="ti-save"></i>
                                                                        </button></a>
                                                                    <button type="button" class="btn btn-danger  btn-icon delete" onclick="return confirm('Ban chac chan muon xoa?')">
                                                                        <i class="ti-trash"></i>
                                                                    </button>
                                                            </td>

                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- content-wrapper ends -->
                        <!-- partial:../../partials/_footer.html -->
                        <div>

                            <div class="modal fade" tabindex="-1" role="dialog" id="myModal">
                                <div class="modal-dialog modal-xl mt-5">
                                    <div class="modal-content" id="SanPham">

                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <div class="modal fade" tabindex="-1" role="dialog" id="themchitietspModal">

                                <div class="modal-dialog modal-xl mt-5">

                                    <div class="modal-dialog modal-xl mt-5">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Sửa sản phẩm</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            </div>
                                            <div class="modal-body pb-0" id="moTa"></div>

                                        </div>
                                    </div>
                                    <!-- /.modal-content -->

                                    <!-- /.modal-dialog -->
                                </div>
                            </div>

                        </div>
                        <footer class="footer">
                            <div class="d-sm-flex justify-content-center justify-content-sm-between">
                                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted &amp; made with <i class="ti-heart text-danger ml-1"></i></span>
                            </div>
                        </footer>
                        <!-- partial -->

                        <!-- main-panel ends -->
                    </div>
                    <!-- page-body-wrapper ends -->
                </div>
                <jsp:include page="../footer.jsp"></jsp:include>
                <script type="text/javascript" src="<c:url value="/resources/frontend/js/toastr.min.js"/>"></script>
                <script>
                    $(".delete").on("click", function () {
                        var maSanPham = $(this).closest("tr").find(".maSanPham").attr("data-maSanPham");
                        $.ajax({
                            url: "${pageContext.request.contextPath}/admin/sanpham/delete",
                            type: "GET",
                            data: {
                                maSanPham: maSanPham

                            },
                            success: function (value) {

                                if (!value) {

                                    toastr.error('xóa thất bại do sản phẩm đã được tham chiếu!', 'Error!', {
                                        closeButton: true,
                                        tapToDismiss: false
                                    });
                                } else {
                                    toastr.success('xóa thành công', 'Success!', {
                                        closeButton: true,
                                        tapToDismiss: false
                                    });
                                    location.reload();
                                }

                            }

                        })
                    });
                    $(".editsp").on("click", function () {
                        var idchitiet = $(this).data("idchitiet");
                        $("#moTa").html(idchitiet);
                    })
                    $(document).ready(function () {

                        $(".sua").click(function () {


                            var maSanPham = $(this).closest("tr").find(".maSanPham").attr("data-maSanPham");
                            $.ajax({
                                url: "${pageContext.request.contextPath}/admin/sanpham/SuaSanPham",
                                type: "GET",
                                data: {
                                    maSanPham: maSanPham

                                },
                                success: function (value) {

                                    $("#SanPham").html(value);
                                }

                            })
                        })
                        $('#sanphamtables').dataTable({
                            "pagingType": "full_numbers",
                            "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]],
                        });
                    });
                    function validate() {
                        var check = true;
                        var tenSanPham = $('#tenSanPham').val();
                        var maDanhMuc = $('#maDanhMuc').val();
                        var maNhanHang = $('#maNhanHang').val();
                        var ten = $('#ten').val();
                        if (tenSanPham === '') {
                            $('#tenSanPham').parent().next().html('tên SanPham được để trống!');
                            check = false;
                        } else if (ten != '') {
                            if (checkname(tenSanPham) && tenSanPham != ten) {
                                $('#tenSanPham').parent().next().html('tên Sản Phẩm đã tồn tại!');
                                check = false;
                            } else {
                                $('#tenSanPham').parent().next().html('');
                                check = true;
                            }
                        }
                        else if (ten != '') {
                            if (checkname(tenSanPham)) {
                                $('#tenSanPham').parent().next().html('tên Sản Phẩm đã tồn tại!');
                                check = false;
                            }
                        } else {
                            $('#tenSanPham').parent().next().html('');
                            check = true;
                        }


                        if (maDanhMuc == 0) {
                            $('#maDanhMuc').parent().next().html('bạn chưa chọn Danh Mục!');
                            check = false;
                        } else {
                            $('#maDanhMuc').parent().next().html('');
                            check = true;
                        }
                        if (maNhanHang == 0) {
                            $('#maNhanHang').parent().next().html('bạn chưa chọn Nhãn Hàng!');
                            check = false;
                        } else {
                            $('#maNhanHang').parent().next().html('');
                            check = true;
                        }

                        if (tenSanPham === '') {
                            $('#tenSanPham').parent().next().html('tên SanPham được để trống!');
                            check = false;
                        } else if (ten != '') {
                            if (checkname(tenSanPham) && tenSanPham != ten) {
                                $('#tenSanPham').parent().next().html('tên Sản Phẩm đã tồn tại!');
                                check = false;
                            } else {
                                $('#tenSanPham').parent().next().html('');
                                check = true;
                            }
                        }
                        else if (ten != '') {
                            if (checkname(tenSanPham)) {
                                $('#tenSanPham').parent().next().html('tên Sản Phẩm đã tồn tại!');
                                check = false;
                            }
                        }
                        if (maDanhMuc == 0) {
                            $('#maDanhMuc').parent().next().html('bạn chưa chọn Danh Mục!');
                            check = false;
                        }
                        if (maNhanHang == 0) {
                            $('#maNhanHang').parent().next().html('bạn chưa chọn Nhãn Hàng!');
                            check = false;
                        }

                        return check;
                    }
                    function checkname(name) {
                        var result = false;
                        $.ajax({
                            url: '${pageContext.request.contextPath}/admin/sanpham/checkname',
                            type: 'POST',
                            data: {name: name},
                            async: false,
                            success: function (res) {
                                result = res;
                            }
                        });
                        return result;
                    }

                </script>
                </body>
                </html>