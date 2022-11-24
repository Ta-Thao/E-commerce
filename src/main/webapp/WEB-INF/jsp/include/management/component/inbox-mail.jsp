<%-- ko dung den--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inbox Page</title>
<%--        <jsp:include page="../include/css-page.jsp"/>--%>
            <jsp:include page="../css-page.jsp"


    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <div class="page-wrapper">
            <div class="page-header navbar navbar-fixed-top">
                <jsp:include page="../header.jsp"/>
            </div>
            <div class="page-container">
                <jsp:include page="../include/side.jsp"/>
            </div>
                <jsp:include page="../footer.jsp" />
        </div>
        <jsp:include page="../include/js-page.jsp" />
    </body>
</html>