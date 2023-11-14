<%-- 
    Document   : menu.jsp
    Created on : Jun 14, 2022, 9:55:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
            <li class="nav-item">
            <a class="nav-link" href="index.html">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">Dashboard</span>
            </a>
          </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/category/listCate">
              <i class="icon-paper menu-icon"></i>
              <span class="menu-title">Danh Mục</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/size/listSize">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">Kích Thước</span>
             
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/color/listColor">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">Màu Sắc</span>
             
            </a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/banner/listBan">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">Banner</span>
             
            </a>
          </li>
          
          
           <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/nhanhang/listNhanHang">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">Nhãn Hàng</span>
             
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="icon-command menu-icon"></i>
              <span class="menu-title">Sản Phẩm</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/admin/sanpham/listSanPham">Sản Phẩm</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/admin/chitietsanpham/listChiTietSanPham">Chi Tiết Sản Phẩm</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
              <i class="icon-command menu-icon"></i>
              <span class="menu-title">Khuyến mãi</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/admin/khuyenmai/listKhuyenMai">Khuyến Mãi</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/admin/khuyenmai/insertKhuyenmai">add khuyến mãi</a></li>
              </ul>
            </div>
          </li>
           <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tablestaikhoan" aria-expanded="false" aria-controls="tables">
              <i class="icon-command menu-icon"></i>
              <span class="menu-title">Tài khoản</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tablestaikhoan">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/admin/taikhoan/listTaiKhoan">Tài Khoản Nhân Viên</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/admin/taikhoan/listTaiKhoanKhachHang">Tài Khoản khách Hàng</a></li>
              </ul>
            </div>
          </li>
           
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#HoaDon" aria-expanded="false" aria-controls="tables">
              <i class="icon-command menu-icon"></i>
              <span class="menu-title">Hóa Đơn</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="HoaDon">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/admin/hoadon/listHoaDonDXL">Hóa Đơn Chờ Duyệt</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/admin/hoadon/lisDonDaDuyet">Hóa Đơn Đã Duyệt</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/admin/hoadon/listDonDangGiao">Hóa Đơn Đang Giao</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/admin/hoadon/listDonDaGiao">Hóa Đơn Đã Giao</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/admin/hoadon/listHuyDon">Hóa Đơn Đã Hủy</a></li>
              </ul>
            </div>
          </li>
          
          
          
        </ul>
      </nav>
    
