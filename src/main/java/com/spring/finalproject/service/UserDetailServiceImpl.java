package com.spring.finalproject.service;

import com.spring.finalproject.entity.AccountEntity;
import com.spring.finalproject.entity.AccountRoleEntity;
import com.spring.finalproject.enums.UserStatus;
import com.spring.finalproject.repository.AccountRepository;
import com.spring.finalproject.repository.AccountRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;


@Service
public class UserDetailServiceImpl implements UserDetailsService {

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    AccountRoleRepository accountRoleRepository;



    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        AccountEntity user = accountRepository.findByEmailLikeAndStatusLike(email, UserStatus.ACTIVE);
        if (user == null) {
            throw new UsernameNotFoundException(email);
        }
        List<AccountRoleEntity> accountRoleList = accountRoleRepository.findByAccountEntity(user);

        List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();


        if (!CollectionUtils.isEmpty(accountRoleList)) {
            for ( AccountRoleEntity role : accountRoleList) {
                GrantedAuthority authority = new SimpleGrantedAuthority(role.getRolesEntity().getRolesName().toString());
                grantList.add(authority);
            }
        }

        return (UserDetails) new User(user.getEmail(), user.getPassword(), grantList);

    }
}
