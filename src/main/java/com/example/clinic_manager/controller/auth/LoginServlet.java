package com.example.clinic_manager.controller.auth;

import com.example.clinic_manager.model.User;
import com.example.clinic_manager.repossitory.UserRepository;
import com.example.clinic_manager.repossitory.impl.UserRepositoryImpl;
import com.example.clinic_manager.service.impl.AuthServiceImpl;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private AuthServiceImpl authService ;
    @Override
    public void init() throws ServletException {
        authService = new AuthServiceImpl(new UserRepositoryImpl());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/auth/login.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        if (password == null || email == null || password.isBlank() || email.isBlank()){
            req.setAttribute("error","please all the fields are requered");
            req.getRequestDispatcher("/auth/login.jsp").forward(req,resp);

        }

        Optional<User> optionalUser = authService.login(email.trim(), password);

        if (optionalUser.isEmpty()) {
            req.setAttribute("error", "Invalid email or password.");
            req.getRequestDispatcher("/auth/login.jsp").forward(req, resp);
            return;
        }

        User user = optionalUser.get();
        HttpSession old = req.getSession(false);
        if (old != null) old.invalidate();

        HttpSession session = req.getSession(true);
        session.setAttribute("userId", user.getId());
        session.setAttribute("role", user.getRole().name());

        resp.sendRedirect(req.getContextPath() + "/dashboard");

        


    }
}
