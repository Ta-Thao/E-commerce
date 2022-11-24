package com.spring.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "productImages")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductImagesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "proImageId")
    private long id;

    @Column(name = "imageUrl")
    private String imageUrl;

    @Column(name = "imageUrlMain")
    private String imageUrlMain;

    @Column(name = "imageAlt")
    private String imageAlt;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "proId")
    private ProductEntity productImg;

}
