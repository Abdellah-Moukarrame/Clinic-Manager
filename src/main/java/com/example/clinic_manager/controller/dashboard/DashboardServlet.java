package com.example.clinic_manager.controller.dashboard;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect(req.getContextPath()+"/login");
            return;
        }
        String role  = session.getAttribute("role").toString();
        String target =  switch(role == null ? "" : role){
            case "PATIENT" ->"/patient/dashboard";
            case "ADMIN" ->"/admin/dashboard";
            case "DOCTOR" ->"/doctor/dashboard";
            case "STAFF" ->"/staff/dashboard";
            default -> "/login";
        };
        resp.sendRedirect(req.getContextPath()+target);


    }
}
