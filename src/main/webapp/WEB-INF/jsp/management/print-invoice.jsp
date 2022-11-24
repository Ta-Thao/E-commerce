
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invoice Page</title>
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
                        <div class="row">
                            <div class="col-md-12">
                                <div class="white-box">
                                    <h3><b>INVOICE</b> <span class="pull-right">#${booking.id}</span></h3>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="pull-left">
                                                <address>
                                                    <img width="100" height="30" src="<c:url value="/resources/image/logo-matrix.png"/>" alt="logo" class="logo-default" />
                                                    <p class="text-muted m-l-5">
                                                        Matrix Hotel, <br> Opp. Town Hall, <br>
                                                        Spring Road, <br> Java - 550000
                                                    </p>
                                                </address>
                                            </div>
                                            <div class="pull-right text-right">
                                                <address>
                                                    <p class="addr-font-h3">To,</p>
                                                    <p class="font-bold addr-font-h4">${booking.accountEntity.fullName}</p>
                                                    <p class="text-muted m-l-30">
                                                        ${booking.accountEntity.address}
                                                    </p>
                                                    <p class="m-t-30">
                                                        <b>Invoice Date :</b> <i class="fa fa-calendar"></i> 
                                                        <jsp:useBean id="now" class="java.util.Date"/>    
                                                        <fmt:formatDate value="${now}" pattern="dd-MM-yyyy" />
                                                    </p>
                                                </address>
                                            </div>
                                        </div>
                                        <c:forEach items="${totalPrice}" var="map">
                                            <div class="col-md-12">
                                                <div class="table-responsive m-t-40">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th class="text-center">Booking Date</th>
                                                                <th class="text-center">From</th>
                                                                <th class="text-center">To</th>
                                                                <th class="text-right">Amount</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td class="text-center">${booking.bookingDate}</td>
                                                                <td class="text-center">${booking.checkIn}</td>
                                                                <td class="text-center">${booking.checkOut}</td>
                                                                <td class="text-right"><fmt:formatNumber maxFractionDigits  = "0" value = "${map.value}" currencySymbol="$" type = "currency"/></td>                                                                
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="pull-right m-t-30 text-right">
                                                    <p>Sub - Total amount: <fmt:formatNumber maxFractionDigits  = "0" value = "${map.value}" currencySymbol="$" type = "currency"/></p>
                                                    <p>Tax (10%) : <fmt:formatNumber maxFractionDigits  = "1" value = "${map.value * 0.1}" currencySymbol="$" type = "currency"/> </p>
                                                    <hr>
                                                    <h3><b>Total :</b> <fmt:formatNumber maxFractionDigits  = "1" value = "${map.value * 1.1}" currencySymbol="$" type = "currency"/></h3> </div>
                                                <div class="clearfix"></div>
                                                <hr>
                                                <div class="text-right">
                                                    <button onclick="javascript:window.print();" class="btn btn-default btn-outline" type="button"> <span><i class="fa fa-print"></i> Print</span> </button>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="../include/management/component/chat-sidebar.jsp" />
        </div>
        <jsp:include page="../include/management/footer.jsp" />
        <jsp:include page="../include/management/js-page.jsp" />
    </body>
</html>
