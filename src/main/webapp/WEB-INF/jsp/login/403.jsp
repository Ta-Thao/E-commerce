<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/07/22
  Time: 7:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="description" content="Responsive Admin Template" />
    <meta name="author" content="SmartUniversity" />
    <title>Login</title>
    <jsp:include page="../include/management/css-page.jsp"/>
</head>
<body>
<div class="limiter">
    <div class="container-login100 page-background">
        <div class="wrap-login100">
            <form class="form-404">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-flower"></i>
					</span>
                <span class="form404-title p-b-34 p-t-27">
						Error 403
					</span>
                <p class="content-404">There is no way let you pass through!</p>
                <div class="container-login100-form-btn">
                    <button class="login100-form-btn">
                        Go to home page
                    </button>
                </div>
                <div class="text-center p-t-27">
                    <a class="txt1" href="#">
                        Need Help?
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="../include/management/js-page.jsp"/>
</body>
</html>