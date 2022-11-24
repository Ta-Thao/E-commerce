
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="page-content">
            <jsp:include page="../page-component/pagebar.jsp" />
            <jsp:include page="../page-component/page-widget.jsp" />
            <jsp:include page="../page-component/chart.jsp" />
            <div class="row">
                <jsp:include page="../page-component/card-box.jsp" />
                <jsp:include page="../page-component/card-noti.jsp" />
                <jsp:include page="../page-component/card-noti.jsp" />
            </div>
        </div>
    </body>
</html>
