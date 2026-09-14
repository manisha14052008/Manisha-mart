package com.manisha.manishamart.controller;

import com.manisha.manishamart.dao.UserDAOImpl;
import com.manisha.manishamart.listener.DataSourceListener;
import com.manisha.manishamart.model.User;
import com.manisha.manishamart.service.AuthService;
import com.manisha.manishamart.util.ValidationUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    private AuthService authService;

    @Override
    public void init() {
        authService = new AuthService(new UserDAOImpl(DataSourceListener.getDataSource()));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String roleParam = req.getParameter("role");

        if (!ValidationUtil.isNonEmpty(name) || !ValidationUtil.isValidEmail(email)
                || !ValidationUtil.isValidPassword(password)) {
            req.setAttribute("error", "Please fill all fields correctly (password min 8 chars).");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        try {
            User.Role role = "SELLER".equalsIgnoreCase(roleParam) ? User.Role.SELLER : User.Role.BUYER;
            authService.register(name, email, password, role);
            resp.sendRedirect(req.getContextPath() + "/login");
        } catch (IllegalArgumentException e) {
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Database error during registration", e);
        }
    }
}
