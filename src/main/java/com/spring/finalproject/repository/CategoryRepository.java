package com.spring.finalproject.repository;

import com.spring.finalproject.entity.CategoryEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CategoryRepository extends CrudRepository<CategoryEntity, Long> {
    List<CategoryEntity> findCategoryEntityById(long id);

    @Query(value = "select * from product p\n" +
            "inner join category c\n" +
            "on c.cateid = p.cateid\n" +
            "where c.cateid = 1", nativeQuery = true)
    List<CategoryEntity> getListProByCateId(long id);
}
