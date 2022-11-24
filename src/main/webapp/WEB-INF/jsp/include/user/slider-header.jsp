<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<div class="slider-area">
    <!-- Slider -->
    <div class="block-slider block-slider4">
        <ul class="" id="bxslider-home4">
            <c:forEach items="${promotion}" var="p">
                <li>
                    <img src="/resources/img/promotion/${p.promotionImgUrl}" alt="Slide">
                    <div class="caption-group">
                        <h2 class="caption title">
                            <span class="primary"><strong>${p.promotionDes}</strong></span>
                        </h2>
                        <h4 class="caption subtitle">${p.promotionName}</h4>
                        <a class="caption button-radius" href="user/shop"><span class="icon"></span>Shop now</a>
                    </div>
                </li>
            </c:forEach>

        </ul>
    </div>
    <!-- ./Slider -->
</div> <!-- End slider area -->
</body>
</html>
