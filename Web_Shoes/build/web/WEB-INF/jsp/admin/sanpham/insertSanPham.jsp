<%-- 
    Document   : insertSanPham
    Created on : Aug 10, 2022, 5:34:42 PM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->

        <jsp:include page="../linkcss.jsp"></jsp:include>
        <script src="<c:url value="/resources/ckeditor/ckeditor.js"/>"></script>
        <style>.span-color{width:25px;
                    height:25px;
                    margin-right: 20px;
                    display:inline-block;
                    color:black;
                    cursor:pointer;
                    position:relative;}


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
                                <div class="col-12 grid-margin">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Thêm mới sản phẩm</h4>
                                            <form class="form-sample" action="/Web_Shoes/admin/sanpham/saveProduct" method="post" onsubmit="return validate()">
                                                <p class="card-description">
                                                    Personal info
                                                </p>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label class="form-group">Tên sản phẩm</label>
                                                            <div>
                                                                <input type="text" name="tenSanPham" id="tenSanPham" class="form-control"  placeholder="Tên sản phẩm"  />
                                                            </div>
                                                            <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 ">
                                                        <div class="row ">
                                                            <div class="col-md-6">
                                                                <div class="form-group row">
                                                                    <label class="col-sm-12 col-form-label">Danh mục</label>
                                                                    <div class="col-sm-12">
                                                                        <select name="maDanhMuc" class="form-control">
                                                                        <c:forEach items="${danhMucs}" var="d">
                                                                            <option value="<fmt:formatNumber value="${d.maDanhMuc}"></fmt:formatNumber>">${d.tenDanhMuc}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-12 col-form-label">Nhãn hàng</label>
                                                                <div class="col-sm-12">
                                                                    <select name="maNhanHang" class="form-control">
                                                                        <c:forEach items="${nhanHangs}" var="n">
                                                                            <option value="<fmt:formatNumber value="${n.maNhanHang}"></fmt:formatNumber>">${n.tenNhanHang}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>
                                                <div class="col-12 ">
                                                    <div class="form-group">
                                                        <label>Mô tả</label>
                                                        <textarea id="moTa" name="moTa"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" hidden="">
                                                <div class="col-md-12">
                                                    <div class="form-group"
                                                         <input type="text" name="idChiTietSP" value="0" hidden=""/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div cla
                                                 <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group"
                                                             <label class="form-group">Màu Sản Phẩm</label>
                                                            <input type="checkbox" name="mauSanPham" checked="true" value="0" hidden=""/>
                                                            <div class="row">
                                                                <c:forEach items="${mauSanPhams}" var="m">
                                                                    <div class="col-md-3">
                                                                        <div class="form-check form-check-flat form-check-primary">
                                                                            <label class="form-check-label">
                                                                                <input type="checkbox" class="form-check-input" name="mauSanPham" value="<fmt:formatNumber value="${m.maMau}"/>"/>
                                                                                ${m.tenMau}
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                               
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group"
                                                             <label class="form-group">Size Sản Phẩm</label>
                                                            <input type="checkbox" name="sizeSanPham" checked="true" value="0" hidden=""/>
                                                            <div class="row">
                                                                <c:forEach items="${sizeSanPhams}" var="s">
                                                                    <div class="col-md-2">
                                                                        <div class="form-check form-check-flat form-check-primary">
                                                                            <label class="form-check-label">
                                                                                <input type="checkbox" class="form-check-input"  name="sizeSanPham" value="<fmt:formatNumber value="${s.maSize}"/>"/>
                                                                                ${s.size}
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
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


            <script>
                $(document).ready(function () {
                    CKEDITOR.replace('moTa');
                });
                function validate() {
                    var check = true;


                    var tenSanPham = $('#tenSanPham').val();




                    if (tenSanPham === '') {
                        $('#tenSanPham').parent().next().html('tên SanPham được để trống!');
                        check = false;
                    } else if (checkname(tenSanPham)) {
                        $('#tenSanPham').parent().next().html('tên Sản Phẩm đã tồn tại!');
                        check = false;
                    } else {
                        $('#tenSanPham').parent().next().html('');

                        check = true;
                    }


                   

                    if (tenSanPham === '') {
                        $('#tenSanPham').parent().next().html('tên SanPham được để trống!');
                        check = false;
                    } else if (checkname(tenSanPham)) {
                        $('#tenSanPham').parent().next().html('tên Sản Phẩm đã tồn tại!');
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


