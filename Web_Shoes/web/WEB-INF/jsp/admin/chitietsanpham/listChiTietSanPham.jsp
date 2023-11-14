<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="i" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <jsp:include page="../linkcss.jsp"></jsp:include>
        <link rel="stylesheet" href="<c:url value="/resources/css/Select2.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/frontend/css/toastr.min.css"/>">
        <style>
            a:hover{text-decoration: none}
            .select2-selection--multiple{height: 45px;}
            .select2-container--default .select2-selection--single .select2-selection__rendered {
                color: #444;
                line-height: 28px !important;
            }
            .select2-container{
                width: 100% !important;
            }
            .select2-container--default .select2-selection--multiple .select2-selection__choice {
                color: #ffffff;
                border: 0;
                border-radius: 3px;
                padding: 6px;
                font-size: 0.5rem !important;
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
            .file-upload{display:block;text-align:center;font-family: Helvetica, Arial, sans-serif;font-size: 12px;}
            .file-upload .file-select{display:block;border: 2px solid #dce4ec;color: #34495e;cursor:pointer;height:40px;line-height:40px;text-align:left;background:#FFFFFF;overflow:hidden;position:relative;}
            .file-upload .file-select .file-select-button{background:#dce4ec;padding:0 10px;display:inline-block;height:40px;line-height:40px;}
            .file-upload .file-select .file-select-name{line-height:40px;display:inline-block;padding:0 10px;}
            .file-upload .file-select:hover{border-color:#34495e;transition:all .2s ease-in-out;-moz-transition:all .2s ease-in-out;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;}
            .file-upload .file-select:hover .file-select-button{background:#34495e;color:#FFFFFF;transition:all .2s ease-in-out;-moz-transition:all .2s ease-in-out;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;}
            .file-upload.active .file-select{border-color:#3fa46a;transition:all .2s ease-in-out;-moz-transition:all .2s ease-in-out;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;}
            .file-upload.active .file-select .file-select-button{background:#3fa46a;color:#FFFFFF;transition:all .2s ease-in-out;-moz-transition:all .2s ease-in-out;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;}
            .file-upload .file-select input[type=file]{z-index:100;cursor:pointer;position:absolute;height:100%;width:100%;top:0;left:0;opacity:0;filter:alpha(opacity=0);}
            .file-upload .file-select.file-select-disabled{opacity:0.65;}
            .file-upload .file-select.file-select-disabled:hover{cursor:default;display:block;border: 2px solid #dce4ec;color: #34495e;cursor:pointer;height:40px;line-height:40px;margin-top:5px;text-align:left;background:#FFFFFF;overflow:hidden;position:relative;}
            .file-upload .file-select.file-select-disabled:hover .file-select-button{background:#dce4ec;color:#666666;padding:0 10px;display:inline-block;height:40px;line-height:40px;}
            .file-upload .file-select.file-select-disabled:hover .file-select-name{line-height:40px;display:inline-block;padding:0 10px;}
            #image{
                display: none;
            }
            #image1{
                display: none;
            }
            .select2-container--default .select2-search--inline .select2-search__field {
                width: 325px !important;
                padding-left: 25px;
                padding-top: 7px;
            }
            .input-group{
                display: block !important;
            }
            .input-group > .form-control{
                width: 100% !important;
            }
            .upload{
                width: 100px;
                position: relative;
                margin: auto;
            }

            .upload img{
                border-radius: 50%!important;
                border: 6px solid #eaeaea!important;
                width: 100px!important;
                height: 100px!important;
            }

            .upload .round{
                position: absolute;
                bottom: 0;
                right: 0;
                background: #00B4FF;
                width: 32px;
                height: 32px;
                line-height: 33px;
                text-align: center;
                border-radius: 50%;
                overflow: hidden;
            }

            .upload .round input[type = "file"]{
                position: absolute;
                transform: scale(2);
                opacity: 0;
            }

            input[type=file]::-webkit-file-upload-button{
                cursor: pointer;
            }

        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                                            <h4 class="card-title">Chi Tiết Sản Phẩm</h4>
                                            <p class="card-description">
                                            </p>
                                            <a class="nav-link" data-toggle="modal" data-target="#themchitietspModal">
                                                <button type="button" class="btn btn-success btn-icon-text">
                                                    <i class="ti- btn-icon-prepend"></i> 

                                                    Thêm chi tiết sản phẩm
                                                </button>
                                            </a>
                                            <div class="table-responsive pt-3">
                                                <table id="sanphamtables" class="table table-bordered table-striped" cellspacing="0">
                                                    <thead>
                                                        <tr>

                                                            <th>
                                                                Mã Chi Tiết Sản Phẩm
                                                            </th>
                                                            <th>
                                                                Tên sản phẩm
                                                            </th>
                                                            <th>
                                                                Ảnh
                                                            </th>
                                                            <th>
                                                                Màu
                                                            </th>
                                                            <th>Size</th>
                                                            <th>
                                                                Số Lượng
                                                            </th>
                                                            <th>
                                                                Giá
                                                            </th>

                                                            <th>
                                                                Ngày Tạo
                                                            </th>
                                                            <th>
                                                                Trạng thái
                                                            </th>

                                                            <th style="width: 0%">
                                                                Actions
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:if test="${!ctsanPhams.isEmpty() }">
                                                        <c:forEach var="c" items="${ctsanPhams}">

                                                            <tr>

                                                                <td class="idchitiet" data-value="${c.idChiTietSP}">${c.idChiTietSP}</td>
                                                                <td>${c.tenSanPham}</td>
                                                                <td>
                                                                    <c:if test="${c.anhChinh==null}">
                                                                        <img src="/Web_Shoes/images/noprofil.jpg" id="img${c.idChiTietSP}" width = 100 height = 100 alt="">
                                                                    </c:if>
                                                                    <c:if test="${c.anhChinh!=null}">
                                                                        <img src="<i:url value='/images/${c.anhChinh}'/>" id="img${c.idChiTietSP}" width = 100 height = 100 alt="">
                                                                    </c:if>
                                                                </td>
                                                                <td>${c.tenMau}</td>
                                                                <td>${c.size}</td>
                                                                <td><input type="number" min="1" class="soluong" value="${c.soLuong}" style="text-align:right;"></td>
                                                                <td ><input type="number" min="1" class="giatien" value="${c.getGia()}" style="text-align:right;"> </td>
                                                                <td>${c.ngayTao}</td>
                                                                <td class="font-weight-medium">
                                                                    <c:if test="${c.status}">
                                                                        <button type="button" class="btn btn-primary  btn-icon huydon" style="width: 90px">
                                                                         <input type="text" hidden value="false" class="huy11"/>
                                                                        còn Hàng 
                                                                    </button>
                                                                    </c:if>
                                                                    <c:if test="${c.status == false}">
                                                                        <button type="button" class="btn btn-danger  btn-icon huydon" style="width: 90px;">
                                                                        <input type="text" hidden value="true" class="huy11"/>
                                                                        Hết Hàng
                                                                    </button>
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <a >
                                                                        <button type="button" type="button" data-toggle="modal" data-target="#myModal" data-idchitiet="${c.idChiTietSP}" data-tenSanPham="${c.tenSanPham}" data-tenMau="${c.tenMau}"  data-size="${c.size}" data-anh="${c.anhChinh}" class="btn btn-warning btn-icon editsp">
                                                                            <i class="ti-image"></i>
                                                                        </button>
                                                                    </a>
                                                                    <a>
                                                                        <button type="button" class="btn btn-danger  btn-icon getanh">
                                                                            <i class="ti-trash"></i>
                                                                        </button>
                                                                    </a>

                                                                </td>

                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="modal fade" tabindex="-1" role="dialog" id="themchitietspModal">
                                <div class="modal-dialog mt-5">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Thêm chi tiết</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        </div>
                                        <div class="modal-body pb-0" >
                                            <form class="forms-sample" action="/Web_Shoes/admin/chitietsanpham/insertChiTietSanPham" method="post" enctype="multipart/form-data" onsubmit="return validate()">

                                                <div class="form-group row">
                                                    <input type="text" name="idChiTietSP" class="form-control" value="0" hidden="true"/>
                                                    <input type="text" name="maSanPham" id="sanpham" class="form-control" value="${san.maSanPham}" hidden="true"/>

                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">tên Sản Phẩm</label>
                                                    <div class="col-sm-9">
                                                        <div class="input-group">

                                                            <input type="text"  value="${san.tenSanPham}" class="form-control" readonly/>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Màu</label>
                                                            <div class="col-sm-9">
                                                                <div>
                                                                    <select name="maMau" id="chon" class="form-control">
                                                                        <option value="0">--chọn--</option>
                                                                        <c:forEach items="${mau}" var="m">
                                                                            <option value="<fmt:formatNumber value="${m.maMau}"></fmt:formatNumber>">${m.tenMau}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                                <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Size</label>
                                                            <div class="col-sm-9">

                                                                <div >

                                                                    <select class="form-control" name="maSize" id="size" multiple="multiple">


                                                                    </select>


                                                                </div>
                                                                <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Giá Tiền</label>
                                                    <div class="col-sm-9">
                                                        <div class="input-group">

                                                            <div>
                                                                <input type="number" id="giatien" step="any" name="giaTien" class="form-control" min="1"  style="text-align:right;"/>
                                                            </div>
                                                            <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Số Lượng</label>
                                                    <div class="col-sm-9">
                                                        <div class="input-group">
                                                            <div>
                                                                <input type="number" id="soluong" step="any" name="soLuong" class="form-control" min="1"  style="text-align:right;"/>
                                                            </div>
                                                            <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">File upload</label>
                                                    <div class="col-sm-9">
                                                        <div class="input-group file-upload">

                                                            <div class="file-select"  id="ianh">
                                                                <div class="file-select-button" id="fileName">Choose File</div>
                                                                <div class="file-select-name" id="noFile">No file chosen...</div> 
                                                                <input type="file" name="anhBannerURL" id="chooseFile" accept="image/png, image/jpeg" onchange="file_changed()">

                                                            </div>


                                                        </div>
                                                        <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                        <div id="image">
                                                            <img id="img" src="" width="50%">
                                                        </div>
                                                        <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                    </div>
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Thoát</button>
                                                    <button type="submit" class="btn btn-primary">Lưu</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <div class="modal fade" tabindex="-1" role="dialog" id="myModal">
                                <div class="modal-dialog modal-xl mt-5">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Sửa sản phẩm</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        </div>
                                        <div class="modal-body pb-0" >
                                            <div class="row">
                                                <div class="col-12 grid-margin">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <form class="forms-sample" action="/Web_Shoes/admin/chitietsanpham/updateanh" method="post" enctype="multipart/form-data" onsubmit="return myvalidate()">

                                                                <div class="form-group row">
                                                                    <input type="text" name="idChiTietSP" id="idchitiet" class="form-control" hidden="true"/>


                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-sm-3 col-form-label">tên Sản Phẩm</label>
                                                                    <div class="col-sm-9">
                                                                        <div class="input-group">

                                                                            <input type="text" id="tensp" class="form-control" readonly/>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-sm-3 col-form-label">Màu</label>
                                                                    <div class="col-sm-9">
                                                                        <div class="input-group">

                                                                            <input type="text" id="mau" class="form-control" readonly/>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-sm-3 col-form-label">Size</label>
                                                                    <div class="col-sm-9">
                                                                        <div class="input-group">

                                                                            <input type="text" id="sizesp" class="form-control" readonly/>

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group row">
                                                                    <label class="col-sm-3 col-form-label">File upload</label>
                                                                    <div class="col-sm-9">
                                                                        <div class="input-group file-upload">

                                                                            <div class="file-select"  id="ianh1">
                                                                                <div class="file-select-button" id="fileName">Choose File</div>
                                                                                <div class="file-select-name" id="noFile1">No file chosen...</div> 
                                                                                <input type="file" name="anhBannerURL" id="chooseFile1" accept="image/png, image/jpeg" onchange="file_changed1()">
                                                                                <input type="text" name="anhChinh" id="hinhanh" hidden>
                                                                            </div>


                                                                        </div>
                                                                        <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                                        <div id="image1">
                                                                            <img id="img1" src="" width="50%">
                                                                        </div>
                                                                        <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                                    </div>
                                                                </div>

                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Thoát</button>
                                                                    <button type="submit" class="btn btn-primary">Sửa</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    /.modal-content 
                                </div>
                                /.modal-dialog 
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
            <script src="<c:url value="/resources/js/Select2.min.js"/>"></script>
            <script type="text/javascript" src="<c:url value="/resources/frontend/js/toastr.min.js"/>"></script>
            <script>
                $('#sanphamtables').dataTable({
                            "pagingType": "full_numbers",
                            "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]],
                        });
                                                                                    $(".getanh").on("click", function () {
                                                                                        var idchitiet = $(this).closest("tr").find(".idchitiet").attr("data-value");

                                                                                        $.ajax({
                                                                                            url: "${pageContext.request.contextPath}/admin/chitietsanpham/delete",
                                                                                            type: "GET",
                                                                                            data: {
                                                                                                idchitiet: idchitiet

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
                                                                                        var ten = $(this).data("tensanpham");
                                                                                        var mau = $(this).data("tenmau");
                                                                                        var size = $(this).data("size");
                                                                                        var anh = $(this).data("anh");
                                                                                        $("#idchitiet").val(idchitiet);
                                                                                        $("#tensp").val(ten);
                                                                                        $("#mau").val(mau);
                                                                                        $("#sizesp").val(size);

                                                                                        $("#noFile1").text(anh);
                                                                                        $("#hinhanh").val(anh);

                                                                                        var img = document.getElementById('img1')
                                                                                        if (anh == '') {
                                                                                            img.src = '';
                                                                                            $("#noFile1").text("No file chosen...");
                                                                                            $("#image1").hide();
                                                                                        } else {
                                                                                            $("#image1").show();
                                                                                            img.src = '/Web_Shoes/images/' + anh;
                                                                                        }
                                                                                    });
                                                                                    $(document).ready(function () {
                                                                                        $('#chon').select2({
                                                                                            placeholder: "--chọn--",
                                                                                            allowClear: true
                                                                                        });
                                                                                        $('#size').select2({
                                                                                            placeholder: "--chọn--",
                                                                                            allowClear: true
                                                                                        });
                                                                                        $('#chon').change(function () {

                                                                                            var sanpham = $('#sanpham').val();
                                                                                            var mau = $('#chon').val();
                                                                                            $.ajax({
                                                                                                url: "${pageContext.request.contextPath}/admin/chitietsanpham/laysize",
                                                                                                type: "GET",
                                                                                                data: {
                                                                                                    sanpham: sanpham,
                                                                                                    mau: mau

                                                                                                },
                                                                                                success: function (value) {

                                                                                                    var s = '';
                                                                                                    $('#size').html('');
////                               
                                                                                                    for (i = 0; i < value.length; i++) {
                                                                                                        s += '<option value="' + value[i].maSize + '">' + value[i].size + '</option>';
                                                                                                    }
                                                                                                    $('#size').html(s);
                                                                                                },
                                                                                                error: function (xhr, status, error) {
                                                                                                    alert(xhr.responseText);
                                                                                                }

                                                                                            })


                                                                                        });
                                                                                        $(".giatien").change(function () {
                                                                                            var giatien = $(this).val();
                                                                                            var idChiTietSP = $(this).closest("tr").find(".idchitiet").attr("data-value");
                                                                                            if (giatien <= 0) {
                                                                                                toastr.error('giá tiền phải lớn hơn 0!', 'Error!', {
                                                                                                    closeButton: true,
                                                                                                    tapToDismiss: false
                                                                                                });
                                                                                            } else {
                                                                                                $.ajax({
                                                                                                    url: "${pageContext.request.contextPath}/admin/chitietsanpham/updategia",
                                                                                                    type: "GET",
                                                                                                    data: {
                                                                                                        idChiTietSP: idChiTietSP,
                                                                                                        giatien: giatien

                                                                                                    },
                                                                                                    success: function (value) {


                                                                                                        toastr.success('update giá tiền thành công', 'Success!', {
                                                                                                            closeButton: true,
                                                                                                            tapToDismiss: false
                                                                                                        });


                                                                                                    }


                                                                                                })


                                                                                            }

                                                                                        })
                                                                                        $(".soluong").change(function () {
                                                                                            var soluong = $(this).val();
                                                                                            var idChiTietSP = $(this).closest("tr").find(".idchitiet").attr("data-value");
                                                                                            if (soluong <= 0) {
                                                                                                toastr.error('số lượng phải lớn hơn 0!', 'Error!', {
                                                                                                    closeButton: true,
                                                                                                    tapToDismiss: false
                                                                                                });
                                                                                            } else {
                                                                                                $.ajax({
                                                                                                    url: "${pageContext.request.contextPath}/admin/chitietsanpham/updatesoluong",
                                                                                                    type: "GET",
                                                                                                    data: {
                                                                                                        idChiTietSP: idChiTietSP,
                                                                                                        soluong: soluong

                                                                                                    },
                                                                                                    success: function (value) {


                                                                                                        toastr.success('update số lượng thành công', 'Success!', {
                                                                                                            closeButton: true,
                                                                                                            tapToDismiss: false
                                                                                                        });


                                                                                                    }


                                                                                                })


                                                                                            }

                                                                                        })

                                                                                    });
                                                                                    function file_changed() {
                                                                                        var selectedFile = document.getElementById('chooseFile').files[0];
                                                                                        var img = document.getElementById('img')
                                                                                        $("#image").show();
                                                                                        var reader = new FileReader();
                                                                                        reader.onload = function () {
                                                                                            img.src = this.result

                                                                                        }
                                                                                        reader.readAsDataURL(selectedFile);
                                                                                    }
                                                                                    function file_changed1() {
                                                                                        var selectedFile = document.getElementById('chooseFile1').files[0];
                                                                                        var img = document.getElementById('img1')
                                                                                        $("#image1").show();
                                                                                        var reader = new FileReader();
                                                                                        reader.onload = function () {
                                                                                            img.src = this.result

                                                                                        }
                                                                                        reader.readAsDataURL(selectedFile);
                                                                                    }
                                                                                    function myvalidate() {
                                                                                        var check = true;
                                                                                        var hinhanh = $('#hinhanh').val();
                                                                                        if (hinhanh == '') {
                                                                                            var noFile = $('#noFile1').text();
                                                                                            if (noFile == 'No file chosen...') {
                                                                                                $('#ianh1').parent().next().html('ảnh không được để trống!');
                                                                                                check = false;
                                                                                            } else {
                                                                                                $('#ianh1').parent().next().html('');

                                                                                                check = true;
                                                                                            }
                                                                                            if (noFile == 'No file chosen...') {
                                                                                                $('#ianh1').parent().next().html('ảnh không được để trống!');
                                                                                                check = false;
                                                                                            }
                                                                                        }
                                                                                        return check;
                                                                                    }
                                                                                    function chaneImage(sanpham) {
                                                                                        var selectedFile = document.getElementById('anhchinh' + sanpham).files[0];
                                                                                        var img = document.getElementById('img' + sanpham)

                                                                                        var reader = new FileReader();
                                                                                        reader.onload = function () {
                                                                                            img.src = this.result

                                                                                        }
                                                                                        reader.readAsDataURL(selectedFile);
                                                                                    }
                                                                                    function validate() {
                                                                                        var check = true;



                                                                                        var maMau = $('#chon').val();
                                                                                        var maSize = $('#size').val();
                                                                                        var giatien = $('#giatien').val();
                                                                                        var soluong = $('#soluong').val();
                                                                                        var noFile = $('#noFile').text();



                                                                                        if (maMau == 0 || maMau == null) {
                                                                                            $('#chon').parent().next().html('bạn chưa chọn màu!');
                                                                                            check = false;
                                                                                        } else {
                                                                                            $('#chon').parent().next().html('');
                                                                                            check = true;
                                                                                        }
                                                                                        if (maSize == 0 || maSize == null) {
                                                                                            $('#size').parent().next().html('bạn chưa chọn size!');
                                                                                            check = false;
                                                                                        } else {
                                                                                            $('#size').parent().next().html('');
                                                                                            check = true;
                                                                                        }
                                                                                        if (giatien <= 0) {
                                                                                            $('#giatien').parent().next().html('giá tiền phải lớn hơn 0!');
                                                                                            check = false;
                                                                                        }
                                                                                        else if (giatien === '') {
                                                                                            $('#giatien').parent().next().html('giá tiền không được để trống!');
                                                                                            check = false;
                                                                                        } else {
                                                                                            $('#giatien').parent().next().html('');
                                                                                            check = true;
                                                                                        }
                                                                                        if (soluong <= 0) {
                                                                                            $('#soluong').parent().next().html('số lượng phải lớn hơn 0!');
                                                                                            check = false;
                                                                                        }
                                                                                        else if (soluong === '') {
                                                                                            $('#soluong').parent().next().html('số lượng không được để trống!');
                                                                                            check = false;
                                                                                        } else {
                                                                                            $('#soluong').parent().next().html('');
                                                                                            check = true;
                                                                                        }
                                                                                        if (noFile == 'No file chosen...') {
                                                                                            $('#ianh').parent().next().html('ảnh không được để trống!');
                                                                                            check = false;
                                                                                        } else {
                                                                                            $('#ianh').parent().next().html('');

                                                                                            check = true;
                                                                                        }

                                                                                        if (maMau == 0 || maMau == null) {
                                                                                            $('#chon').parent().next().html('bạn chưa chọn màu!');
                                                                                            check = false;
                                                                                        }
                                                                                        if (maSize == 0 || maSize == null) {
                                                                                            $('#size').parent().next().html('bạn chưa chọn size!');
                                                                                            check = false;
                                                                                        }
                                                                                        if (giatien <= 0) {
                                                                                            $('#giatien').parent().next().html('giá tiền phải lớn hơn 0!');
                                                                                            check = false;
                                                                                        }
                                                                                        else if (giatien === '') {
                                                                                            $('#giatien').parent().next().html('giá tiền không được để trống!');
                                                                                            check = false;
                                                                                        }
                                                                                        if (soluong <= 0) {
                                                                                            $('#soluong').parent().next().html('số lượng phải lớn hơn 0!');
                                                                                            check = false;
                                                                                        }
                                                                                        else if (soluong === '') {
                                                                                            $('#soluong').parent().next().html('số lượng không được để trống!');
                                                                                            check = false;
                                                                                        }
                                                                                        if (noFile == 'No file chosen...') {
                                                                                            $('#ianh').parent().next().html('ảnh không được để trống!');
                                                                                            check = false;
                                                                                        }

                                                                                        return check;
                                                                                    }
                                                                                    $('#chooseFile').bind('change', function () {
                                                                                        var filename = $("#chooseFile").val();
                                                                                        if (/^\s*$/.test(filename)) {
                                                                                            $(".file-upload").removeClass('active');
                                                                                            $("#noFile").text("No file chosen...");
                                                                                        }
                                                                                        else {
                                                                                            $(".file-upload").addClass('active');
                                                                                            $("#noFile").text(filename.replace("C:\\fakepath\\", ""));
                                                                                        }
                                                                                    });
                                                                                    $('#chooseFile1').bind('change', function () {
                                                                                        var filename = $("#chooseFile1").val();
                                                                                        if (/^\s*$/.test(filename)) {
                                                                                            $(".file-upload").removeClass('active');
                                                                                            $("#noFile1").text("No file chosen...");
                                                                                        }
                                                                                        else {
                                                                                            $(".file-upload").addClass('active');
                                                                                            $("#noFile1").text(filename.replace("C:\\fakepath\\", ""));
                                                                                        }
                                                                                    });
                                                                                    $(".huydon").click(function () {

                                                                                        var idChitiet = $(this).closest("tr").find(".idchitiet").attr("data-value");
                                                                                       var status = $(".huy11").val();

                                                                                        $.ajax({
                                                                                            url: "${pageContext.request.contextPath}/admin/chitietsanpham/updatetintrang",
                                                                                            type: "GET",
                                                                                            data: {
                                                                                               idChitiet: idChitiet,
                                                                                               status:status


                                                                                            },
                                                                                            success: function (value) {

                                                                                                if (!value.result) {

                                                                                                    toastr.success('update trang thái thành công', 'Success!', {
                                                                                                        closeButton: true,
                                                                                                        tapToDismiss: false
                                                                                                    });
                                                                                                } else {
                                                                                                    toastr.error('update trang thái thất bai!', 'Error!', {
                                                                                                        closeButton: true,
                                                                                                        tapToDismiss: false
                                                                                                    });
                                                                                                }
                                                                                                location.reload();
                                                                                            }

                                                                                        })
                                                                                    })
            </script>

    </body>
</html>