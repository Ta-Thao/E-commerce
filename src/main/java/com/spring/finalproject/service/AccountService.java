package com.spring.finalproject.service;

import com.spring.finalproject.entity.AccountEntity;
import com.spring.finalproject.entity.AccountRoleEntity;
import com.spring.finalproject.entity.CartEntity;
import com.spring.finalproject.entity.RolesEntity;
import com.spring.finalproject.mail.MailSender;
import com.spring.finalproject.mail.QRCodeGenerator;
import com.spring.finalproject.repository.AccountRepository;
import com.spring.finalproject.repository.AccountRoleRepository;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class AccountService {

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    AccountService accountService;

    @Autowired
    AccountRoleRepository accountRoleRepository;

    public List<AccountEntity> viewAllAccount(){
        List<AccountEntity> accountEntityList = (List<AccountEntity>) accountRepository.findAll();

        if(!CollectionUtils.isEmpty(accountEntityList)){
            return accountEntityList;
        }
        return new ArrayList<>();
    }

    public void save(AccountEntity account){

        accountRepository.save(account);

    }


    public AccountEntity findByAccountId(Long id){
        Optional<AccountEntity> accountOtp = accountRepository.findById(id);
        if(accountOtp.isPresent()){
            Hibernate.initialize(accountOtp.get().getAccountRoleEntityList());
            return accountOtp.get();
        }

        return new AccountEntity();
    }

    public boolean deleteAccount(Long id){
        Optional<AccountEntity> accountOtp = accountRepository.findById(id);
        if (accountOtp.isPresent()){
            accountRepository.deleteById(id);
            return accountRepository.existsById(id);
        }
        return true;
    }

    public String encrytePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }

    public void createAccount(AccountEntity account){
        account.setPassword(encrytePassword(account.getPassword()));

        AccountRoleEntity accountRoleEntity = new AccountRoleEntity();
        accountRoleEntity.setAccountEntity(account);

        RolesEntity role = new RolesEntity();
        role.setId(1);
        accountRoleEntity.setRolesEntity(role);

        accountRepository.save(account);
        accountRoleRepository.save(accountRoleEntity);

        accountService.sendMailResgister(account);
    }

    public void sendMailResgister(AccountEntity account){
        String qrCodePath = "D:\\order_qr_" + UUID.randomUUID() + ".png";
        String accName =  account.getFullName();
        QRCodeGenerator.generate(qrCodePath, accName, 250);
        String htmlText =
                "<h1> Hi " + account.getFullName()+"</h1>" +
                "<br>"+
                "<h2>Welcome to the TK Store </h2>" +
                "You can immediate access to your account to view our product, latest activities and look up transaction history by date. <br>" +
                "<b>For more information, visit our website <a href=\"http://localhost:8080/login\">Store Apple</a></b>";
        try {
            MailSender.send(account.getEmail(), "Register Success", qrCodePath, htmlText);
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

}
