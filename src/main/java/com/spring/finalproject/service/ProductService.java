package com.spring.finalproject.service;

import com.spring.finalproject.entity.ProductEntity;
import com.spring.finalproject.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ProductService {
    @Autowired
    ProductRepository productRepository;

    @Transactional
    public List<ProductEntity> getProductList(){
        List<ProductEntity> getProduct = (List<ProductEntity>) productRepository.findAll();
        if(!CollectionUtils.isEmpty(getProduct)){
            return getProduct;
        }
        return new ArrayList<>();
    }

    public Page<ProductEntity> listAll(int pageNumber){
        Pageable pageable = PageRequest.of(pageNumber - 1 ,12);
        return (Page<ProductEntity>) productRepository.findAll(pageable);
    }

}
