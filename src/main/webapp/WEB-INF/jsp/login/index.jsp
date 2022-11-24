<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<jsp:include page="../include/user/header.jsp"/>
<jsp:include page="../include/user/slider-header.jsp"/>

<body>
<c:forEach var="cate" items="${cateList}">
<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-bit-title text-center">
                    <h2 class="section-title">${cate.categoryName}</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="maincontent-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="latest-product">
                    <div class="product-carousel">
                        <c:forEach items="${cate.productCategory}" var="p">
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="<c:url value="/resources/img/${p.proDesciption}"/>" alt="">
                                    <div class="product-hover">
<%--                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>--%>
                                        <a href="/user/viewProduct/${p.categoryEntity.id}/${p.id}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                <h2 href="/user/viewProduct/${p.categoryEntity.id}/${p.id}">${p.proName}</h2>
                                <a>${p.proFullDescription}</a>
                                <div class="product-carousel-price">
                                    <h4><ins>Price: $${p.unitPrice}</ins></h4>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</c:forEach>
<hr>
<div class="maincontent-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="latest-product">
                    <h2 class="section-title">Latest Products</h2>
                    <div class="product-carousel">
                        <c:forEach var="p" items="${productList}">
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="/resources/img/${p.proDesciption}" alt="${p.proName}">
                                    <div class="product-hover">
                                            <%--                                            <a href="#" id="add2cart_btn" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>--%>
                                        <a href="/user/viewProduct/${p.categoryEntity.id}/${p.id}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                <h2><a href="/user/viewProduct/${p.categoryEntity.id}/${p.id}">${p.proName}</a></h2>

                                <div class="product-carousel-price">
                                    <h3><ins>Price: ${p.unitPrice}</ins></h3>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End main content area -->

<hr>
<div class="product-widget-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="single-product-widget">
                    <h2 class="product-wid-title">Top Sellers</h2>
                    <a href="/user/shop" class="wid-view-more">View All</a>
                    <div class="single-wid-product">
                        <a href="/user/viewProduct/3/6"><img src="/resources/img/iphone-13-pro-max.png" alt="" class="product-thumb"></a>
                        <h2><a href="/user/viewProduct/3/6">Iphone 13 Pro Max</a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$1199.00</ins> <del>$1300.00</del>
                        </div>
                    </div>
                    <div class="single-wid-product">
                        <a href="/user/viewProduct/1/2"><img src="/resources/img/macbook-pro-m2.png" alt="" class="product-thumb"></a>
                        <h2><a href="/user/viewProduct/1/2">MacBook Pro 13 M2 </a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$1750.00</ins> <del>$1800.00</del>
                        </div>
                    </div>
                    <div class="single-wid-product">
                        <a href="/user/viewProduct/3/9"><img src="/resources/img/iphone-12.png" alt="" class="product-thumb"></a>
                        <h2><a href="/user/viewProduct/3/9">iPhone 12 256GB-Red Limited</a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$899.00</ins> <del>$1000.00</del>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-product-widget">
                    <h2 class="product-wid-title">Recently Viewed</h2>
                    <a href="/user/shop" class="wid-view-more">View All</a>
                    <div class="single-wid-product">
                        <a href="/user/viewProduct/3/6"><img src="/resources/img/iphone-13-pro-max.png" alt="" class="product-thumb"></a>
                        <h2><a href="/user/viewProduct/3/6">Iphone 13 Pro Max</a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$1199.00</ins> <del>$1300.00</del>
                        </div>
                    </div>
                    <div class="single-wid-product">
                        <a href="/user/viewProduct/1/1"><img src="/resources/img/macbook-pro-m1.png" alt="" class="product-thumb"></a>
                        <h2><a href="/user/viewProduct/1/1">Macbook Pro 13.3 M1 Chip 256GB</a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$1450.00</ins> <del>$1600.00</del>
                        </div>
                    </div>
                    <div class="single-wid-product">
                        <a href="/user/viewProduct/2/4"><img src="/resources/img/ipad-pro.png" alt="" class="product-thumb"></a>
                        <h2><a href="/user/viewProduct/2/4">iPad Pro M1 11 Wi‑Fi 128gb</a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$799.00</ins> <del>$900.00</del>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-product-widget">
                    <h2 class="product-wid-title">Top New</h2>
                    <a href="/user/shop" class="wid-view-more">View All</a>
                    <div class="single-wid-product">
                        <a href="/user/viewProduct/3/6"><img src="/resources/img/iphone-13-pro-max.png" alt="" class="product-thumb"></a>
                        <h2><a href="/user/viewProduct/3/6">Iphone 13 Pro Max</a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$1199.00</ins> <del>$1300.00</del>
                        </div>
                    </div>
                    <div class="single-wid-product">
                        <a href="/user/viewProduct/1/1"><img src="/resources/img/macbook-pro-m1.png" alt="" class="product-thumb"></a>
                        <h2><a href="/user/viewProduct/1/1">Macbook Pro 13.3 M1 Chip 256GB</a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$1450.00</ins> <del>$1600.00</del>
                        </div>
                    </div>
                    <div class="single-wid-product">
                        <a href="/user/viewProduct/1/2"><img src="/resources/img/macbook-pro-m2.png" alt="" class="product-thumb"></a>
                        <h2><a href="/user/viewProduct/1/2">MacBook Pro 13 M2 </a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins>$1750.00</ins> <del>$1800.00</del>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End product widget area -->

<jsp:include page="../include/user/footer.jsp"/>

<!-- Messenger Plugin chat Code -->
<div id="fb-root"></div>

<!-- Your Plugin chat code -->
<div id="fb-customer-chat" class="fb-customerchat">
</div>

<script>
    var chatbox = document.getElementById('fb-customer-chat');
    chatbox.setAttribute("page_id", "107427342183169");
    chatbox.setAttribute("attribution", "biz_inbox");
</script>

<!-- Your SDK code -->
<script>
    window.fbAsyncInit = function() {
        FB.init({
            xfbml            : true,
            version          : 'v15.0'
        });
    };

    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/vi_VN/sdk/xfbml.customerchat.js';
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>

<%--<!--Start of Tawk.to Script-->--%>
<%--<script type="text/javascript">--%>
<%--    var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();--%>
<%--    (function(){--%>
<%--        var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];--%>
<%--        s1.async=true;--%>
<%--        s1.src='https://embed.tawk.to/584a81734160416f6d9c2203/default';--%>
<%--        s1.charset='UTF-8';--%>
<%--        s1.setAttribute('crossorigin','*');--%>
<%--        s0.parentNode.insertBefore(s1,s0);--%>
<%--    })();--%>
<%--</script>--%>
<%--<!--End of Tawk.to Script-->--%>
<script>
    $(document).ready(function(){
        // handle when clicking on Add2Cart button
        $('#add2cart_btn').click(function(e) {
            e.preventDefault();

            let retrievedObject = JSON.parse(localStorage.getItem('shopping_cart'));
            if (retrievedObject == null) {
                retrievedObject = [];
            }
            let isItemExisting = false;

            <c:forEach items="${product}" var="pro">
            $(retrievedObject).each(function (index, item) {
                // product id = 3 is an example
                if (item.product_id == '${pro.id}') {
                    // if product already existing, then just update the number
                    item.quantity = item.quantity + Number($("#quantity_change_input").val());
                    isItemExisting = true;
                    return false;
                }
            });

            if (isItemExisting == false) {
                const new_product = {
                    product_id: '${pro.id}',
                    quantity: Number($("#quantity_change_input").val()),
                    img_source: '/resources/img/${pro.proDesciption}',
                    title: '${pro.proName}',
                    price : '${pro.unitPrice}'
                }
                retrievedObject.push(new_product);
                // update the cart badge number by 1
                $("#cart_item_quantity").text(Number($("#cart_item_quantity").html()) + 1);

            }
            localStorage.setItem('shopping_cart', JSON.stringify(retrievedObject));
            </c:forEach>

        });

        /*-------------------
          Quantity change - COPIED from main.js
         --------------------- */
        var proQty = $('.pro-qty');
        proQty.prepend('<span class="dec qtybtn">-</span>');
        proQty.append('<span class="inc qtybtn">+</span>');
        proQty.on('click', '.qtybtn', function () {
            var $button = $(this);
            var oldValue = $button.parent().find('input').val();
            if ($button.hasClass('inc')) {
                var newVal = parseFloat(oldValue) + 1;
            } else {
                // Don't allow decrementing below zero
                if (oldValue > 0) {
                    var newVal = parseFloat(oldValue) - 1;
                } else {
                    newVal = 0;
                }
            }
            $button.parent().find('input').val(newVal);
        });
    });

</script>
</body>
</html>