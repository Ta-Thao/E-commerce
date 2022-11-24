package com.spring.finalproject.entity;

import com.spring.finalproject.enums.CartStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;

@Entity
@Table(name = "cartDetails")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDetailsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cardDetailsId")
    private long id;

    @ManyToOne()
    @LazyCollection(LazyCollectionOption.FALSE)
    @JoinColumn(name = "proId")
    private ProductEntity productEntity;


    @ManyToOne()
    @JoinColumn(name = "cardId")
    private CartEntity cartEntity;

    @Column(name = "quantity")
    private int quantity;

    @OneToOne
    @PrimaryKeyJoinColumn
    private PaymentEntity paymentEntity;


}
