package com.spring.finalproject.service;

import com.spring.finalproject.entity.CartDetailsEntity;
import com.spring.finalproject.entity.ProductEntity;
import com.spring.finalproject.repository.CartDetailsRepository;
import com.spring.finalproject.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartDetailsService {
    @Autowired
    CartDetailsRepository cartDetailsRepository;

    @Autowired
    ProductRepository productRepository;

    public String trHtml(CartDetailsEntity cartDetail, ProductEntity product){
       String tr = "  <tr>\n" +
                "    <td>"+product.getProName()+"</td>\n" +
                "    <td>"+cartDetail.getQuantity()+"</td>\n" +
                "    <td>$"+product.getUnitPrice()*cartDetail.getQuantity()+"</td>\n" +
                "  </tr>\n";
       return tr;
    }

}
