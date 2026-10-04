package com.example.clinic_manager.repossitory;

import com.example.clinic_manager.model.User;

import java.util.Optional;

public interface UserRepository {
    public void save(User user);
    public Optional<User> findByEmail(String email);
    public boolean emailExist(String email);
}
