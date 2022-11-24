<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--// promotion chinh sua sau--%>
<li class="nav-item">
    <a href="#" class="nav-link nav-toggle">
        <i class="material-icons">local_taxi</i>
        <span class="title">Promotions</span>
        <span class="arrow"></span>
    </a>
    <ul class="sub-menu">
        <li class="nav-item">
            <a href="<c:url value="#" />" class="nav-link ">
                <span class="title">Add Promotion</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="<c:url value="#" />" class="nav-link ">
                <span class="title">View All Promotions</span>
            </a>
        </li>
    </ul>
</li>