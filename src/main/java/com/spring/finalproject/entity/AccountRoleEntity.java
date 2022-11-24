package com.spring.finalproject.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "account_role")
@Data
public class AccountRoleEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "account_id")
    private AccountEntity accountEntity;

    @ManyToOne
    @JoinColumn(name = "role_id")
    private RolesEntity rolesEntity;
}
