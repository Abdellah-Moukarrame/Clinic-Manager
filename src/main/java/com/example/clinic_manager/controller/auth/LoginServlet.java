package com.example.clinic_manager.controller.auth;

import com.example.clinic_manager.repossitory.UserRepository;
import com.example.clinic_manager.repossitory.impl.UserRepositoryImpl;
import com.example.clinic_manager.service.impl.AuthServiceImpl;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private AuthServiceImpl authService ;
    @Override
    public void init(ServletConfig config) throws ServletException {
        UserRepository userRepository = new UserRepositoryImpl() ;
        authService = new AuthServiceImpl(userRepository);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
