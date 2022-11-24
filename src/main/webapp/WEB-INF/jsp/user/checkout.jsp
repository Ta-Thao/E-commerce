<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<jsp:include page="../include/user/header-test.jsp"/>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Checkout</title>

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
<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-bit-title text-center">
                    <h2>Checkout</h2>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h6><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click here</a> to enter your code
                </h6>
            </div>
        </div>
        <div class="checkout__form">
            <h4>Billing Details</h4>

            <form:form action="${action}" method="post" modelAttribute="cart">
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="checkout__input">
                                <p>Full Name<span>*</span></p>
                                <form:input path="customerName" type="text" placeholder="Nguyen Van A" required="true"/>
                            </div>
                            <div class="checkout__input">
                                <p>Email<span>*</span></p>
                                <form:input path="email" type="email" placeholder="nguyenvana@gmail.com" class="checkout__input__add" required="true"/>
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <form:input path="address" type="text" placeholder="92 Quang Trung Street" class="checkout__input__add" required="true"/>
                            </div>
                            <div class="checkout__input">
                                <p>Phone<span>*</span></p>
                                <form:input path="phoneNumber" type="text" placeholder="+84" required="true"/>
                            </div>

                            <input type="hidden" id="localstorage_cart" name="localstorage_cart"/>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="shoping__cart__table">
                                    <div class="checkout__order__products">Products <span>Total</span></div>
                                    <table>
                                        <thead>

                                        </thead>
                                        <tbody id="cart_table_data">

                                        </tbody>
                                    </table>
                                </div>

                                <div class="checkout__order__subtotal" >Subtotal <span id="sub_total_sum"></span></div>
                                <div class="checkout__order__total" >Total <span id="total_sum"></span ></div>


                                <br>
                                <div class="checkout__input__checkbox">

                                </div>

                                <div id="paypal-button-container"></div>
                                <div class="m-1" id="paypal-success" style="display: none">
                                    <div class="alert alert-success alert-dismissible show">
                                        <h3><strong>Success!</strong></h3>
                                        <h5><span> Your order has been purchased successfully. Thank you for your payment!</span></h5> <br>
                                        <h6><span id="paypal-transaction-id"> Transaction ID: </span></h6>
                                    </div>
                                </div>

                                <!-- Button trigger modal -->
                                <button type="submit" id="add2cart_btn" class="btn btn-success btn-lg" data-toggle="modal" data-target="#success">Place Order</button>

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
                                                <p style="text-align:center;color:#1ab394;font-size:24px;font-weight:500;">Cheers! Order Successful!</p>
                                            </div>
                                            <div class="modal-body">


                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </form:form>
        </div>
    </div>
</section>
<!-- Checkout Section End -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Replace with your own sandbox Business account app client ID -->
<script src="https://www.paypal.com/sdk/js?client-id=ATi1AbbuU-e1J1_UP4KvtvtboUG1adhcX9-19g40-MWOsAv5FSJkNAuWo4y5_hdSymXhDOfuoDJN6_T0&currency=USD" data-namespace="paypal_sdk"></script>
<!-- Set up a container element for the button -->

<script>
    paypal_sdk.Buttons({
        // Sets up the transaction when a payment button is clicked
        createOrder: (data, actions) => {
            let total_price = $("#total_sum").html();
            total_price = Number(total_price.substr(total_price.indexOf("$") + 1));
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        value: total_price
                    }
                }]
            });
        },
        // Finalize the transaction after payer approval
        onApprove: (data, actions) => {
            return actions.order.capture().then(function(orderData) {
                // Successful capture! For dev/demo purposes:
                console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
                const transaction = orderData.purchase_units[0].payments.captures[0];
                //alert(`Transaction ${transaction.status}: ${transaction.id}\n\nSee console for all available details`);
                $("#paypal-button-container").hide();
                $("#paypal-success").show();
                $("#paypal-transaction-id").text(transaction.id);

            });
        }
    }).render('#paypal-button-container');
</script>

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
        const retrievedObject = JSON.parse(localStorage.getItem('shopping_cart'));
        const tbody = document.getElementById('cart_table_data');
        let total_price = 0;
        let cart_data = '';
        for (let i = 0; i < retrievedObject.length; i++) {
            let tr = "<tr>";
            tr += "<td class=\"shoping__cart__item\"><h5>" + retrievedObject[i].title + "</h5></td>" ;
            tr += "<td class=\"shoping__cart__total\">$" + retrievedObject[i].price * retrievedObject[i].quantity + "</td>";
            tbody.innerHTML += tr;
            total_price += Number(retrievedObject[i].price * retrievedObject[i].quantity)
            cart_data += retrievedObject[i].product_id + ',,' + retrievedObject[i].quantity + ']]'
        }
        $("#localstorage_cart").val(cart_data.substr(0, cart_data.length - 2));
        $("#sub_total_sum").text('$' +total_price);
        $("#total_sum").text('$'+total_price);

    });

    jQuery('#add2cart_btn').on('click', function(event){
        localStorage.clear();
    });

</script>


<!-- Js Plugins -->
<script src="/resources/test/js/jquery-3.3.1.min.js"></script>
<script src="/resources/test/js/bootstrap.min.js"></script>
<script src="/resources/test/js/jquery.nice-select.min.js"></script>
<script src="/resources/test/js/jquery-ui.min.js"></script>
<script src="/resources/test/js/jquery.slicknav.js"></script>
<script src="/resources/test/js/mixitup.min.js"></script>
<script src="/resources/test/js/owl.carousel.min.js"></script>
<script src="/resources/test/js/main.js"></script>


<script src="/resources/js/main.js" defer></script>
</body>

</html>