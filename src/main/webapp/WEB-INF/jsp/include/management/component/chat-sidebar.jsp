
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sidebar</title>
    </head>
    <body>
        <div class="chat-sidebar-container" data-close-on-body-click="false">
            <div class="chat-sidebar">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="#quick_sidebar_tab_1" class="nav-link active tab-icon"  data-toggle="tab">Theme
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#quick_sidebar_tab_2" class="nav-link tab-icon"  data-toggle="tab"> Chat
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#quick_sidebar_tab_3" class="nav-link tab-icon"  data-toggle="tab">  Settings
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <jsp:include page="../chat-sidebar-component/themes.jsp" />
                    <!-- Start Doctor Chat --> 
                    <jsp:include page="../chat-sidebar-component/chat.jsp" />
                    <!-- End Doctor Chat --> 
                    <!-- Start Setting Panel --> 
                    <jsp:include page="../chat-sidebar-component/settings.jsp" />
                </div>
            </div>
        </div>
    </body>
</html>
