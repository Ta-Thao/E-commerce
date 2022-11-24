package com.spring.finalproject.repository;

import com.spring.finalproject.entity.ProductSpecificationEntity;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ProductSpecificationRepository extends CrudRepository<ProductSpecificationEntity, Long> {
    @Transactional
    @Modifying
    @Query("select b from ProductSpecificationEntity b where b.id = ?1")
    List<ProductSpecificationEntity> getProSpecById(long id);
}
