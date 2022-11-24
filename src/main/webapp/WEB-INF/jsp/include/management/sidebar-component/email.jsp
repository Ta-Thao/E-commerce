<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
// gan nhu khong dung
<li class="nav-item">
    <a href="#" class="nav-link nav-toggle">
        <i class="material-icons">email</i>
        <span class="title">Email</span>
        <span class="arrow"></span>
        <span class="label label-rouded label-menu label-danger">new</span>
    </a>
    <ul class="sub-menu">
        <li class="nav-item">
            <a href="inbox-mail.jsp" class="nav-link ">
                <span class="title" onclick="location.href = '<c:url value="/viewInbox/${r.id}"/>'">Inbox</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="email_view.html" class="nav-link ">
                <span class="title">View Mail</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="email_compose.html" class="nav-link ">
                <span class="title">Compose Mail</span>
            </a>
        </li>
    </ul>
</li>