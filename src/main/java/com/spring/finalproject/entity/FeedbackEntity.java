package com.spring.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "feedback")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FeedbackEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "feedbackId")
    private long id;

    @Column
    private String username;

    @Column(name = "content", length = 2000)
    private String content;

    @Column
    private int rates;

    @Column(name = "feedBack_Date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date feedbackDate;

    @ManyToOne()
    @JoinColumn(name = "proId")
    private ProductEntity productFeedback;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "accountId")
    private AccountEntity accountEntity;

    public FeedbackEntity(String username, String content, int rates) {
        this.username = username;
        this.content = content;
        this.rates = rates;
    }

}
