<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-header-inner ">
  <div class="page-logo">
    <a href="<c:url value="/"/>">
      <img alt="" src="<c:url value="/resources-management/img/logo.png"/> ">
      <span class="logo-default" >Matrix</span> </a>
  </div>
  <ul class="nav navbar-nav navbar-left in">
    <li><a href="#" class="menu-toggler sidebar-toggler"><i class="icon-menu"></i></a></li>
  </ul>
  <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
    <span></span>
  </a>
  <jsp:include page="top-menu.jsp" />
</div>