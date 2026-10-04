package com.example.clinic_manager.service.impl;

import com.example.clinic_manager.model.User;
import com.example.clinic_manager.repossitory.UserRepository;
import com.example.clinic_manager.service.AuthService;
import org.mindrot.jbcrypt.BCrypt;

import java.util.Optional;

public class AuthServiceImpl implements AuthService {
    private final UserRepository userRepository ;

    public AuthServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public void register(User user) {
        if ( userRepository.emailExist(user.getEmail())) {
            throw new RuntimeException("email already exist");
        }
        String hashedPassword = BCrypt.hashpw(
                user.getPassword(),
                BCrypt.gensalt()
        );

        user.setPassword(hashedPassword);

        userRepository.save(user);

    }

    @Override
    public Optional<User> login(String email , String password) {
        Optional<User> userOptional = userRepository.findByEmail(email);
        if (!userOptional.isPresent()) {
            return Optional.empty();
        }

        User user=userOptional.get();
        if (BCrypt.checkpw(password,user.getPassword()) ) {
            return Optional.of(user);

        }
        return Optional.empty();

    }
}
