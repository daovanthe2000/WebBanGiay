<%-- 
        Document   : insertSanPham
        Created on : Aug 10, 2022, 5:34:42 PM
        Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<select class="form-control" id="size" multiple="multiple">
    <c:forEach items="${size}" var="c">
        <option value="${c.maSize.maSize}">${c.maSize.size}</option>
    </c:forEach>

</select>

