<%-- 
    Document   : card-noti
    Created on : Aug 1, 2022, 7:44:52 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-md-4 col-sm-12 col-12">
            <div class="card  card-box">
                <div class="card-head">
                    <header>Notifications</header>
                    <div class="tools">
                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                        <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                        <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                    </div>
                </div>
                <div class="card-body no-padding height-9">
                    <div class="row">
                        <div class="noti-information notification-menu">
                            <div class="notification-list mail-list not-list small-slimscroll-style">
                                <a href="javascript:;" class="single-mail"> <span class="icon bg-primary"> <i class="fa fa-user-o"></i>
                                    </span> <span class="text-purple">Abhay Jani</span> Added you as friend
                                    <span class="notificationtime">
                                        <small>Just Now</small>
                                    </span>
                                </a>
                                <a href="javascript:;" class="single-mail"> <span class="icon blue-bgcolor"> <i class="fa fa-envelope-o"></i>
                                    </span> <span class="text-purple">John Doe</span> send you a mail
                                    <span class="notificationtime">
                                        <small>Just Now</small>
                                    </span>
                                </a>
                                <a href="javascript:;" class="single-mail"> <span class="icon bg-success"> <i class="fa fa-check-square-o"></i>
                                    </span> Success Message
                                    <span class="notificationtime">
                                        <small> 2 Days Ago</small>
                                    </span>
                                </a>
                                <a href="javascript:;" class="single-mail"> <span class="icon bg-warning"> <i class="fa fa-warning"></i>
                                    </span> <strong>Database Overloaded Warning!</strong>
                                    <span class="notificationtime">
                                        <small>1 Week Ago</small>
                                    </span>
                                </a>
                                <a href="javascript:;" class="single-mail"> <span class="icon bg-primary"> <i class="fa fa-user-o"></i>
                                    </span> <span class="text-purple">Abhay Jani</span> Added you as friend
                                    <span class="notificationtime">
                                        <small>Just Now</small>
                                    </span>
                                </a>
                                <a href="javascript:;" class="single-mail"> <span class="icon blue-bgcolor"> <i class="fa fa-envelope-o"></i>
                                    </span> <span class="text-purple">John Doe</span> send you a mail
                                    <span class="notificationtime">
                                        <small>Just Now</small>
                                    </span>
                                </a>
                                <a href="javascript:;" class="single-mail"> <span class="icon bg-success"> <i class="fa fa-check-square-o"></i>
                                    </span> Success Message
                                    <span class="notificationtime">
                                        <small> 2 Days Ago</small>
                                    </span>
                                </a>
                                <a href="javascript:;" class="single-mail"> <span class="icon bg-warning"> <i class="fa fa-warning"></i>
                                    </span> <strong>Database Overloaded Warning!</strong>
                                    <span class="notificationtime">
                                        <small>1 Week Ago</small>
                                    </span>
                                </a>
                                <a href="javascript:;" class="single-mail"> <span class="icon bg-danger"> <i class="fa fa-times"></i>
                                    </span> <strong>Server Error!</strong>
                                    <span class="notificationtime">
                                        <small>10 Days Ago</small>
                                    </span>
                                </a>
                            </div>
                            <div class="full-width text-center p-t-10" >
                                <button type="button" class="btn purple btn-outline btn-circle margin-0">View All</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
