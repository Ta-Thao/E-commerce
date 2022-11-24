package com.spring.finalproject.entity;

import com.spring.finalproject.enums.UserStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "account")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "accId")
    private long id;

    @Column(name = "fullName")
    private String fullName;

    @Column(name = "email", unique = true)
    private String email;

    @Column(name = "password", unique = true)
    private String password;

    @Column(name = "phoneNumber")
    private String phoneNumber;


    @Column(name = "address")
    private String address;

    @Column(name = "status", nullable = false)
    @Enumerated(EnumType.STRING)
    private UserStatus status = UserStatus.ACTIVE;


    @OneToMany(mappedBy = "accountEntity")
    private List<AccountRoleEntity> accountRoleEntityList;

    @OneToMany(mappedBy = "account")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<CartEntity> cartEntities;



    //getRoleUser

    public List<RolesEntity> getRoleOfAccount() {
        List<RolesEntity> roleList = new ArrayList<>();
        if (this.getAccountRoleEntityList().isEmpty()) {
            return new ArrayList<>();
        } else {
            for (AccountRoleEntity item : this.getAccountRoleEntityList()) {
                roleList.add(item.getRolesEntity());
            }
            return roleList;

        }


    }
}
