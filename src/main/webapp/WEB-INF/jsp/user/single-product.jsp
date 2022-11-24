<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../include/user/header.jsp"/>
<body>
<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-bit-title text-center">
                    <h2>Shop</h2>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <c:forEach items="${product}" var="pro" >
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                 src="/resources/img/${pro.proDesciption}" alt="">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                            <c:forEach items="${pro.productImages}" var="pImg">
                                <img data-imgbigurl="/resources/img/${pImg.imageUrlMain}/${pImg.imageUrl}"
                                     src="/resources/img/${pImg.imageUrlMain}/${pImg.imageUrl}" alt="">
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${pro.proName}</h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            &nbsp&nbsp&nbsp&nbsp
                            <a href="http://localhost:8080/user/viewProduct/${pro.categoryEntity.id}/${pro.id}#tabs-3"><span href=""> Reviews</span><span>/ Add Your Review</span></a>
                        </div>
                        <div class="product__details__price"><h2>$${pro.unitPrice}</h2></div>
                        <p>${pro.proFullDescription}</p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input style="width: 50px; text-align: center" type="text" value="1" id="quantity_change_input">
                                </div>
                            </div>
                        </div>

                        <button type="submit" id="add2cart_btn" class="btn btn-success btn-lg" data-toggle="modal" data-target="#success">Add To Cart</button>

                        <!-- Modal -->
                        <div class="modal fade" id="success" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content" style="border:none;border-radius: 5px;">
                                    <div class="modal-header" style="    background: #8D9EFF; border-top-left-radius: 5px; border-top-right-radius: 5px;">
                                        <button type="button" class="close" data-dismiss="modal" style="opacity:1;color:#fff;">&times;</button>
                                        <h4 class="modal-title text-center"><img src="https://lh3.googleusercontent.com/-Zxh4srAEtU0/Wp0cZV-PJuI/AAAAAAAAD4E/En5x5c53s44jzvG8M0sSyFZXoRhGXfBzwCL0BGAYYCw/h100/2018-03-05.png" alt=""></h4>
                                    </div>
                                    <div class="modal-body">
                                        <p style="text-align:center;color:#1ab394;font-size:24px;font-weight:500;">Cheers! Add To Cart Successful!</p>
                                    </div>
                                    <div class="modal-body">
                                        <h4><img src="/resources/img/${pro.proDesciption}" alt="">${pro.proName}</h4>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                   aria-selected="true">Description</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                   aria-selected="false">Reviews <span></span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <c:forEach items="${proSpec}" var="pSpec">
                                        <p>${pSpec.proSpecificationDescription}</p>
                                    </c:forEach>
                                </div>
                            </div>

                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <div class="submit-review">
                                        <div class="col-md-6" id="commentList">
                                            <h3 id="addreview">Write Your Own Review</h3>
                                            <h5>You're reviewing: ${pro.proName}</h5>
                                            <form:form id="submitCommentForm" method="post" modelAttribute="comment">
                                                <div class="form-group">
                                                    <p>Rating:  <form:input id="rating" path="rates" type="hidden" class="form-control rating" value="5"/></p>
                                                </div>
                                                <div class="form-group">
                                                    <p>Nickname<span>*</span></p>
                                                    <form:input id="username" path="username" type="text" class="form-control" placeholder=""/>
                                                </div>

                                                <div class="form-group">
                                                    <p>Review<span>*</span></p>
                                                    <form:textarea id="content" type="textarea" path="content" class="form-control" placeholder=""/>
                                                </div>
                                                <form:input path="productFeedback.id" id="productFeedback" type="hidden" value="${pro.id}"/>
                                                <button type="submit" class="btn btn-info">Submit</button>
                                            </form:form>

                                            <h2 id="reviews">Customer Reviews</h2>
                                            <hr>
                                            <c:forEach var="f" items="${feedback}">
                                                <div class="form-group">
                                                    <h5>Rating: <input type="hidden" class="rating" disabled="disabled" value="${f.rates}"/></h5>
                                                    <h6>${f.content}</h6>
                                                    <label>Review by ${f.username}</label>
                                                    <hr>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
<section class="related-product">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>Related Product</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="latest-product">
                    <div class="product-carousel">
                        <c:forEach var="pCate" items="${proCate}">
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="/resources/img/${pCate.proDesciption}" alt="${pCate.proName}">
                                    <div class="product-hover">
                                            <%--                                            <a href="#" id="add2cart_btn" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>--%>
                                        <a href="/user/viewProduct/${pCate.categoryEntity.id}/${pCate.id}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                <h2><a href="">${pCate.proName}</a></h2>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Related Product Section End -->

<jsp:include page="../include/user/footer.jsp"/>

<!-- Js Plugins -->
<script src="/resources/js/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/js/bootstrap.min.js"></script>
<script src="/resources/js/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/js/jquery-ui.min.js"></script>
<script src="/resources/js/js/jquery.slicknav.js"></script>
<script src="/resources/js/js/mixitup.min.js"></script>
<script src="/resources/js/js/owl.carousel.min.js"></script>
<script src="/resources/js/js/main.js"></script>

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