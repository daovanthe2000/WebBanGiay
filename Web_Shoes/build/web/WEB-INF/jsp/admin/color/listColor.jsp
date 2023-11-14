<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <jsp:include page="../linkcss.jsp"></jsp:include>
        <link rel="stylesheet" href="<c:url value="/resources/frontend/css/toastr.min.css"/>">
            <style>.span-color{width:25px;
                        height:25px;
                        margin-right: 20px;
                        display:inline-block;
                        color:black;
                        cursor:pointer;
                        position:relative;}
                .ps-list--color a {
                    display: inline-block;
                    width: 25px;
                    height: 25px;
                    -webkit-border-radius: 50%;
                    -moz-border-radius: 50%;
                    -ms-border-radius: 50%;
                    border-radius: 50%;

                }
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
                                <div class="col-md-6 grid-margin ">
                                    <div class="card grid-margin" style="height: 70px;text-align: center;padding:  20px">
                                        <h2>Quản Lý Màu Sắc</h2>
                                    </div>
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Thêm Mới Màu Sắc</h4>
                                            <form class="forms-sample" action="/Web_Shoes/admin/color/saveColor" method="POST" onsubmit="return validate()">
                                                <input hidden name="maMau" id="maMau" value="0"/> 
                                                <div class="form-group">
                                                    <div>
                                                        <label for="exampleInputUsername1">Màu Sắc</label>
                                                        <input type="text" class="form-control" placeholder="Tên màu ..." id="tenMau" name="tenMau"/>
                                                    </div>
                                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                                </div>
                                                <div class="form-group">
                                                    <div>
                                                        <label for="exampleInputUsername1">Mã Màu</label>
                                                        <input type="color" class="form-control"  id="hexCode" name="hexCode"/>
                                                    </div>
                                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                                </div>


                                                <button type="submit" class="btn btn-success btn-rounded btn-fw" id="save" value="Insert">Lưu</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Danh Sách Màu Sắc</h4>
                                            <div class="table-responsive">
                                                <table id="color" class="table table-striped table-bordered" cellspacing="0">
                                                    <thead>
                                                        <tr>
                                                            <th>Mã Màu</th>
                                                            <th>Tên Màu</th>
                                                            <th>Mã Màu</th>
                                                            <th>Lựa Chọn</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="ms" items="${ms}">
                                                        <tr>
                                                            <td class="mau" data-mau="${ms.maMau}">${ms.maMau}</td>
                                                            <td>${ms.tenMau}</td>
                                                            <td class="ps-list--color"><a style="background-color: ${ms.hexCode}"></a></td>
                                                            <td>
                                                                <button type="button" class="btn btn-info btn-rounded btn-fw edit" data-ma="${ms.maMau}" data-ten="${ms.tenMau}" data-hexcode="${ms.hexCode}">Sửa</button>
                                                                <button type="button" class="btn btn-info btn-rounded btn-fw delete" onclick="return confirm('Ban chac chan muon xoa?')">xóa</button>
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
        <script>
            $(".delete").on("click", function () {
                    var maMau=$(this).closest("tr").find(".mau").attr("data-mau");
                    
                    $.ajax({
                        url: "${pageContext.request.contextPath}/admin/color/delete",
                        type: "GET",
                        data: {
                            maMau:maMau

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
            $(".edit").on("click", function () {
                var ma = $(this).data("ma");
                var ten = $(this).data("ten");
                var hexcode = $(this).data("hexcode");
                $("#maMau").val(ma);
                $("#tenMau").val(ten);
                $("#hexCode").val(hexcode);

            });
            function validate() {
                var check = true;
                var name = $('#tenMau').val();
                var hexCode = $('hexCode').val();
                if (name == '') {
                    $('#tenMau').parent().next().html('Tên màu không được để trống');
                    return false;
                }
                else {
                    $('#tenMau').parent().next().html('');

                    return true;
                }
                if (hexCode == '') {
                    $('#hexCode').parent().next().html('Tên bạn chưa chọn mã màu');
                    return false;
                }
                else {
                    $('#hexCode').parent().next().html('');

                    return true;
                }
                if (name == '') {
                    $('#tenMau').parent().next().html('Tên màu không được để trống');
                    return false;
                }
                if (hexCode == '') {
                    $('#hexCode').parent().next().html('Tên bạn chưa chọn mã màu');
                    return false;
                }
                return check;
            }
            ;
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#color').dataTable({
                    "pagingType": "full_numbers",
                    "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]],
                });
            });
        </script>
    </body>
</html>
