<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="container">
    <div class="row">
        <div class=" col-12 col-md-2">
            <div class="card px-2">
                <h2 class="text-center">Filter by</h2>
                <hr>
                <h4>Price:</h4>
                <div class="card-body">
                    <form id="price-range-form">
                        <label for="min-price" class="form-label">Min price: </label>
                        <span id="min-price-txt">$0</span>
                        <input type="range" class="form-range" min="0" max="1999" id="min-price" step="1" value="0">
                        <label for="max-price" class="form-label">Max price: </label>
                        <span id="max-price-txt">$2000</span>
                        <input type="range" class="form-range" min="1" max="2000" id="max-price" step="1" value="2000">
                    </form>
                </div>
                <hr>


                <div class="card-body">
                    <h4>Category:</h4>
                    <div class="categories-filter">
                            <button class="btn-cat" data-cat-source="all">
                                All
                            </button>
                        <button class="btn-cat" data-cat-source="cat-1">
                            Mac
                        </button>
                        <button class="btn-cat" data-cat-source="cat-2">
                            Ipad
                        </button>
                        <button class="btn-cat" data-cat-source="cat-3">
                            Iphone
                        </button>
                        <button class="btn-cat" data-cat-source="cat-4">
                            Airpods
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-10" id="display-items-div">

        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="product-pagination text-center">
                    <nav>
                        <ul class="pagination">
                            <li><a>Total Items: <c:out value="${totalItems}"></c:out> - Page: <c:out value="${currentPage}"></c:out> of <c:out value="${totalPages}"></c:out></a></li>
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li><a href="/user/page/${i}">${i}</a></li>
                            </c:forEach>

                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"/>"></script>

<script>

    $(document).on('click', '.btn-cat', function(e){
        var $type = $(this).data("cat-source");
        if($type == "all"){
            $('.portfolio-block').fadeOut(1000);
            $('.portfolio-block').fadeIn(2000);
        }else{
            $('.portfolio-block').hide();
            $('#'+$type + ".portfolio-block").fadeIn(2000);
        }
    })

    let min_price = 0;
    let max_price = 2000;
    $(document).ready(function () {
        showAllItems();//Display all items with no filter applied
    });
    $('#min-price').on("click", function () {
        min_price = parseInt($('#min-price').val());
        $('#min-price-txt').text('$' + min_price);
        showItemsFiltered();
    });
    $('#max-price').on("click", function () {
        max_price = parseInt($('#max-price').val());
        $('#max-price-txt').text('$' + max_price);
        showItemsFiltered();
    });

    let category_items = [
        <c:forEach items="${productList}" var="pro">
        {
            "id": ${pro.id},
            "price": ${pro.unitPrice},
            "name": "${pro.proName}",
            <%--"title": "${pro.proFullDescription}",--%>
            "thumbnail": "<c:url value="/resources/img/${pro.proDesciption}"/>",
            "category": "${pro.categoryEntity.id}",
        },
        </c:forEach>
    ]


    function showAllItems() {//Default grid to show all items on page load in
        $("#display-items-div").empty();
        for (let i = 0; i < category_items.length; i++) {
            let item_content = "<div class=\"col-md-3 col-sm-6 portfolio-block\" id=\"cat-"+category_items[i].category+"\"><div class=\"single-shop-product \"><div class=\"product-upper\">"+
                "<img  src=\""+ category_items[i].thumbnail + "\" alt=\"\"/></div>" +
                "<h2><a href=\"/user/viewProduct/"+ category_items[i].category+"/"+ category_items[i].id+"\">"+ category_items[i].name +"</a></h2>" +
                "<div class=\"product-carousel-price\">" +
                "<h4><ins>Price: " + category_items[i].price + "</ins></h4>" +
                "</div> <div class=\"product-option-shop\">" +
                "<a class=\"add_to_cart_button\" data-quantity=\"1\" data-product_sku=\"\" data-product_id=\"70\" rel=\"nofollow\" href=\"/user/viewProduct/"+ category_items[i].category+"/"+ category_items[i].id+"\">View Details</a>"
            "</div></div></div>";
            $("#display-items-div").append(item_content);
        }

    }
    function showItemsFiltered() {//Default grid to show all items on page load in
        $("#display-items-div").empty();
        for (let i = 0; i < category_items.length; i++) {//Go through the items but only show items that have size from show_sizes_array
            if (category_items[i]['price'] <= max_price && category_items[i]['price'] >= min_price) {
                let item_content = "<div class=\"col-md-3 col-sm-6 portfolio-block\" id=\"cat-"+category_items[i].category+"\"><div class=\"single-shop-product \"><div class=\"product-upper\">"+
                    "<img  src=\""+ category_items[i].thumbnail + "\" alt=\"\"/></div>" +
                    "<h2><a href=\"/user/viewProduct/"+ category_items[i].category+"/"+ category_items[i].id+"\">"+ category_items[i].name +"</a></h2>" +
                    "<div class=\"product-carousel-price\">" +
                    "<h4><ins>Price: " + category_items[i].price + "</ins></h4>" +
                    "</div> <div class=\"product-option-shop\">" +
                    " <a class=\"add_to_cart_button\" data-quantity=\"1\" data-product_sku=\"\" data-product_id=\"70\" rel=\"nofollow\" href=\"/user/viewProduct/"+ category_items[i].category+"/"+ category_items[i].id+"\">View Details</a>"
                "</div></div></div>";
                $("#display-items-div").append(item_content);//Display in grid
            }
        }
    }


</script>

</body>
</html>

<%--"<div class=\"col-md-3 col-sm-6 portfolio-block\" id=\"cat-"+category_items[i].category+"\"><div class=\"single-shop-product \"><div class=\"product-upper\">"+--%>
<%--"<img  src=\""+ category_items[i].thumbnail + "\" alt=\"\"/></div>" +--%>
<%--"<h2><a href=\"/user/viewProduct/"+ category_items[i].category+"/"+ category_items[i].id+"\">"+ category_items[i].name +"</a></h2>" +--%>
<%--"<div class=\"product-carousel-price\">" +--%>
<%--"<h4><ins>Price: " + category_items[i].price + "</ins></h4>" +--%>
<%--"</div> <div class=\"product-option-shop\">" +--%>
<%--    "<button type=\"submit\" id=\"add2cart_btn\" class=\"site-btn\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\"> ADD TO CARD</button>"+--%>
<%--    "</div></div></div>";--%>