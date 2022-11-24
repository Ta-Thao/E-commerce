package com.spring.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "payment")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "paymentId")
    private long id;

    @Column
    private double amount;

    @Column(name = "paymentDate")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date paymentDate;

    @Column(length = 20)
    private String status;

    @OneToOne(mappedBy = "paymentEntity")
    private CartDetailsEntity cartDetailsPayment;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "accountBankingId")
    private AccountBankingEntity accountBankingEntity;
}
