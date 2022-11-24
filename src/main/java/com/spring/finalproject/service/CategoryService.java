package com.spring.finalproject.service;

import com.spring.finalproject.entity.CategoryEntity;
import com.spring.finalproject.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryService {
    @Autowired
    CategoryRepository categoryRepository;

    @Transactional
    public List<CategoryEntity> getCategoryList(){
        List<CategoryEntity> categoryList = (List<CategoryEntity>) categoryRepository.findAll();
        if (!CollectionUtils.isEmpty(categoryList)){
            return categoryList;
        }
        return new ArrayList<>();
    }
}
