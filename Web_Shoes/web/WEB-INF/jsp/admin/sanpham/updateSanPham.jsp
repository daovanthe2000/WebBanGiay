<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal-header">
    <h4 class="modal-title">Sửa sản phẩm</h4>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
<div class="modal-body pb-0" >
    <div class="row">
        <div class="col-12 grid-margin">
            <div class="card">
                <div class="card-body">
                    <form class="form-sample" action="/Web_Shoes/admin/sanpham/updateProduct" method="post" onsubmit="return validate()">

                        <div class="row">
                            <div class="col-md-12" hidden="">
                                <div class="form-group">
                                    <input id="ten" value="${sp.tenSanPham}"/>
                                    <input type="text" name="maSanPham" class="form-control" value="${sp.maSanPham}"  />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-group">Tên sản phẩm</label>
                                    <div>
                                    <input type="text" name="tenSanPham" class="form-control" id="tenSanPham" value="${sp.tenSanPham}"  placeholder="Tên sản phẩm"  />
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
                                                <div>
                                                <select name="maDanhMuc" id="maDanhMuc" class="form-control">
                                                    <c:forEach items="${danhMucs}" var="d">
                                                        <c:if test="${d.maDanhMuc == sp.maDanhMuc.maDanhMuc}">
                                                            <option selected value="<fmt:formatNumber value="${d.maDanhMuc}"></fmt:formatNumber>">${d.tenDanhMuc}</option>
                                                        </c:if>
                                                        <c:if test="${d.maDanhMuc != sp.maDanhMuc.maDanhMuc}">
                                                            <option value="<fmt:formatNumber value="${d.maDanhMuc}"></fmt:formatNumber>">${d.tenDanhMuc}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                                </div>
                                                <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-form-label">Nhãn hàng</label>
                                            <div class="col-sm-12">
                                                <div>
                                                <select name="maNhanHang" id="maNhanHang" class="form-control">
                                                    <c:forEach items="${nhanHangs}" var="n">
                                                        <c:if test="${n.maNhanHang == sp.maNhanHang.maNhanHang}">
                                                            <option selected value="<fmt:formatNumber value="${n.maNhanHang}"></fmt:formatNumber>">${n.tenNhanHang}</option>
                                                        </c:if>
                                                        <c:if test="${n.maNhanHang != sp.maNhanHang.maNhanHang}">
                                                            <option value="<fmt:formatNumber value="${n.maNhanHang}"></fmt:formatNumber>">${n.tenNhanHang}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                                </div>
                                                <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <div class="col-12 ">
                                <div class="form-group">
                                    <label>Mô tả</label>
                                    <div>
                                    <textarea id="moTa" name="moTa" id="moTa">${sp.moTa}</textarea>
                                    </div>
                                    <div class="invalid-feedback" style="display:block;font-size:15px;color: red"></div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary mr-2">Submit</button>
                        <button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button>
                    </form>
                </div>
            </div>
        </div>


    </div>
</div>
<script>
    $(document).ready(function () {


        CKEDITOR.replace('moTa');

    });

</script>