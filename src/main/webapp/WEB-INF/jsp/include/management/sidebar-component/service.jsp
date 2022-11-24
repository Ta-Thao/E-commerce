<%-- 
    Document   : service
    Created on : Aug 10, 2022, 10:39:15 AM
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<li class="nav-item">
    <a href="#" class="nav-link nav-toggle">
        <i class="material-icons">queue</i>
        <span class="title">Services</span>
        <span class="arrow"></span>
    </a>
    <ul class="sub-menu">
        <li class="nav-item">
            <a href="<c:url value="#" />" class="nav-link ">
                <span class="title">Add Service</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="<c:url value="#"/>" class="nav-link ">
                <span class="title">View All Services</span>
            </a>
        </li>
    </ul>
</li>
