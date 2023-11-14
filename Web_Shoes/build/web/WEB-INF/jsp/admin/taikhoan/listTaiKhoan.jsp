<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>

        <!-- Required meta tags -->
        <jsp:include page="../linkcss.jsp"></jsp:include>
        <link rel="stylesheet" href="<c:url value="/resources/frontend/css/toastr.min.css"/>">
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
                                            <h4 class="card-title">Tài Khản Nhân Viên</h4>
                                            <a href="/Web_Shoes/admin/taotaikhoan"><button type="button" class="btn btn-success btn-icon-text">
                                                    <i class="ti- btn-icon-prepend"></i> 

                                                    Thêm Tài Khoản
                                                </button></a>
                                            <div class="table-responsive">
                                                <table id="khuyenmai" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                Mã
                                                            </th>
                                                            <th>
                                                                Họ Tên
                                                            </th>
                                                            <th>
                                                                Địa Chỉ
                                                            </th>
                                                            <th>
                                                                Giới Tính
                                                            </th>
                                                            <th>
                                                                CMND
                                                            </th>
 <th>
                                                                Chức Vụ
                                                            </th>
                                                            <th>
                                                                Số Điện Thoại
                                                            </th>
                                                            <th>
                                                                Emai
                                                            </th>
                                                            <th>
                                                                Trạng Thái
                                                            </th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                    <c:forEach var="c" items="${bn}">
                                                        <tr>
                                                            <td class="nhanvien" data-ma="${c.maNhanVien}">${c.maNhanVien}</td>
                                                            <td>${c.hoTen}</td>

                                                            <td>${c.diaChi}</td>
                                                            <td>${c.gioiTinh}</td>
                                                            <td>${c.cmnd}</td>
                                                            <td>${c.maChucVu.tenChucVu}</td>
                                                            <td>${c.soDT}</td>
                                                            <td>${c.email}</td>
                                                            <td><c:if test="${c.status}">
                                                                    <button type="button" class="btn btn-primary  btn-icon huydon" style="width: 90px">
                                                                        <input type="text" hidden value="false" class="huy11"/>
                                                                        hoạt động
                                                                    </button>
                                                                </c:if>
                                                                <c:if test="${c.status == false}">
                                                                    <button type="button" class="btn btn-danger  btn-icon huydon" style="width: 90px;">
                                                                        <input type="text" hidden value="true" class="huy11"/>
                                                                        khóa
                                                                    </button>
                                                                </c:if></td>

                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- content-wrapper ends -->
                    <!-- partial:../../partials/_footer.html -->
                    <footer class="footer">
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">

                            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted &amp; made with <i class="ti-heart text-danger ml-1"></i></span>
                        </div>
                    </footer>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>   
            <!-- page-body-wrapper ends -->
        </div>
        <jsp:include page="../footer.jsp"></jsp:include>
        <script type="text/javascript" src="<c:url value="/resources/frontend/js/toastr.min.js"/>"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#khuyenmai').dataTable({
                    "n": "full_numbers",
                    "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]],
                });
                $(".huydon").click(function () {

                    var maNhanVien = $(this).closest("tr").find(".nhanvien").attr("data-ma");
                    var status = $(".huy11").val();

                    $.ajax({
                        url: "${pageContext.request.contextPath}/admin/taikhoan/updatetintrang",
                        type: "GET",
                        data: {
                            maNhanVien: maNhanVien,
                            status: status


                        },
                        success: function (value) {

                            if (value==true) {

                                toastr.success('update trang thái thành công', 'Success!', {
                                    closeButton: true,
                                    tapToDismiss: false
                                });
                                 location.reload();
                            } else {
                                toastr.error('tài khoản này đang ở Chức Vụ quản lý không thể khóa tài khoản!', 'Error!', {
                                    closeButton: true,
                                    tapToDismiss: false
                                });
                            }
                           
                        }

                    })
                })

            });

        </script>
    </body>
</html>
