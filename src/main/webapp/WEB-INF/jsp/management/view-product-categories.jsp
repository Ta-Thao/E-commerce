
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Room Categories</title>
        <jsp:include page="../include/management/css-page.jsp"/>
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <div class="page-wrapper">
            <div class="page-header navbar navbar-fixed-top">
                <jsp:include page="../include/management/header.jsp"/>
            </div>
            <div class="page-container">
                <jsp:include page="../include/management/manager-side.jsp"/>
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <div class="page-bar">
                            <div class="page-title-breadcrumb">
                                <div class=" pull-left">
                                    <div class="page-title">All Room Categories</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item" href="">Rooms</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">All Room Categories</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <c:forEach items="${roomCategories}" var="c">
                                <div class="col-lg-4 col-md-6 col-12 col-sm-6"> 
                                    <div class="blogThumb">
                                        <c:forEach items="${c.imageEntitys}" var="i"  begin="0" end="0">                                            
                                            <div class="thumb-center"><img style="height: 200px" onclick="location.href = '<c:url value="/management/update-room-category/${c.id}"/>'"
                                                                           class="img-responsive w-100" alt="" src="<c:url value="/resources/upload/room_category/${i.name}"/>">
                                            </div>
                                        </c:forEach>
                                        <div class="vehicle-name light-dark-bgcolor">
                                            <div class="user-name"><a style="text-decoration: none; color: white" href="<c:url value="/management/update-room-category/${c.id}"/>">${c.name}</a></div>
                                        </div>
                                        <div class="vehicle-box">
                                            <p><strong>Area:</strong> ${c.area} m&sup2</p>
                                            <p><strong>Number of bed:</strong> ${c.numberOfBed}</p>
                                            <p><strong>Capacity:</strong> ${c.capacity} Person</p>
                                            <p><strong>Price:</strong> <fmt:formatNumber maxFractionDigits  = "0" value = "${c.price}" currencySymbol="$" type = "currency"/></p>
                                            <p><strong>Status:</strong> ${c.status}</p>
                                        </div>
                                    </div>	
                                </div>
                            </c:forEach>
                        </div>

                    </div>
                </div>
            </div>
            <jsp:include page="../include/management/footer.jsp" />
        </div>

        <jsp:include page="../include/management/js-page.jsp" />
    </body>
</html>
