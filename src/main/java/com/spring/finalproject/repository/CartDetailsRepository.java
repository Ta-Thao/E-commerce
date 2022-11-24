package com.spring.finalproject.repository;

import com.spring.finalproject.entity.CartDetailsEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CartDetailsRepository extends CrudRepository<CartDetailsEntity, Long> {
    @Query(value = "SELECT * from cartdetails cd\n" +
            "            inner join cart c ON c.cartid = cd.cardid\n" +
            "            inner join account a ON a.accid = c.accountid\n" +
            "            where a.accid = ?1", nativeQuery = true)
    List<CartDetailsEntity> getCartDetails(long id);
}
