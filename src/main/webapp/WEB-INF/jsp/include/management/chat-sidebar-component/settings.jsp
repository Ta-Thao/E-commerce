
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="tab-pane chat-sidebar-settings animated slideInUp" id="quick_sidebar_tab_3">
            <div class="chat-sidebar-settings-list slimscroll-style">
                <div class="chat-header"><h5 class="list-heading">Layout Settings</h5></div>
                <div class="chatpane inner-content ">
                    <div class="settings-list">
                        <div class="setting-item">
                            <div class="setting-text">Sidebar Position</div>
                            <div class="setting-set">
                                <select class="sidebar-pos-option form-control input-inline input-sm input-small ">
                                    <option value="left" selected="selected">Left</option>
                                    <option value="right">Right</option>
                                </select>
                            </div>
                        </div>
                        <div class="setting-item">
                            <div class="setting-text">Header</div>
                            <div class="setting-set">
                                <select class="page-header-option form-control input-inline input-sm input-small ">
                                    <option value="fixed" selected="selected">Fixed</option>
                                    <option value="default">Default</option>
                                </select>
                            </div>
                        </div>
                        <div class="setting-item">
                            <div class="setting-text">Sidebar Menu </div>
                            <div class="setting-set">
                                <select class="sidebar-menu-option form-control input-inline input-sm input-small ">
                                    <option value="accordion" selected="selected">Accordion</option>
                                    <option value="hover">Hover</option>
                                </select>
                            </div>
                        </div>
                        <div class="setting-item">
                            <div class="setting-text">Footer</div>
                            <div class="setting-set">
                                <select class="page-footer-option form-control input-inline input-sm input-small ">
                                    <option value="fixed">Fixed</option>
                                    <option value="default" selected="selected">Default</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="chat-header"><h5 class="list-heading">Account Settings</h5></div>
                    <div class="settings-list">
                        <div class="setting-item">
                            <div class="setting-text">Notifications</div>
                            <div class="setting-set">
                                <div class="switch">
                                    <label class = "mdl-switch mdl-js-switch mdl-js-ripple-effect" 
                                           for = "switch-1">
                                        <input type = "checkbox" id = "switch-1" 
                                               class = "mdl-switch__input" checked>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setting-item">
                            <div class="setting-text">Show Online</div>
                            <div class="setting-set">
                                <div class="switch">
                                    <label class = "mdl-switch mdl-js-switch mdl-js-ripple-effect" 
                                           for = "switch-7">
                                        <input type = "checkbox" id = "switch-7" 
                                               class = "mdl-switch__input" checked>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setting-item">
                            <div class="setting-text">Status</div>
                            <div class="setting-set">
                                <div class="switch">
                                    <label class = "mdl-switch mdl-js-switch mdl-js-ripple-effect" 
                                           for = "switch-2">
                                        <input type = "checkbox" id = "switch-2" 
                                               class = "mdl-switch__input" checked>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setting-item">
                            <div class="setting-text">2 Steps Verification</div>
                            <div class="setting-set">
                                <div class="switch">
                                    <label class = "mdl-switch mdl-js-switch mdl-js-ripple-effect" 
                                           for = "switch-3">
                                        <input type = "checkbox" id = "switch-3" 
                                               class = "mdl-switch__input" checked>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="chat-header"><h5 class="list-heading">General Settings</h5></div>
                    <div class="settings-list">
                        <div class="setting-item">
                            <div class="setting-text">Location</div>
                            <div class="setting-set">
                                <div class="switch">
                                    <label class = "mdl-switch mdl-js-switch mdl-js-ripple-effect" 
                                           for = "switch-4">
                                        <input type = "checkbox" id = "switch-4" 
                                               class = "mdl-switch__input" checked>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setting-item">
                            <div class="setting-text">Save Histry</div>
                            <div class="setting-set">
                                <div class="switch">
                                    <label class = "mdl-switch mdl-js-switch mdl-js-ripple-effect" 
                                           for = "switch-5">
                                        <input type = "checkbox" id = "switch-5" 
                                               class = "mdl-switch__input" checked>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setting-item">
                            <div class="setting-text">Auto Updates</div>
                            <div class="setting-set">
                                <div class="switch">
                                    <label class = "mdl-switch mdl-js-switch mdl-js-ripple-effect" 
                                           for = "switch-6">
                                        <input type = "checkbox" id = "switch-6" 
                                               class = "mdl-switch__input" checked>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
