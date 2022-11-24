package com.spring.finalproject.entity;

import com.spring.finalproject.enums.Gender;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "accountBanking")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountBankingEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "accountBankingId")
    private long id;

    @Column
    private double balance;

    @Column(name = "email")
    private String email;

    @Column(name = "idCard")
    private String idCard;

    @Column(name = "status")
    private String status;

    @Column(name = "cardNumber")
    private String cardNumber;

    @Column(name = "expiryDate")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date expiryDate;

    @Column(name = "cvvCode")
    private String cvvCode;

    @Column(name = "phoneNumber")
    private String phoneNumber;

    @Column(name = "fullName")
    private String fullName;

    @Column(name = "birthDate")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthDate;

    @Enumerated(EnumType.STRING)
    private Gender gender;


    @OneToMany(mappedBy = "accountBankingEntity")
    private List<PaymentEntity> paymentEntities;
}
