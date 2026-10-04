package com.example.clinic_manager.service;

import com.example.clinic_manager.model.User;

import java.util.Optional;

public interface AuthService {
    public void register(User user );
    public Optional<User> login(String email , String password);
}
