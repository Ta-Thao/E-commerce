package com.spring.finalproject.service;

import com.spring.finalproject.entity.AccountEntity;
import com.spring.finalproject.entity.CartDetailsEntity;
import com.spring.finalproject.entity.CartEntity;
import com.spring.finalproject.entity.ProductEntity;
import com.spring.finalproject.mail.MailSender;
import com.spring.finalproject.mail.QRCodeGenerator;
import com.spring.finalproject.repository.AccountRepository;
import com.spring.finalproject.repository.CartDetailsRepository;
import com.spring.finalproject.repository.CartRepository;
import com.spring.finalproject.repository.ProductRepository;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestBody;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class CartService {

    @Autowired
    CartRepository cartRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    CartDetailsRepository cartDetailsRepository;

    @Autowired
    CartDetailsService cartDetailsService;

    @Autowired
    AccountRepository accountRepository;

    @Transactional
    public List<CartEntity> showAllCart(){
        List<CartEntity> cartList = (List<CartEntity>) cartRepository.findAll();
        for (CartEntity c :cartList){
            Hibernate.initialize(c.getCartDetailsEntities());
        }
        if (!CollectionUtils.isEmpty(cartList)){
            return cartList;
        }
        return new ArrayList<>();
    }

    public void checkout(CartEntity carts, String body){
        CartEntity cart = cartRepository.save(carts);
        String input = body.split("&")[4].split("=")[1];
        input = input.replace("%2C", ",").replace("%5D", "]");
        String arr[] = input.split("]]");
        String trTable = "";
        String tr = "";
        double totalPrice = 0;
        for (int i = 0; i < arr.length; i++) {
            String item[] = arr[i].split(",,");
            CartDetailsEntity cartDetail = new CartDetailsEntity();
            ProductEntity productEntity = new ProductEntity();
            productEntity.setId(Integer.parseInt(item[0]));
            cartDetail.setProductEntity(productEntity);
            cartDetail.setQuantity(Integer.parseInt(item[1]));

            ProductEntity product = productRepository.getProductById(Integer.parseInt(item[0]));
            totalPrice += product.getUnitPrice() * Integer.parseInt(item[1]);
            cartDetail.setCartEntity(cart);

            tr = cartDetailsService.trHtml(cartDetail, product);
            trTable = trTable.concat(tr);

            cartDetailsRepository.save(cartDetail);
        }
        cart.setTotalPrice(totalPrice);
        cart.setOther(trTable);
        AccountEntity account = accountRepository.findByEmailLike(cart.getEmail());
        account.setId(account.getId());
        cart.setAccount(account);
        cartRepository.save(cart);

        // send email
        sendMailOrder(cart);
    }


    public void sendMailOrder(CartEntity cart){
        String qrCodePath = "D:\\order_qr_" + UUID.randomUUID() + ".png";
        String orderID = "ORD-21102022-" + cart.getId();
        QRCodeGenerator.generate(qrCodePath, orderID, 250);
        String htmlText = "<!DOCTYPE html>\n" +
                "<html>\n" +
                "<head>\n" +
                "<style>\n" +
                "table {\n" +
                "  font-family: arial, sans-serif;\n" +
                "  border-collapse: collapse;\n" +
                "  width: 50%;\n" +
                "}\n" +
                "\n" +
                "td, th {\n" +
                "  border: 1px solid #dddddd;\n" +
                "  text-align: left;\n" +
                "  padding: 8px;\n" +
                "}\n" +
                "\n" +
                "tr:nth-child(even) {\n" +
                "  background-color: #dddddd;\n" +
                "}\n" +
                "</style>\n" +
                "</head>\n" +
                "<body>\n" +
                "\n" +
                "<h1> Order Confirmation </h1>" +
                "<hr>"+
                "<h2>Hi " + cart.getCustomerName() +", </h2>" +
                "Your bargain deals are on the way<br>" +
                "<b>Delivery address</b>: " + cart.getAddress()+"<br>" +
                "   The following item(s) from order #"+cart.getId()+" or QR code <br>" +
                "<h2>Order Details</h2>\n" +
                "\n" +
                "<table>\n" +
                "  <tr>\n" +
                "    <th>Name Product</th>\n" +
                "    <th>Quantity</th>\n" +
                "    <th>Price</th>\n" +
                "  </tr>\n" +
                cart.getOther() +
                "</table>\n" +
                "\n" +
                "<img src=\"cid:image\">" +
                "</body>\n" +
                "</html>\n" +
                "\n";
        try {
            MailSender.send(cart.getEmail(), "Order Success", qrCodePath, htmlText);
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }


}
