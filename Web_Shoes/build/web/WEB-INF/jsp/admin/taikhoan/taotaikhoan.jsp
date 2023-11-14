<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <jsp:include page="../linkcss.jsp"></jsp:include>
        <link rel="stylesheet" href="<c:url value="/resources/css/Select2.min.css"/>">

        <style>
            .datachon2{display: none}
            .datachon3{display: none}
            .select2-selection--multiple{height: 45px;}
            .select2-container--default .select2-selection--single .select2-selection__rendered {
                color: #444;
                line-height: 28px !important;
            }
            .btn-gradient-yellow {
                background-color: #ffae01;
            }
            .btn-fill-lg {
                display: inline-block;
                border: none;
                border-radius: 4px;
                font-weight: 500;
                color: #ffffff;
                letter-spacing: 1px;
                padding: 12px 45px;
                cursor: pointer;
                -webkit-transition: all 0.3s ease-out;
                -moz-transition: all 0.3s ease-out;
                -ms-transition: all 0.3s ease-out;
                -o-transition: all 0.3s ease-out;
                transition: all 0.3s ease-out;
            }
            .select2-container--default .select2-selection--multiple .select2-selection__choice {
                color: #ffffff;
                border: 0;
                border-radius: 3px;
                padding: 6px;
                font-size: 1rem !important;
                font-family: inherit;
                line-height: 1;
            }
            .select2-container .select2-selection--single {
                box-sizing: border-box;
                cursor: pointer;
                display: block;
                height: 54px !important;
                user-select: none;
                -webkit-user-select: none;
            }
            .select2-container--default .select2-selection--single .select2-selection__arrow b {
                border-color: #888 transparent transparent transparent;
                border-style: solid;
                border-width: 5px 4px 0 4px;
                height: 0;
                left: -23% !important;
                margin-left: -4px;
                margin-top: -2px;
                position: absolute;
                top: 100% !important;
                width: 0;
            }
            .select2-container--default.select2-container--focus .select2-selection--multiple {
                border: solid black 1px;
                outline: 0;
                height: 52px !important;
            }
            .select2-container--default .select2-selection--multiple {
                background-color: white;
                border: 1px solid #aaa;
                border-radius: 4px;
                cursor: text;
                height: 53px !important;
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
                                <div class="col-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Thêm tài Khoản Nhân Viên</h4>


                                            <form class="forms-sample" action="/Web_Shoes/admin/backendSigup" onsubmit="return myFunction()" method="POST">
                                                <div class="form-group">
                                                    <label for="exampleInputName1">Họ Tên Nhân viên</label>
                                                    <input type="text" class="form-control" hidden id="exampleInputName1" name="maNhanVien" value="0">
                                                    <input type="text" class="form-control" id="hoten" placeholder="Name" name="hoTen">
                                                </div>
                                                <div class="form-group">
                                                    <div>
                                                    <label for="exampleInputEmail3">Email address</label>
                                                    <input type="email" class="form-control" id="email" placeholder="Email" name="email">
                                                    </div>
                                                    <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                </div>
                                                <div class="form-group">
                                                    <div>
                                                    <label for="exampleInputEmail3">Địa Chỉ</label>
                                                    <input type="text" class="form-control" id="diachi"  placeholder="Địa Chỉ" name="diaChi">
                                                
                                                    </div>
                                                    <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                </div>
                                                <div class="form-group">
                                                    <div>
                                                    <label for="exampleInputEmail3">Giới tinh</label>
                                                    <input type="text" class="form-control" placeholder="gioiTinh" name="gioiTinh">
                                                </div>
                                                    <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                    </div>
                                                <div class="form-group">
                                                    <div>
                                                    <label for="exampleInputEmail3">Số Điện Thoại</label>
                                                    <input type="text" class="form-control" id="sodt" placeholder="soDT" name="soDT">
                                                
                                                </div>
                                                    <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div></div>
                                                <div class="form-group">
                                                    <div>
                                                    <label for="exampleInputEmail3">CMND</label>
                                                    <input type="text" class="form-control" id="cmnd" placeholder="CMND" name="cmnd">
                                                
                                                    </div>
                                                    <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div></div>
                                                <div class="form-group">
                                                    <div>
                                                    <label for="exampleInputEmail3">Tên Đăng Nhập</label>
                                                    <input type="text" class="form-control" id="tendn" placeholder="tenDangNhap" name="tenDangNhap">
                                                </div>
                                                    <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                    </div>
                                                <div class="form-group">
                                                    <div>
                                                    <label for="exampleInputEmail3">password</label>
                                                    <input type="password" class="form-control" id="matkhau" placeholder="password" name="matKhau">
                                                </div>
                                                    <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                    </div>
                                                <div class="form-group">
                                                    <div>
                                                    <label for="exampleInputEmail3">nhập lại mật Khẩu</label>
                                                    <input type="password" class="form-control" placeholder="Repeat password" name="nhaplaimatkhau" id="nhaplaimatkhau"/>

                                                    </div>
                                                    <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                </div>

                                                <div class="form-group">
                                                    <div>
                                                    <label>Chức Vụ</label>
                                                    
                                                            <select name="maChucVu" id="chon" class="form-control">

                                                            <c:forEach items="${chucvu}" var="m">
                                                                <option value="<fmt:formatNumber value="${m.maChucVu}"></fmt:formatNumber>">${m.tenChucVu}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                </div>
                                            </div>


                                            <button type="submit" class="btn btn-primary mr-2">Submit</button>
                                            <button class="btn btn-light">Cancel</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>   
            <!-- page-body-wrapper ends -->
        </div>
        <jsp:include page="../footer.jsp"></jsp:include>

            <script src="<c:url value="/resources/js/Select2.min.js"/>"></script>
        

        <script>
            function myFunction() {
                var check = true;

                var email = $('#email').val();
                var tenDangNhap = $('#tendn').val();
                var hoTen = $('#hoten').val();
                var soDT = $('#sodt').val();
                var diaChi = $('#diachi').val();
                var matKhau = $('#matkhau').val();
                var nhaplaimatkhau = $('#nhaplaimatkhau').val();
                var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

                if (email === '') {
                    $('#email').parent().next().html('email không được để trống!');
                    check = false;
                } else if (filter.test(email.value)) {
                    $('#email').parent().next().html('email không hợp lệ!');
                    check = false;
                } else if (checkemail(email)) {
                    $('#email').parent().next().html('email đã tồn tại!');
                    check = false;
                } else {
                    $('#email').parent().next().html('');
                    check = true;
                }
                if (tenDangNhap === '') {
                    $('#tendn').parent().next().html('tên đăng nhập không được để trống!');
                    check = false;
                } else if (checkname(tenDangNhap)) {
                    $('#tendn').parent().next().html('tên đăng nhập đã tồn tại!');
                    check = false;
                } else {
                    $('#tendn').parent().next().html('');

                    check = true;
                }
                if (hoTen === '') {
                    $('#hoTen').parent().next().html('họ tên không được để trống!');
                    check = false;
                } else {
                    $('#hoTen').parent().next().html('');

                    check = true;
                }
                if (soDT === '') {
                    $('#sodt').parent().next().html('số điện thoại không được để trống!');
                    check = false;
                } else if (checksoDT(soDT)) {
                    $('#sodt').parent().next().html('số Điện Thoại đã tồn tại!');
                    check = false;
                } else {
                    $('#sodt').parent().next().html('');

                    check = true;
                }
                if (diaChi === '') {
                    $('#diachi').parent().next().html('Đại Chi không được để trống!');
                    check = false;
                } else {
                    $('#diachi').parent().next().html('');

                    check = true;
                }
                if (matKhau === '') {
                    $('#matkhau').parent().next().html('mật khẩu không được để trống!');
                    check = false;
                } else {
                    $('#matkhau').parent().next().html('');
                    check = true;
                }
                if (nhaplaimatkhau === '') {
                    $('#nhaplaimatkhau').parent().next().html('nhập lại mật khẩu không được để trống!');
                    check = false;
                } else {
                    $('#nhaplaimatkhau').parent().next().html('');
                    check = true;
                }
                if (tenDangNhap === '') {
                    $('#tendn').parent().next().html('tên đăng nhập không được để trống!');
                    check = false;
                } else if (checkname(tenDangNhap)) {
                    $('#tendn').parent().next().html('tên đăng nhập đã tồn tại!');
                    check = false;
                }
                if (hoTen === '') {
                    $('#hoTen').parent().next().html('họ tên không được để trống!');
                    check = false;
                }
                if (soDT === '') {
                    $('#sodt').parent().next().html('số điện thoại không được để trống!');
                    check = false;
                } else if (checksoDT(soDT)) {
                    $('#sodt').parent().next().html('số Điện Thoại đã tồn tại!');
                    check = false;
                }
                if (diaChi === '') {
                    $('#diachi').parent().next().html('Đại Chi không được để trống!');
                    check = false;
                }
                if (email === '') {
                    $('#email').parent().next().html('email không được để trống!');
                    check = false;
                } else if (filter.test(email.value)) {
                    $('#email').parent().next().html('email không hợp lệ!');
                    check = false;
                } else if (checkemail(email)) {
                    $('#email').parent().next().html('email đã tồn tại!');
                    check = false;
                }
                if (matKhau === '') {
                    $('#matkhau').parent().next().html('mật khẩu không được để trống!');
                    check = false;
                }
                if (nhaplaimatkhau === '') {
                    $('#nhaplaimatkhau').parent().next().html('nhập lại mật khẩu không được để trống!');
                    check = false;
                } else if (nhaplaimatkhau != matKhau) {
                    $('#nhaplaimatkhau').parent().next().html('mật khẩu không trùng nhau');
                    check = false;
                }
                return check;

            }
            function checkname(name) {
                var result = false;
                $.ajax({
                    url: '${pageContext.request.contextPath}/admin/checkname',
                    type: 'POST',
                    data: {name: name},
                    async: false,
                    success: function (res) {
                        result = res;
                    }
                });

                return result;
            }
            function checksoDT(soDT) {
                var result = false;
                $.ajax({
                    url: '${pageContext.request.contextPath}/admin/checksoDT',
                    type: 'POST',
                    data: {soDT: soDT},
                    async: false,
                    success: function (res) {
                        result = res;
                    }
                });

                return result;
            }
            function checkemail(email) {
                var result = false;
                $.ajax({
                    url: '${pageContext.request.contextPath}/admin/checkemail',
                    type: 'POST',
                    data: {email: email},
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
