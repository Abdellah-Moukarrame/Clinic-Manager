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
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp
    ) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Optional<User> userOptional = authService.login(email, password);

        if (userOptional.isEmpty()) {
            req.setAttribute("error", "Email ou mot de passe incorrect");
            req.getRequestDispatcher("/auth/login.jsp")
                    .forward(req, resp);
            return;
        }

        User user = userOptional.get();

        HttpSession session = req.getSession(true);

        session.setAttribute("user", user);


        switch (user.getRole()) {

            case ADMIN:
                resp.sendRedirect(
                        req.getContextPath() + "/admin/dashboard"
                );
                break;

            case DOCTOR:
                resp.sendRedirect(
                        req.getContextPath() + "/doctor/dashboard"
                );
                break;

            case PATIENT:
                resp.sendRedirect(
                        req.getContextPath() + "/patient/dashboard"
                );
                break;

            default:
                session.invalidate();
                resp.sendRedirect(req.getContextPath() + "/login");
        }
    }
}
