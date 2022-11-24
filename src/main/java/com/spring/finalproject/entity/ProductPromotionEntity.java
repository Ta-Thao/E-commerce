package com.spring.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "proPromotion")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductPromotionEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "proPromotionId")
    private long id;

    @Column(name = "promotionName")
    private String promotionName;

    @Column(name = "promotionDes")
    private String promotionDes;

    @Column(name = "promotionSubDes")
    private String promotionSubDes;

    @Column(name = "promotionImgUrl")
    private String promotionImgUrl;



    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "proId")
    private ProductEntity productPromo;

}
