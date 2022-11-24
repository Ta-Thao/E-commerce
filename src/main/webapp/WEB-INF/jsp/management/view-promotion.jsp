<%--
  Created by IntelliJ IDEA.
  User: This MC
  Date: 25/09/2022
  Time: 10:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Promotions Page</title>
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
                            <div class="page-title">All Promotions</div>
                        </div>
                        <ol class="breadcrumb page-breadcrumb pull-right">
                            <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                            </li>
                            <li><a class="parent-item" href="">Promotions</a>&nbsp;<i class="fa fa-angle-right"></i>
                            </li>
                            <li class="active">All Promotions</li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${promotions}" var="p">
                        <div class="col-lg-4 col-md-6 col-12 col-sm-6">
                            <div class="blogThumb">
                                <c:forEach items="${p.imageEntitys}" var="i"  begin="0" end="0">
                                    <div class="thumb-center"><img style="height: 200px" onclick="location.href = '<c:url value="/management/update-promotion/${p.id}"/>'"
                                                                   class="img-responsive w-100" alt="" src="<c:url value="/resources/upload/promotion/${i.name}"/>">
                                    </div>
                                </c:forEach>
                                <div class="vehicle-name light-dark-bgcolor">
                                    <div class="user-name"><a style="color: white" href="<c:url value="/management/update-promotion/${p.id}"/>">${p.name}</a></div>
                                </div>
                                <div class="vehicle-box">
                                    <p><strong>Promotion Name:</strong> ${p.name}</p>
                                    <p><strong>Start Date:</strong> ${p.startDate}</p>
                                    <p><strong>End Date:</strong> ${p.endDate}</p>
                                    <p><strong>Discount:</strong> ${p.discount}%</p>
                                    <p><strong>Code:</strong> ${p.code}</p>
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
