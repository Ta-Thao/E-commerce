<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/12/22
  Time: 4:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="description" content="Responsive Admin Template" />
    <meta name="author" content="SmartUniversity" />
    <title>Edit Staff</title>
    <jsp:include page="../include/management/css-page.jsp"/>
</head>
<!-- END HEAD -->
<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
<div class="page-wrapper">
    <!-- start header -->
    <div class="page-header navbar navbar-fixed-top">
        <jsp:include page="../include/management/header.jsp"/>
    </div>
    <!-- end header -->
    <!-- start page container -->
    <div class="page-container">
        <!-- start sidebar menu -->
        <jsp:include page="../include/management/manager-side.jsp"/>
        <!-- end sidebar menu -->
        <!-- start page content -->
        <div class="page-content-wrapper">
            <div class="page-content">
                <form:form action="${pageContext.request.contextPath} ${action}" method="post" modelAttribute="account">
                <div class="page-bar">
                <c:if test="${action.equals('/admin/update-user')}">
                    <div class="page-title-breadcrumb">
                        <div class=" pull-left">
                            <div class="page-title">Edit Staff Details</div>
                        </div>

                        <ol class="breadcrumb page-breadcrumb pull-right">
                            <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/admin/home-admin"/>">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                            </li>
                            <li><a class="parent-item" href="">Staff</a>&nbsp;<i class="fa fa-angle-right"></i>
                            </li>
                            <li class="active">Edit Staff Details</li>
                        </ol>
                    </div>
                </c:if>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box">
                            <div class="card-head">
                                <header>Basic Information</header>
                                <button id = "panel-button"
                                        class = "mdl-button mdl-js-button mdl-button--icon pull-right"
                                        data-upgraded = ",MaterialButton">
                                    <i class = "material-icons">more_vert</i>
                                </button>
                                <ul class = "mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                                    data-mdl-for = "panel-button">
                                    <li class = "mdl-menu__item"><i class="material-icons">assistant_photo</i>Action</li>
                                    <li class = "mdl-menu__item"><i class="material-icons">print</i>Another action</li>
                                    <li class = "mdl-menu__item"><i class="material-icons">favorite</i>Something else here</li>
                                </ul>
                            </div>
                            <div class="card-body row">
                                <c:if test="${action.equals('/admin/update-user')}">
                                <div class="col-lg-6 p-t-20">
                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                        <form:input path="id" type = "text" class = "mdl-textfield__input" id="id" placeholder="ID" disabled="true"/>
                                        <label class = "mdl-textfield__label">ID User</label>
                                    </div>
                                </div>
                                </c:if>
                                <div class="col-lg-6 p-t-20">
                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                        <form:input path="fullName" type = "text" class = "mdl-textfield__input" id="fullName" required="true"/>
                                        <label class = "mdl-textfield__label">Full Name</label>
                                    </div>
                                </div>
                                <div class="col-lg-6 p-t-20">
                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                        <form:input path="address" class = "mdl-textfield__input" type = "text" id = "address"/>
                                        <label class = "mdl-textfield__label" >Address</label>
                                    </div>
                                </div>
                                <div class="col-lg-6 p-t-20">
                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                        <form:input path="email" class = "mdl-textfield__input" type = "email" id = "email" />
                                        <label class = "mdl-textfield__label" >Email</label>
                                        <span class = "mdl-textfield__error">Enter Valid Email Address!</span>
                                    </div>
                                </div>
                                <div class="col-lg-6 p-t-20">
                                    <label class="control-label col-lg-2">Status</label>
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                       <select class="form-control" name="status">
                                           <option value="">- Choose Status -</option>
                                                    <c:forEach items="${statusUser}" var="s">

                                                        <c:if test="${s == account.status}">
                                                            <option value="${s}" selected>${s}</option>
                                                        </c:if>
                                                        <c:if test="${s != account.status}">
                                                            <option value="${s}">${s}</option>
                                                        </c:if>
                                                    </c:forEach>
                                            </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 p-t-20">
                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                        <form:input class = "mdl-textfield__input" type = "text" path="phoneNumber" id = "phoneNumber"
                                                   pattern = "-?[0-9]*(\.[0-9]+)?"/>
                                        <label class = "mdl-textfield__label" for = "phoneNumber">Mobile Number</label>
                                        <span class = "mdl-textfield__error">Number required!</span>
                                    </div>
                                </div>
                                <div class="col-lg-12 p-t-20 text-center">
                                    <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
                                    <button type="reset" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </form:form>
        </div>
        </div>
        <!-- end page content -->
        <!-- start chat sidebar -->
        <jsp:include page="../include/management/component/chat-sidebar.jsp" />
        <!-- end chat sidebar -->

    </div>
    <!-- end page container -->
    <!-- start footer -->
    <jsp:include page="../include/management/footer.jsp" />
    <!-- end footer -->
</div>
<jsp:include page="../include/management/js-page.jsp"/>
</body>
</html>
