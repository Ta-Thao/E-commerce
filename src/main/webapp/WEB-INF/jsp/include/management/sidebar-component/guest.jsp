<%-- 
    Document   : guest
    Created on : Aug 28, 2022, 11:11:51 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
// tri cung ko dung nen tam bo qua
<li class="nav-item">
    <a href="#" class="nav-link nav-toggle">
        <i class="material-icons">face</i>
        <span class="title">Guest</span>
        <span class="arrow"></span>
    </a>
    <ul class="sub-menu">
        <li class="nav-item">
            <a href="<c:url value="/management/add-guest" />" class="nav-link ">
                <span class="title">Add Guest</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="<c:url value="/management/view-guests" />" class="nav-link ">
                <span class="title">View Guests</span>
            </a>
        </li>
    </ul>
</li>
