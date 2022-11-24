
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="tab-pane chat-sidebar-chat animated slideInRight" id="quick_sidebar_tab_2">
            <div class="chat-sidebar-list">
                <div class="chat-sidebar-chat-users slimscroll-style" data-rail-color="#ddd" data-wrapper-class="chat-sidebar-list">
                    <div class="chat-header"><h5 class="list-heading">Online</h5></div>
                    <ul class="media-list list-items">
                        <li class="media"><img class="media-object" src="/resources-management/img/user/user3.jpg" width="35" height="35" alt="...">
                            <i class="online dot"></i>
                            <div class="media-body">
                                <h5 class="media-heading">John Deo</h5>
                                <div class="media-heading-sub">Spine Surgeon</div>
                            </div>
                        </li>
                        <li class="media">
                            <div class="media-status">
                                <span class="badge badge-success">5</span>
                            </div> <img class="media-object" src="/resources-management/img/user/user1.jpg" width="35" height="35" alt="...">
                            <i class="busy dot"></i>
                            <div class="media-body">
                                <h5 class="media-heading">Rajesh</h5>
                                <div class="media-heading-sub">Director</div>
                            </div>
                        </li>
                        <li class="media"><img class="media-object" src="/resources-management/img/user/user5.jpg" width="35" height="35" alt="...">
                            <i class="away dot"></i>
                            <div class="media-body">
                                <h5 class="media-heading">Jacob Ryan</h5>
                                <div class="media-heading-sub">Ortho Surgeon</div>
                            </div>
                        </li>
                        <li class="media">
                            <div class="media-status">
                                <span class="badge badge-danger">8</span>
                            </div> <img class="media-object" src="/resources-management/img/user/user4.jpg" width="35" height="35" alt="...">
                            <i class="online dot"></i>
                            <div class="media-body">
                                <h5 class="media-heading">Kehn Anderson</h5>
                                <div class="media-heading-sub">CEO</div>
                            </div>
                        </li>
                        <li class="media"><img class="media-object" src="/resources-management/img/user/user2.jpg" width="35" height="35" alt="...">
                            <i class="busy dot"></i>
                            <div class="media-body">
                                <h5 class="media-heading">Sarah Smith</h5>
                                <div class="media-heading-sub">Anaesthetics</div>
                            </div>
                        </li>
                        <li class="media"><img class="media-object" src="/resources-management/img/user/user7.jpg" width="35" height="35" alt="...">
                            <i class="online dot"></i>
                            <div class="media-body">
                                <h5 class="media-heading">Vlad Cardella</h5>
                                <div class="media-heading-sub">Cardiologist</div>
                            </div>
                        </li>
                    </ul>
                    <div class="chat-header"><h5 class="list-heading">Offline</h5></div>
                    <ul class="media-list list-items">
                        <li class="media">
                            <div class="media-status">
                                <span class="badge badge-warning">4</span>
                            </div> <img class="media-object" src="/resources-management/img/user/user6.jpg" width="35" height="35" alt="...">
                            <i class="offline dot"></i>
                            <div class="media-body">
                                <h5 class="media-heading">Jennifer Maklen</h5>
                                <div class="media-heading-sub">Nurse</div>
                                <div class="media-heading-small">Last seen 01:20 AM</div>
                            </div>
                        </li>
                        <li class="media"><img class="media-object" src="/resources-management/img/user/user8.jpg" width="35" height="35" alt="...">
                            <i class="offline dot"></i>
                            <div class="media-body">
                                <h5 class="media-heading">Lina Smith</h5>
                                <div class="media-heading-sub">Ortho Surgeon</div>
                                <div class="media-heading-small">Last seen 11:14 PM</div>
                            </div>
                        </li>
                        <li class="media">
                            <div class="media-status">
                                <span class="badge badge-success">9</span>
                            </div> <img class="media-object" src="/resources-management/img/user/user9.jpg" width="35" height="35" alt="...">
                            <i class="offline dot"></i>
                            <div class="media-body">
                                <h5 class="media-heading">Jeff Adam</h5>
                                <div class="media-heading-sub">Compounder</div>
                                <div class="media-heading-small">Last seen 3:31 PM</div>
                            </div>
                        </li>
                        <li class="media"><img class="media-object" src="/resources-management/img/user/user10.jpg" width="35" height="35" alt="...">
                            <i class="offline dot"></i>
                            <div class="media-body">
                                <h5 class="media-heading">Anjelina Cardella</h5>
                                <div class="media-heading-sub">Physiotherapist</div>
                                <div class="media-heading-small">Last seen 7:45 PM</div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="chat-sidebar-item">
                <div class="chat-sidebar-chat-user">
                    <div class="page-quick-sidemenu">
                        <a href="javascript:;" class="chat-sidebar-back-to-list">
                            <i class="fa fa-angle-double-left"></i>Back
                        </a>
                    </div>
                    <div class="chat-sidebar-chat-user-messages">
                        <div class="post out">
                            <img class="avatar" alt="" src="/resources-management/img/dp.jpg" />
                            <div class="message">
                                <span class="arrow"></span> <a href="javascript:;" class="name">Kiran Patel</a> <span class="datetime">9:10</span>
                                <span class="body-out"> could you send me menu icons ? </span>
                            </div>
                        </div>
                        <div class="post in">
                            <img class="avatar" alt="" src="/resources-management/img/user/user5.jpg" />
                            <div class="message">
                                <span class="arrow"></span> <a href="javascript:;" class="name">Jacob Ryan</a> <span class="datetime">9:10</span>
                                <span class="body"> please give me 10 minutes. </span>
                            </div>
                        </div>
                        <div class="post out">
                            <img class="avatar" alt="" src="/resources-management/img/dp.jpg" />
                            <div class="message">
                                <span class="arrow"></span> <a href="javascript:;" class="name">Kiran Patel</a> <span class="datetime">9:11</span>
                                <span class="body-out"> ok fine :) </span>
                            </div>
                        </div>
                        <div class="post in">
                            <img class="avatar" alt="" src="/resources-management/img/user/user5.jpg" />
                            <div class="message">
                                <span class="arrow"></span> <a href="javascript:;" class="name">Jacob Ryan</a> <span class="datetime">9:22</span>
                                <span class="body">Sorry for
                                    the delay. i sent mail to you. let me know if it is ok or not.</span>
                            </div>
                        </div>
                        <div class="post out">
                            <img class="avatar" alt="" src="/resources-management/img/dp.jpg" />
                            <div class="message">
                                <span class="arrow"></span> <a href="javascript:;" class="name">Kiran Patel</a> <span class="datetime">9:26</span>
                                <span class="body-out"> it is perfect! :) </span>
                            </div>
                        </div>
                        <div class="post out">
                            <img class="avatar" alt="" src="/resources-management/img/dp.jpg" />
                            <div class="message">
                                <span class="arrow"></span> <a href="javascript:;" class="name">Kiran Patel</a> <span class="datetime">9:26</span>
                                <span class="body-out"> Great! Thanks. </span>
                            </div>
                        </div>
                        <div class="post in">
                            <img class="avatar" alt="" src="/resources-management/img/user/user5.jpg" />
                            <div class="message">
                                <span class="arrow"></span> <a href="javascript:;" class="name">Jacob Ryan</a> <span class="datetime">9:27</span>
                                <span class="body"> it is my pleasure :) </span>
                            </div>
                        </div>
                    </div>
                    <div class="chat-sidebar-chat-user-form">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Type a message here...">
                            <div class="input-group-btn">
                                <button type="button" class="btn deepPink-bgcolor">
                                    <i class="fa fa-arrow-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
