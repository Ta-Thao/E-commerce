<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
// ko dung den
<li class="nav-item">
    <a href="javascript:;" class="nav-link nav-toggle">
        <i class="material-icons">slideshow</i>
        <span class="title">Multi Level Menu</span>
        <span class="arrow "></span>
    </a>
    <ul class="sub-menu">
        <li class="nav-item">
            <a href="javascript:;" class="nav-link nav-toggle">
                <i class="fa fa-university"></i> Item 1
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <li class="nav-item">
                    <a href="javascript:;" class="nav-link nav-toggle">
                        <i class="fa fa-bell-o"></i> Arrow Toggle
                        <span class="arrow "></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="javascript:;" class="nav-link">
                                <i class="fa fa-calculator"></i> Sample Link 1</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="fa fa-clone"></i> Sample Link 2</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="fa fa-cogs"></i> Sample Link 3</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fa fa-file-pdf-o"></i> Sample Link 1</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fa fa-rss"></i> Sample Link 2</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fa fa-hdd-o"></i> Sample Link 3</a>
                </li>
            </ul>
        </li>
        <li class="nav-item">
            <a href="javascript:;" class="nav-link nav-toggle">
                <i class="fa fa-gavel"></i> Arrow Toggle
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fa fa-paper-plane"></i> Sample Link 1</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fa fa-power-off"></i> Sample Link 1</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fa fa-recycle"></i> Sample Link 1
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item">
            <a href="#" class="nav-link">
                <i class="fa fa-volume-up"></i> Item 3 </a>
        </li>
    </ul>
</li>