package com.spring.finalproject.entity;

import com.spring.finalproject.enums.CartStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "cart")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cartId")
    private long id;

    @Column(name = "customerName")
    private String customerName;

    private String address;

    @Column(name = "phoneNumber")
    private String phoneNumber;

    @Column(name = "email")
    private String email;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @Column(name = "order_date")
    private Date orderDate;

    private String orderNotes;

    @Column(name = "totalPrice")
    private double totalPrice;

    private String other;

    @Column(name = "cartStatus")
    @Enumerated(EnumType.STRING)
    private CartStatus cartStatus = CartStatus.COMPLETED;

    @OneToMany(mappedBy = "cartEntity",cascade = CascadeType.ALL,orphanRemoval = true)
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<CartDetailsEntity> cartDetailsEntities = new ArrayList<>();

    @ManyToOne()
    @JoinColumn(name = "accountId")
    private AccountEntity account;

    @ManyToOne()
    @JoinColumn(name = "shippedid")
    private ShippingFeesEntity shippingFees;

}
