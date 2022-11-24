package com.spring.finalproject.repository;

import com.spring.finalproject.entity.AccountEntity;
import com.spring.finalproject.entity.AccountRoleEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AccountRoleRepository extends CrudRepository<AccountRoleEntity,Long> {
    List<AccountRoleEntity> findByAccountEntity(AccountEntity account);

}
