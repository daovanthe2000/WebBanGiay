<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="i" uri="http://www.springframework.org/tags" %>

<nav class="navigation">
    <div class="container-fluid">
        <div class="navigation__column left">
            <div class="header__logo"><a class="ps-logo" href="index.html"><img src="<i:url value='/resources/images/logo.png'/>" alt=""></a></div>
        </div>
        <div class="navigation__column center"><ul class="main-menu menu">
                <li class="menu-item menu-item-has-children dropdown"><a href="/Web_Shoes/">Trang chủ</a>

                </li>
                <li class="menu-item menu-item-has-children dropdown"><a href="/Web_Shoes/Product">Sản Phẩm</a>
                    <ul class="sub-menu">
                        <c:forEach var="s" items="${danhmuc}">
                            <li><a href="/Web_Shoes/DanhMuc?maDanhMuc=${s.maDanhMuc}">${s.tenDanhMuc}</a></li>
                            </c:forEach>
                    </ul>
                </li>
                
            </ul>

        </div>
        <div class="navigation__column right">

            <form class="ps-search--header" action="/Web_Shoes/search" method="GET">
                <input class="form-control" type="text" placeholder="Search Product…" name="name">
                <button><i class="ps-icon-search"></i></button>
            </form>
            <div class="ps-cart"><a class="ps-cart__toggle" href="/Web_Shoes/giohang" id="giohang">
                    <c:if test="${soluong>0}">
                    <span class="circle-giohang"><i>${soluong}</i></span>
                    </c:if>
                    <c:if test="${soluong<=0 || soluong==null}">
                         <span><i>${soluong}</i></span>
                    </c:if>
                    <i class="ps-icon-shopping-cart"></i></a>
               
            </div>
            <div class="menu-toggle"><span></span></div>
        </div>
    </div>
</nav>