<%-- 
    Document   : Login
    Created on : Jun 8, 2017, 1:46:39 PM
    Author     : TuyenMap
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <title>Login Page - Ace Admin</title>

        <meta name="description" content="User login page" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />


        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"  />">

        <!-- text fonts -->
        <link rel="stylesheet" href="<c:url value="/resources/fonts.googleapis.com.css"  />">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/resources/css/sweetalert.css" />" type="text/css">
        <!-- ace styles -->
        <link rel="stylesheet" href="<c:url value="/resources/css/ace.min.css" />" />
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"  />" type="text/css">
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


        <script>

            function validate() {
                var check = true;


                var tenDangNhap = $('#tenDangNhap').val();
                var matKhau = $('#matKhau').val();


                if (tenDangNhap === '') {
                    $('#tenDangNhap').parent().next().html('tên đăng nhập không được để trống!');
                    check = false;
                } else {
                    $('#tenDangNhap').parent().next().html('');

                    check = true;
                }
                if (matKhau === '') {
                    $('#matKhau').parent().next().html('mật khẩu không được để trống!');
                    check = false;
                } else {
                    $('#matKhau').parent().next().html('');
                    check = true;
                }
                if (tenDangNhap === '') {
                    $('#tenDangNhap').parent().next().html('tên đăng nhập không được để trống!');
                    check = false;
                }
                return check;

            }

        </script>

        <script>
            function togglePassword() {
                var upass = document.getElementById('matKhau');
                var toggleBtn = document.getElementById('toggleBtn');
                if (upass.type == "password") {
                    upass.type = "text";
                    toggleBtn.value = "Hide Password Characters";
                } else {
                    upass.type = "password";
                    toggleBtn.value = "Show Password Characters";
                }
            }
        </script>

    </head>

    <body class="login-layout">
        <div class="main-container">
            <div class="main-content">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1">
                        <div class="login-container">
                            <div class="center">
                                <h1>
                                    <i class="ace-icon fa fa-leaf green"></i>
                                    <span class="red">Bach Khoa</span>
                                    <span class="white" id="id-text2">Aptech</span>
                                </h1>
                                <h4 class="blue" id="id-company-text">Quản trị website</h4>
                            </div>
                            <div class="space-6"></div>

                            <div class="position-relative">
                                <div id="login-box" class="login-box visible widget-box no-border">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <h4 class="header blue lighter bigger">
                                                <i class="ace-icon fa fa-coffee green"></i>
                                                Thông tin đăng nhập
                                            </h4>

                                            <div class="space-6"></div>

                                            <form action="/Web_Shoes/backendLogin" onsubmit="return validate()" method="POST">
                                                <fieldset>
                                                    <label class="block clearfix">
                                                        <div class="message" >
                                                            ${message}
                                                        </div>
                                                    </label>
                                                    <label class="block clearfix">
                                                        <div class="success">
                                                            ${success}
                                                        </div>
                                                    </label>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="text" class="form-control" placeholder="Tên đăng nhập" name="tenDangNhap" id="tenDangNhap" />
                                                            <i class="ace-icon fa fa-user"></i>
                                                        </span>
                                                        <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="password" class="form-control" placeholder="Mật khẩu" name="matKhau" id="matKhau" />
                                                            <i class="ace-icon fa fa-lock" id="btnPassword" onclick="togglePassword()"></i>
                                                        </span>
                                                        <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                    </label>

                                                    <div class="space"></div>

                                                    <div class="clearfix">
                                                        <label class="inline">
                                                            <input type="checkbox" class="ace" />
                                                            <span class="lbl"> Nhớ mật khẩu</span>
                                                        </label>

                                                        <button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
                                                            <i class="ace-icon fa fa-key"></i>
                                                            <span class="bigger-110">Đăng nhập</span>
                                                        </button>
                                                    </div>

                                                    <div class="space-4"></div>
                                                </fieldset>
                                            </form>

                                            <div class="social-or-login center">
                                                <span class="bigger-110">Đăng nhập với</span>
                                            </div>

                                            <div class="space-6"></div>

                                            <div class="social-login center">
                                                <a class="btn btn-primary">
                                                    <i class="ace-icon fa fa-facebook"></i>
                                                </a>

                                                <a class="btn btn-info">
                                                    <i class="ace-icon fa fa-twitter"></i>
                                                </a>

                                                <a class="btn btn-danger">
                                                    <i class="ace-icon fa fa-google-plus"></i>
                                                </a>
                                            </div>
                                        </div><!-- /.widget-main -->

                                        <div class="toolbar clearfix">
                                            <div>
                                                <a href="#" data-target="#forgot-box" class="forgot-password-link">
                                                    <i class="ace-icon fa fa-arrow-left"></i>
                                                    Quên mật khẩu
                                                </a>
                                            </div>

                                            <div>
                                                <a href="#" data-target="#signup-box" class="user-signup-link">
                                                    Đăng kí tài khoản
                                                    <i class="ace-icon fa fa-arrow-right"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div><!-- /.widget-body -->
                                </div><!-- /.login-box -->

                                <div id="forgot-box" class="forgot-box widget-box no-border">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <h4 class="header red lighter bigger">
                                                <i class="ace-icon fa fa-key"></i>
                                                Retrieve Password
                                            </h4>

                                            <div class="space-6"></div>
                                            <p>
                                                Enter your email and to receive instructions
                                            </p>

                                            <form>
                                                <fieldset>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="email" class="form-control" placeholder="Email" />
                                                            <i class="ace-icon fa fa-envelope"></i>
                                                        </span>
                                                    </label>

                                                    <div class="clearfix">
                                                        <button type="button" class="width-35 pull-right btn btn-sm btn-danger">
                                                            <i class="ace-icon fa fa-lightbulb-o"></i>
                                                            <span class="bigger-110">Send Me!</span>
                                                        </button>
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div><!-- /.widget-main -->

                                        <div class="toolbar center">
                                            <a href="#" data-target="#login-box" class="back-to-login-link">
                                                Back to login
                                                <i class="ace-icon fa fa-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div><!-- /.widget-body -->
                                </div><!-- /.forgot-box -->

                                <div id="signup-box" class="signup-box widget-box no-border">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <h4 class="header green lighter bigger">
                                                <i class="ace-icon fa fa-users blue"></i>
                                                New User Registration
                                            </h4>

                                            <div class="space-6"></div>
                                            <p> Enter your details to begin: </p>

                                            <form action="/Web_Shoes/backendSigup" onsubmit="return myFunction()" method="POST">
                                                <fieldset>
                                                    <label class="block clearfix" >
                                                        <div class="error">
                                                            ${error}
                                                        </div>
                                                    </label>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="hidden" id="a"/>
                                                        </span>
                                                        <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                    </label>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="hidden" name="maKhachHang" class="input-control type_1" id="maKhacHang" value="0"/>
                                                        </span>

                                                    </label>
                                                        <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="text" class="form-control" placeholder="Họ Tên" name="hoTen" id="hoTen" />
                                                            
                                                        </span>
                                                        <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                    </label>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="email" class="form-control" placeholder="Email" name="email" id="email" />
                                                            
                                                        </span>
                                                        <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="text" class="form-control" placeholder="Username" name="tenDangNhap" id="tenDn"/>
                                                           
                                                        </span>
                                                        <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                    </label>
                                                        <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="text" class="form-control" placeholder="soDT" name="soDT" id="soDT"/>
                                                            
                                                        </span>
                                                        <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                    </label>
                                                        <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="text" class="form-control" placeholder="Địa Chỉ" name="diaChi" id="diaChi"/>
                                                           
                                                        </span>
                                                        <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="password" class="form-control" placeholder="Password" name="matKhau" id="matK"/>
                                                           
                                                        </span>
                                                        <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="password" class="form-control" placeholder="Repeat password" name="nhaplaimatkhau" id="nhaplaimatkhau"/>
                                                            
                                                        </span>
                                                        <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                    </label>



                                                    <div class="space-24"></div>

                                                    <div class="clearfix">
                                                        <button type="reset" class="width-30 pull-left btn btn-sm">
                                                            <i class="ace-icon fa fa-refresh"></i>
                                                            <span class="bigger-110">Reset</span>
                                                        </button>

                                                        <button type="submit" class="width-65 pull-right btn btn-sm btn-success">
                                                            <span class="bigger-110">Register</span>

                                                            <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                                        </button>
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div>

                                        <div class="toolbar center">
                                            <a href="#" data-target="#login-box" class="back-to-login-link">
                                                <i class="ace-icon fa fa-arrow-left"></i>
                                                Back to login
                                            </a>
                                        </div>
                                    </div><!-- /.widget-body -->
                                </div><!-- /.signup-box -->
                            </div><!-- /.position-relative -->

                            <div class="navbar-fixed-top align-right">
                                <br />
                                &nbsp;
                                <a id="btn-login-dark" href="#">Dark</a>
                                &nbsp;
                                <span class="blue">/</span>
                                &nbsp;
                                <a id="btn-login-blur" href="#">Blur</a>
                                &nbsp;
                                <span class="blue">/</span>
                                &nbsp;
                                <a id="btn-login-light" href="#">Light</a>
                                &nbsp; &nbsp; &nbsp;
                            </div>
                        </div>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.main-content -->
        </div><!-- /.main-container -->

        <!-- basic scripts -->

        <!--[if !IE]> -->
        <script src="<c:url value="/resources/js/jquery-3.6.0.min.js" />"></script>

        <!-- <![endif]-->

        <!--[if IE]>
<script src="assets/js/jquery.1.11.1.min.js"></script>
<![endif]-->

        <!--[if !IE]> -->
        <script type="text/javascript">
                                                window.jQuery || document.write("<script src='<c:url value="/resources/js/jquery.min.js" />'>" + "<" + "/script>");
        </script>

        <!-- <![endif]-->

        <!--[if IE]>
<script type="text/javascript">
window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
        <script type="text/javascript">
            if ('ontouchstart' in document.documentElement)
                document.write("<script src='<c:url value="/resources/js/jquery.mobile.custom.min.js" />'>" + "<" + "/script>");
        </script>
        <script src="<c:url value="/resources/js/sweetalert.min.js" />" type="text/javascript"></script>
        <!-- inline scripts related to this page -->
        <script type="text/javascript">
            jQuery(function ($) {
                $(document).on('click', '.toolbar a[data-target]', function (e) {
                    e.preventDefault();
                    var target = $(this).data('target');
                    $('.widget-box.visible').removeClass('visible');//hide others
                    $(target).addClass('visible');//show target
                });
            });



            //you don't need this, just used for changing background
            jQuery(function ($) {
                $('#btn-login-dark').on('click', function (e) {
                    $('body').attr('class', 'login-layout');
                    $('#id-text2').attr('class', 'white');
                    $('#id-company-text').attr('class', 'blue');

                    e.preventDefault();
                });
                $('#btn-login-light').on('click', function (e) {
                    $('body').attr('class', 'login-layout light-login');
                    $('#id-text2').attr('class', 'grey');
                    $('#id-company-text').attr('class', 'blue');

                    e.preventDefault();
                });
                $('#btn-login-blur').on('click', function (e) {
                    $('body').attr('class', 'login-layout blur-login');
                    $('#id-text2').attr('class', 'white');
                    $('#id-company-text').attr('class', 'light-blue');

                    e.preventDefault();
                });

            });
        </script>
        <script>
            
                function myFunction() {
                    var check = true;

                    var email = $('#email').val();
                    var tenDangNhap = $('#tenDn').val();
                    var hoTen = $('#hoTen').val();
                    var soDT = $('#soDT').val();
                    var diaChi = $('#diaChi').val();
                    var matKhau = $('#matK').val();
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
                    }else {
                        $('#email').parent().next().html('');
                        check = true;
                    }
                    if (tenDangNhap === '') {
                        $('#tenDn').parent().next().html('tên đăng nhập không được để trống!');
                        check = false;
                    } else if (checkname(tenDangNhap)) {
                        $('#tenDn').parent().next().html('tên đăng nhập đã tồn tại!');
                        check = false;
                    } else {
                        $('#tenDn').parent().next().html('');

                        check = true;
                    }
                    if (hoTen === '') {
                        $('#hoTen').parent().next().html('họ tên không được để trống!');
                        check = false;
                    }  else {
                        $('#hoTen').parent().next().html('');

                        check = true;
                    }
                    if (soDT === '') {
                        $('#soDT').parent().next().html('số điện thoại không được để trống!');
                        check = false;
                    } else if (checksoDT(soDT)) {
                        $('#soDT').parent().next().html('số Điện Thoại đã tồn tại!');
                        check = false;
                    } else {
                        $('#soDT').parent().next().html('');

                        check = true;
                    }
                    if (diaChi === '') {
                        $('#diaChi').parent().next().html('Đại Chi không được để trống!');
                        check = false;
                    }  else {
                        $('#tenDn').parent().next().html('');

                        check = true;
                    }
                    if (matKhau === '') {
                        $('#matK').parent().next().html('mật khẩu không được để trống!');
                        check = false;
                    } else {
                        $('#matK').parent().next().html('');
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
                        $('#tenDn').parent().next().html('tên đăng nhập không được để trống!');
                        check = false;
                    } else if (checkname(tenDangNhap)) {
                        $('#tenDn').parent().next().html('tên đăng nhập đã tồn tại!');
                        check = false;
                    }if (hoTen === '') {
                        $('#hoTen').parent().next().html('họ tên không được để trống!');
                        check = false;
                    } if (soDT === '') {
                        $('#soDT').parent().next().html('số điện thoại không được để trống!');
                        check = false;
                    } else if (checksoDT(soDT)) {
                        $('#soDT').parent().next().html('số Điện Thoại đã tồn tại!');
                        check = false;
                    }if (diaChi === '') {
                        $('#diaChi').parent().next().html('Đại Chi không được để trống!');
                        check = false;
                    }
                    if (email === '') {
                        $('#email').parent().next().html('email không được để trống!');
                        check = false;
                    } else if (filter.test(email.value)) {
                        $('#email').parent().next().html('email không hợp lệ!');
                        check = false;
                    }else if (checkemail(email)) {
                        $('#email').parent().next().html('email đã tồn tại!');
                        check = false;
                    }
                    if (matKhau === '') {
                        $('#matK').parent().next().html('mật khẩu không được để trống!');
                        check = false;
                    }
                    if (nhaplaimatkhau === '') {
                        $('#nhaplaimatkhau').parent().next().html('nhập lại mật khẩu không được để trống!');
                        check = false;
                    } else if (nhaplaimatkhau != matKhau) {
                        $('#a').parent().next().html('mật khẩu không trùng nhau');
                        check = false;
                    }
                    return check;

                }
                function checkname(name) {
                    var result = false;
                    $.ajax({
                        url: '${pageContext.request.contextPath}/checkname',
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
                        url: '${pageContext.request.contextPath}/checksoDT',
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
                        url: '${pageContext.request.contextPath}/checkemail',
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

