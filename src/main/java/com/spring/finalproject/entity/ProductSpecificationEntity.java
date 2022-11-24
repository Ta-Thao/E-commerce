package com.spring.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "proSpecification")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductSpecificationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "proSpecId")
    private long id;

    @Column(name = "proSpecName")
    private String proSpecificationName;

    @Column(name = "proSpecDes")
    private String proSpecificationDescription;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "proId")
    private ProductEntity productSpeci;

}
