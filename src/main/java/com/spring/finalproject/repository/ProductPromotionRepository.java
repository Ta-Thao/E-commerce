package com.spring.finalproject.repository;

import com.spring.finalproject.entity.ProductPromotionEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ProductPromotionRepository extends CrudRepository<ProductPromotionEntity, Long> {
    @Query(value = "SELECT * FROM propromotion",nativeQuery = true)
    List<ProductPromotionEntity> getListPromotion();
}
