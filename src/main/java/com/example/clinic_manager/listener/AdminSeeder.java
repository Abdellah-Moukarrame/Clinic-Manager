package com.example.clinic_manager.listener;

import com.example.clinic_manager.model.Admin;
import com.example.clinic_manager.model.User;
import com.example.clinic_manager.repossitory.UserRepository;
import com.example.clinic_manager.repossitory.impl.UserRepositoryImpl;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.mindrot.jbcrypt.BCrypt;

@WebListener
public class AdminSeeder implements ServletContextListener {
    private static final String admin_email = "admin@admin.com";
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try{
            UserRepository userRepository = new UserRepositoryImpl();
            if (userRepository.emailExist(admin_email)){
                return;
            }
            User admin = new Admin();
            admin.setEmail(admin_email);
            admin.setPassword(BCrypt.hashpw("admin@admin.com", BCrypt.gensalt()));
            userRepository.save(admin);
            System.out.println("admin created successfully" + admin_email);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
