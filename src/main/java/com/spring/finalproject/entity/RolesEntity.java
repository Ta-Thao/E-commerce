package com.spring.finalproject.entity;

import com.spring.finalproject.enums.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.management.relation.RoleStatus;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "roles")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RolesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rolesId")
    private long id;

    @Column(name = "rolesName")
    @Enumerated(EnumType.STRING)
    private Role rolesName;

    @OneToMany(mappedBy = "rolesEntity")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<AccountRoleEntity> accountRoleEntityList;
}
