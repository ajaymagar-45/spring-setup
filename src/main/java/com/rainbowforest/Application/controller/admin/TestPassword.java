package com.rainbowforest.Application.controller.admin;

public class TestPassword {
    public static void main(String[] args) {
        System.out.println(new org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder().encode("admin123"));
    }
}