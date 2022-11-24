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
  <title>View Staff</title>
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
        <div class="page-bar">
          <div class="page-title-breadcrumb">
            <div class=" pull-left">
              <div class="page-title">All Staffs</div>
            </div>
            <ol class="breadcrumb page-breadcrumb pull-right">
              <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/admin/home-admin"/>">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
              </li>
              <li><a class="parent-item" href="">Staffs</a>&nbsp;<i class="fa fa-angle-right"></i>
              </li>
              <li class="active">All Staffs</li>
            </ol>
          </div>
        </div>
        <ul class="nav nav-pills nav-pills-rose">
          <li class="nav-item tab-all"><a class="nav-link active show"
                                          href="#tab1" data-toggle="tab">List View</a></li>
        </ul>
        <div class="tab-content tab-space">
          <div class="tab-pane active show" id="tab1">
            <div class="row">
              <div class="col-md-12">
                <div class="card-box">
                  <div class="card-head">
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
                  <div class="card-body ">
                    <div class="table-scrollable">
                      <c:if test="${not empty accountList}">
                      <table class="table table-hover table-checkable order-column full-width" id="example4">
                        <thead>
                        <tr>
                          <th class="center"> Full Name </th>
                          <th class="center"> Mobile </th>
                          <th class="center"> Email </th>
                          <th class="center"> Address </th>
                          <th class="center"> Status</th>
                          <th class="center"> Roles</th>
                          <th class="center"> Action </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${accountList}" var="a">
                        <tr class="odd gradeX">
                          <td class="center">${a.fullName}</td>
                          <td class="center"><a href="tel:${a.phoneNumber}">
                              ${a.phoneNumber} </a></td>
                          <td class="center"><a href="mailto:${a.email}">
                              ${a.email} </a></td>
                          <td class="center">${a.address}</td>

                          <td class="center">${a.status.toString()}</td>
                          <td class="center">
                            <table>
                              <c:forEach items="${a.roleOfAccount}" var="r">
                                  <td>${r.role.name()}</td>
                              </c:forEach>
                            </table>
                          </td>
                          <td class="center">
                            <button type="button"
                                    onclick="location.href = '<c:url value="/admin/update-user/${a.id}"/>'"
                                    class="mdl-button mdl-js-button mdl-button--primary margin-right-10">
                              <i class="fa fa-pencil"></i>
                            </button>
                            <button type="button"
                                    onclick="location.href = '<c:url value="/admin/delete-user/${a.id}"/>'"
                                    class="btn btn-tbl-delete btn-xs">
                              <i class="fa fa-trash-o "></i>
                            </button>
                          </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                      </table>
                      </c:if>
                      <c:if test="${accountList.size()==0}">
                        <div>
                          <p style="color: red; text-align: center;font-size: 20px;">
                            There is no data
                          </p>
                        </div>
                      </c:if>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
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
