<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Apple Shop</title>

  <!-- Google Fonts -->
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
  <!-- Bootstrap -->
  <link rel="stylesheet"  href="<c:url value="/resources/css/bootstrap.min.css"/>">
<%--  <link rel='stylesheet' href='/webjars/bootstrap/3.3.7/css/bootstrap.min.css'>--%>
  <link href="/resources/css/bootstrap-rating.css" rel="stylesheet">
  <script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"/>"></script>
  <script type="text/javascript" src="/resources/js/bootstrap-rating.min.js"></script>
  <script src="<c:url value="/resources/js/ajax.js"/>"></script>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/> ">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/style.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/css/responsive.css"/> ">


  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

<%--  <!-- Css Styles -->--%>
<%--  <link rel="stylesheet" href="/resources/css/css/bootstrap.min.css" type="text/css">--%>
<%--  <link rel="stylesheet" href="/resources/css/css/font-awesome.min.css" type="text/css">--%>
<%--  <link rel="stylesheet" href="/resources/css/css/elegant-icons.css" type="text/css">--%>
<%--  <link rel="stylesheet" href="/resources/css/css/nice-select.css" type="text/css">--%>
<%--  <link rel="stylesheet" href="/resources/css/css/jquery-ui.min.css" type="text/css">--%>
<%--  <link rel="stylesheet" href="/resources/css/css/owl.carousel.min.css" type="text/css">--%>
<%--  <link rel="stylesheet" href="/resources/css/css/slicknav.min.css" type="text/css">--%>
<%--  <link rel="stylesheet" href="/resources/css/css/style.css" type="text/css">--%>

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>

  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<div class="header-area">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <div class="user-menu">
          <ul class="list-unstyled list-inline">
            <li>
              <c:if test="${username == null}">
                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key"><i class="fa fa-user"></i> My Account<b class="caret"></b></span></a>
              </c:if>
              <c:if test="${username != null}">
                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key"><i class="fa fa-user">${username}</i><b class="caret"></b></span></a>
                <ul class="dropdown-menu">
                  <li><a href="/user/cart/${id}"><i class="fa fa-user"></i> View Ordered</a></li>
                  <li><a href="/user/checkout/${id}">Checkout</a></li>
                 <li><a href="/edit/${id}">Change Password</a></li>
                  <li><a href="/logout"><i class="fa fa-user"></i> Logout</a></li>
                </ul>
                </c:if>
            </li>


            <c:if test="${username == null}">
              <li><a href="/login"><i class="fa fa-user"></i> Login</a></li>
              <li><a href="/register"><i class="fa fa-user"></i> Register</a></li>
              <li><a href="/user/checkout"><i class="fa fa-user"></i> Checkout</a></li>
            </c:if>

          </ul>
        </div>
      </div>

      <div class="col-md-4">
        <div class="header-right">
          <ul class="list-unstyled list-inline">
            <li class="dropdown dropdown-small">
              <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key">currency :</span><span class="value">USD </span><b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">USD</a></li>
                <li><a href="#">INR</a></li>
                <li><a href="#">GBP</a></li>
              </ul>
            </li>

            <li class="dropdown dropdown-small">
              <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key">Language :</span><span class="value">English </span><b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">English</a></li>
                <li><a href="#">Vie</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div> <!-- End header area -->
<div class="site-branding-area">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-sm-4">
        <div class="logo">
          <h1><a href="/" class="bi bi"><i class="fa fa-apple"></i></a></h1>
        </div>
      </div>

      <div class="col-md-6 col-sm-4">
        <div class="shopping-item">
          <a href="/user/cart">Cart<i class="fa fa-shopping-cart"></i></a>
        </div>
      </div>
    </div>
  </div>
</div> <!-- End site branding area -->

<div class="mainmenu-area">
  <div class="container">
    <div class="row">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
          <li class=""><a href="/">Store</a></li>
          <li><a href="/user/shop">Shop page</a></li>
          <li><a href="/user/cart">Cart</a></li>
          <li><a href="/user/checkout">Checkout</a></li>
          <li><a href="#">Others</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
        <form:form action="/user/search" method="get">
          <form class="d-flex" role="search">
            <div class="input-group">
              <input name="searchInput" type="text" class="form-control me-" placeholder="Search For ..." aria-label="Search"/>
              <span class="input-group-btn">
                <button class="btn btn-success button" type="submit">
                  Search
                </button>
              </span>
            </div>
          </form>
        </form:form>
      </div>
    </div>
  </div>
</div> <!-- End mainmenu area -->
</html>
