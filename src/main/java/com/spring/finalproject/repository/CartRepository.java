package com.spring.finalproject.repository;

import com.spring.finalproject.entity.CartEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CartRepository extends CrudRepository<CartEntity, Long> {
    @Query(value = "\tselect proname, quantity, unitprice from cartdetails\n" +
            "\tinner join cart ON cart.cartid = cartdetails.cardid\n" +
            "\tinner join product on product.proid = cartdetails.proid\n" +
            "\twhere accountid = ?1;", nativeQuery = true)
    List<CartEntity> getCartOrdered(long id);

    CartEntity findByEmail(String email);
}
