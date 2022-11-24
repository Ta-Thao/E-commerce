
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Rooms</title>
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
                                    <div class="page-title">All Rooms</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item" href="">Rooms</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">All Rooms</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>All Rooms</header>
                                        <div class="tools">
                                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                            <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                        </div>
                                    </div>
                                    <div class="card-body ">
                                        <div class="row p-b-20">
                                            <div class="col-md-6 col-sm-6 col-6">
                                                <div class="btn-group">
                                                    <a href="<c:url value="/management/add-room"/>" id="addRow" class="btn btn-info">
                                                        Add New <i class="fa fa-plus"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-6">
                                                <div class="btn-group pull-right">
                                                    <a class="btn deepPink-bgcolor  btn-outline dropdown-toggle" data-toggle="dropdown">Tools
                                                        <i class="fa fa-angle-down"></i>
                                                    </a>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li>
                                                            <a href="javascript:;">
                                                                <i class="fa fa-print"></i> Print </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:;">
                                                                <i class="fa fa-file-pdf-o"></i> Save as PDF </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:;">
                                                                <i class="fa fa-file-excel-o"></i> Export to Excel </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">               
                                            <c:if test="${messageType == 'success'}">
                                                <div class="alert alert-success " role="alert">
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>                                                                                            
                                                    ${message}
                                                </div>
                                            </c:if>
                                            <c:if test="${messageType == 'fail'}">
                                                <div class="alert alert-danger" role="alert">
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    ${message}
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="table-scrollable">
                                        <table class="table table-hover table-checkable order-column full-width" id="example4">
                                            <thead>
                                                <tr>
                                                    <th class="center"> # </th>
                                                    <th class="center"> Type </th>
                                                    <th class="center"> Status </th>
                                                    <th class="center"> Area </th>
                                                    <th class="center"> Bad Capacity </th>
                                                    <th class="center"> Phone </th>
                                                    <th class="center"> Price </th>
                                                    <th class="center"> Action </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${rooms}" var="r">
                                                    <tr class="odd gradeX">
                                                        <td class="center">${r.roomNumber}</td>
                                                        <td class="center">${r.roomCategoryEntity.name}</td>
                                                        <td class="center">${r.status}</td>
                                                        <td class="center">${r.roomCategoryEntity.area}</td>
                                                        <td class="center">${r.roomCategoryEntity.numberOfBed}</td>
                                                        <td class="center">${r.phoneNumber}</td>
                                                        <td class="center"><fmt:formatNumber maxFractionDigits  = "0" value = "${r.roomCategoryEntity.price}" currencySymbol="$" type = "currency"/></td>
                                                        <td class="center">
                                                            <button type="button" 
                                                                    onclick="location.href = '<c:url value="/management/update-room/${r.id}"/>'" 
                                                                    class="mdl-button mdl-js-button mdl-button--primary margin-right-10">
                                                                <i class="fa fa-pencil"></i>
                                                            </button>
                                                            <button type="button"
                                                                    onclick="location.href = '<c:url value="/management/delete-room/${r.id}"/>'"    
                                                                    class="btn btn-tbl-delete btn-xs">
                                                                <i class="fa fa-trash-o "></i>
                                                            </button>
                                                        </td>
                                                    </tr> 
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="../include/management/footer.jsp" />
        </div>
        <jsp:include page="../include/management/js-page.jsp" />
    </body>
</html>
