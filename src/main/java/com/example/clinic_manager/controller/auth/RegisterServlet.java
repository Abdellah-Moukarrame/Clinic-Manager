package com.example.clinic_manager.controller.auth;

import com.example.clinic_manager.model.Patient;
import com.example.clinic_manager.repossitory.UserRepository;
import com.example.clinic_manager.repossitory.impl.UserRepositoryImpl;
import com.example.clinic_manager.service.AuthService;
import com.example.clinic_manager.service.impl.AuthServiceImpl;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private AuthService authService;

    @Override
    public void init() {
        UserRepository userRepository = new UserRepositoryImpl();
        authService = new AuthServiceImpl(userRepository);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/auth/register.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String cin = req.getParameter("cin");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("firstName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        if (cin == null || cin.isBlank() || firstName == null || firstName.isBlank() || lastName == null || lastName.isBlank()){
            req.setAttribute("error","all the fields are reqeired to fill");
            req.getRequestDispatcher("/auth/register.jsp");
        }
        Patient patient = new Patient();
        patient.setEmail(email);
        patient.setPassword(password);
        patient.setCin(cin);
        patient.setFirstName(firstName);
        patient.setLastName(lastName);

        try {
            authService.register(patient);

            resp.sendRedirect(req.getContextPath() + "/login");

        } catch (RuntimeException e) {

            req.setAttribute("error", e.getMessage());

            req.getRequestDispatcher("/auth/register.jsp")
                    .forward(req, resp);
        }
    }
}