package com.spring.finalproject.repository;

import com.spring.finalproject.entity.FeedbackEntity;
import com.spring.finalproject.entity.ProductEntity;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends PagingAndSortingRepository<ProductEntity, Long> {
    List<ProductEntity> findByProNameContainingIgnoreCase(String proName);
    List<ProductEntity> findByProName(String proName);



    @Query("select b from ProductEntity b where b.id = ?1")
    List<ProductEntity> getListProductById(long id);

    @Query("select b from ProductEntity b where b.id = ?1")
    ProductEntity getProductById(long id);

    @Query(value = "SELECT * FROM product p\n" +
            "inner join category c\n" +
            "on c.cateid = p.cateid\n" +
            "where p.cateid = ?1\n" +
            "ORDER BY proid DESC", nativeQuery = true)
    List<ProductEntity> getListProductByCateId(long cateId);


    @Transactional
    @Modifying
    @Query(value = "select * from product\n" +
            "where cateid = ?1", nativeQuery = true)
    List<FeedbackEntity> getProductEntitiesByCategoryId(long id);

}
