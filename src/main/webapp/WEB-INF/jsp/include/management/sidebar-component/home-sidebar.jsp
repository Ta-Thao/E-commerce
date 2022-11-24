<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<li class="nav-item start">
    <a href="#" class="nav-link nav-toggle">
        <i class="material-icons">dashboard</i>
        <span class="title">Home</span>
        <span class="selected"></span>
        <span class="arrow open"></span>
    </a>
    <ul class="sub-menu">
        <li class="nav-item">
            <a href="<c:url value="/"/>" class="nav-link ">
                <span class="title">Home</span>
            </a>
        </li>        
    </ul>
</li>
