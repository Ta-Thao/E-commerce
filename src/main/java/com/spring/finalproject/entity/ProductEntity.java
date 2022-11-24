package com.spring.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "product")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "proId")
    private long id;

    @Column(name = "proName")
    private String proName;

    @Column(name = "proDes")
    private String proDesciption;

    @Column(name = "proFullDes")
    private String proFullDescription;

    @Column(name = "unitPrice")
    private double unitPrice;

    @ManyToOne()
    @LazyCollection(LazyCollectionOption.FALSE)
    @JoinColumn(name = "cateId")
    private CategoryEntity categoryEntity;

    @OneToMany(mappedBy = "productEntity")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<CartDetailsEntity> cartDetailsEntities;

    @OneToMany(mappedBy = "productImg")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<ProductImagesEntity> productImages;

    @OneToMany(mappedBy = "productSpeci")
    private List<ProductSpecificationEntity> productSpecification;

    @OneToMany(mappedBy = "productFeedback")
    private List<FeedbackEntity> feedback;

    @OneToMany(mappedBy = "productPromo")
    private List<ProductPromotionEntity> productPromotion;

    @ManyToOne
    @JoinColumn(name = "deleteId")
    private DeleteLogarithmEntity productDelete;
}
