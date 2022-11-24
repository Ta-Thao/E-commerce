<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<jsp:include page="../include/user/header-test.jsp"/>
<head>
  <meta charset="UTF-8">
  <meta name="description" content="Ogani Template">
  <meta name="keywords" content="Ogani, unica, creative, html">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Shopping Cart</title>

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

  <!-- Css Styles -->
  <link rel="stylesheet" href="/resources/test/css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="/resources/test/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="/resources/test/css/elegant-icons.css" type="text/css">
  <link rel="stylesheet" href="/resources/test/css/nice-select.css" type="text/css">
  <link rel="stylesheet" href="/resources/test/css/jquery-ui.min.css" type="text/css">
  <link rel="stylesheet" href="/resources/test/css/owl.carousel.min.css" type="text/css">
  <link rel="stylesheet" href="/resources/test/css/slicknav.min.css" type="text/css">
  <link rel="stylesheet" href="/resources/test/css/style.css" type="text/css">
</head>

<body>

<!-- Breadcrumb Section Begin -->
<div class="product-big-title-area">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="product-bit-title text-center">
          <h2>Shopping Cart</h2>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="shoping__cart__table">
          <table>
            <thead>
            <tr>
              <th class="shoping__product">Products</th>
              <th>Price</th>
              <th>Quantity</th>
              <th>Total</th>
              <th></th>
            </tr>
            </thead>
            <tbody id="cart_table_data">

            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-12">
        <div class="shoping__cart__btns">
          <a href="/user/shop" class="primary-btn cart-btn cart-btn-right">CONTINUE SHOPPING</a>
          <a href="" class="primary-btn cart-btn cart-btn-right" id="delete-all">DELETE ALL</a>
<%--          <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>--%>
<%--            Upadate Cart</a>--%>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="shoping__continue">
          <div class="shoping__discount">
            <h5>Discount Codes</h5>
            <form action="#">
              <input type="text" placeholder="Enter your coupon code">
              <button type="submit" class="site-btn">APPLY COUPON</button>
            </form>
          </div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="shoping__checkout">
          <h5>Cart Total</h5>
          <ul>
            <li>Subtotal <span>$</span><span id="sub_total_sum">0</span></li>
            <li>Total <span>$</span><span id="total_sum">0</span></li>
          </ul>
          <a href="/user/checkout" class="primary-btn">PROCEED TO CHECKOUT</a>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Shoping Cart Section End -->



<!-- Js Plugins -->
<script src="/resources/js/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/js/bootstrap.min.js"></script>
<script src="/resources/js/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/js/jquery-ui.min.js"></script>
<script src="/resources/js/js/jquery.slicknav.js"></script>
<script src="/resources/js/js/mixitup.min.js"></script>
<script src="/resources/js/js/owl.carousel.min.js"></script>
<script src="/resources/js/js/main.js"></script>


<script type="application/javascript">
  function deleteItemInCart(productId) {
    let currentLocalStorage = JSON.parse(localStorage.getItem('shopping_cart'));
    let newLocalStorage = [] // make a separate array to store new cart items

    $.each(currentLocalStorage,function(index, cartItem){
      if(Number(cartItem.product_id) != productId){
        newLocalStorage.push(cartItem); //fill second array with new cart item after the removal
      }
    });

    // update localstorage with new cart items (after the removal)
    localStorage.setItem('shopping_cart', JSON.stringify(newLocalStorage));

    let trElement = "#tr_" + productId;
    // update total price (after the removal)
    let totalPriceOfThisCartItem = $(trElement).find('.shoping__cart__total').html(); //e.g $110
    totalPriceOfThisCartItem = totalPriceOfThisCartItem.substr(totalPriceOfThisCartItem.indexOf("$") + 1); // then parse to 110
    $("#sub_total_sum").text(Number($("#sub_total_sum").html()) - Number(totalPriceOfThisCartItem));
    $("#total_sum").text($("#sub_total_sum").html());

    $(trElement).remove(); // remove the corresponding table <tr> row
  }
</script>

<script>
  $(document).ready(function(){
    const retrievedObject = JSON.parse(localStorage.getItem('shopping_cart'));
    const tbody = document.getElementById('cart_table_data');
    let total_price = 0;
    for (let i = 0; i < retrievedObject.length; i++) {
      let tr = "<tr id=\"tr_"+retrievedObject[i].product_id+"\">";
      tr += "<td class=\"shoping__cart__item\"><img src=\"" + retrievedObject[i].img_source + "\" alt=\"\"><h5>" + retrievedObject[i].title + "</h5></td>" ;
      tr += "<td class=\"shoping__cart__price\">$" + retrievedObject[i].price + "</td>";
      tr += "<td class=\"shoping__cart__quantity\"><div class=\"quantity111\"><div class=\"pro-qty\"><input type=\"text\" value=\"" + retrievedObject[i].quantity +"\"></div></div></td>";
      tr += "<td class=\"shoping__cart__total\">$" + retrievedObject[i].price * retrievedObject[i].quantity + "</td>";
      tr += "<td class=\"shoping__cart__item__close\"><span class=\"icon_close\" onclick=\"deleteItemInCart(" + retrievedObject[i].product_id + ")\"></span></td>";
      tbody.innerHTML += tr;
      total_price += Number(retrievedObject[i].price * retrievedObject[i].quantity);
    }
    $("#sub_total_sum").text(total_price);
    $("#total_sum").text(total_price);



      /* ----------------
      Delete item
      ----------------- */
      // jQuery('section').on('click', '#delete-item', function(event){
      //   event.preventDefault();
      //   var itemId = jQuery(this).closest('tr').data('itemid');
      //   localStorage.removeItem(itemId);
      //   var itemDelete = jQuery(this).closest('tr').remove();
      // });

    jQuery('#delete-all').on('click', function(event){
      localStorage.clear();
      jQuery('tr').remove();
    });

    // reference from the main.js
    /*-------------------
        Quantity change
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
        if (oldValue == 0) {
          return;
        } else {
          // Don't allow decrementing below zero
          if (oldValue > 0) {
            var newVal = parseFloat(oldValue) - 1;
          } else {
            newVal = 0;
          }
        }
      }
      $button.parent().find('input').val(newVal);

      // var shopping_cart = JSON.parse(localStorage.shopping_cart);
      // var name = document.getElementById(shopping_cart.product_id).value;
      // for (var j = 0; j < shopping_cart.length; j++) {
      //   if(name == shopping_cart[j].product_id){
      //     shopping_cart[j].quantity += 2;  //add two
      //     break;  //exit loop since you found the person
      //   }
      // }
      // localStorage.setItem("shopping_cart", JSON.stringify(shopping_cart));


      var row = $button.parent().parent().parent().parent();
      var currentBasePrice = row.find('.shoping__cart__price').html();
      currentBasePrice = currentBasePrice.substr(currentBasePrice.indexOf("$") + 1);
      row.find('.shoping__cart__total').text('$' + Number(currentBasePrice * newVal));

      if ($button.hasClass('inc')) {
        $("#sub_total_sum").text(Number($("#sub_total_sum").html()) + Number(currentBasePrice));
      } else {
        $("#sub_total_sum").text(Number($("#sub_total_sum").html()) - Number(currentBasePrice));
      }
      $("#total_sum").text($("#sub_total_sum").html());
    });
  });

</script>


<script src="/resources/js/main.js" defer></script>
</body>

</html>