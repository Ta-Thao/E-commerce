package com.spring.finalproject.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Main {

    public static String encrytePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }

    public static void main(String[] args) {

        System.out.println("Pass: "+ encrytePassword("1234"));
    }

}
