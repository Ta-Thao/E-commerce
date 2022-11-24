
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders Page</title>
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
                                    <div class="page-title">All Orders</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item" href="">Orders</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">All Orders</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>All Orders</header>
                                        <div class="tools">
                                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                            <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                        </div>
                                    </div>
                                    <div class="card-body ">
                                        <div class="row p-b-20">
                                            <div class="col-md-6 col-sm-6 col-6">
                                                
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
                                        <table  class="table table-hover table-checkable order-column full-width" id="example1">
                                            <thead>
                                                <tr>
                                                    <th class="center"> Orders ID </th>
                                                    <th class="center"> Phone Number </th>
                                                    <th class="center"> Total Price </th>
                                                    <th class="center"> Booking date </th>
                                                    <th class="center"> Status </th>
                                                    <th class="center"> Action </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${bookings}" var="b">
                                                    <c:forEach items="${totalPrice}" var="map">
                                                        <c:if test="${b.id == map.key}">
                                                            <tr class="odd gradeX">
                                                                <td class="center">${b.accountEntity.fullName}</td>
                                                                <td class="center">${b.accountEntity.phoneNumber}</td>
                                                                <td class="center"><fmt:formatNumber maxFractionDigits  = "0" value = "${map.value}" currencySymbol="$" type = "currency"/></td>
                                                                <td class="center">${b.bookingDate}</td>
                                                                <td class="center">${b.status}</td>
                                                                <td class="center">
                                                                    <button type="button" 
                                                                            onclick="location.href = '<c:url value="/management/update-booking/${b.id}"/>'" 
                                                                            class="mdl-button mdl-js-button mdl-button--primary margin-right-10">
                                                                        <i class="fa fa-pencil"></i>
                                                                    </button>
                                                                    <button type="button"
                                                                            onclick="location.href = '<c:url value="/management/delete-booking/${b.id}"/>'"    
                                                                            class="btn btn-tbl-delete btn-xs">
                                                                        <i class="fa fa-trash-o "></i>
                                                                    </button>
                                                                </td>
                                                            </tr> 
                                                        </c:if>
                                                    </c:forEach>
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
        <script src="<c:url value="/resources-management/plugins/datatables/jquery.dataTables.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js"/>" ></script>
        <script src="<c:url value="/resources-management/js/pages/table/table_data.js"/>" ></script>
    </body>
</html>
