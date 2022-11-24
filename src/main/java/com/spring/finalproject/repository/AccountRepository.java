package com.spring.finalproject.repository;

import com.spring.finalproject.entity.AccountEntity;
import com.spring.finalproject.enums.UserStatus;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface AccountRepository extends CrudRepository<AccountEntity, Long> {
    AccountEntity findByEmailLikeAndStatusLike(String email, UserStatus status);

    AccountEntity findByEmailLike(String email);

    AccountEntity findById(long id);

}
