package com.manisha.manishamart.service;

import com.manisha.manishamart.dao.UserDAO;
import com.manisha.manishamart.model.User;
import com.manisha.manishamart.util.PasswordUtil;

import java.sql.SQLException;
import java.util.Optional;

public class AuthService {

    private final UserDAO userDAO;

    public AuthService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public Optional<User> login(String email, String password) throws SQLException {
        Optional<User> userOpt = userDAO.findByEmail(email);
        if (userOpt.isPresent() && PasswordUtil.verify(password, userOpt.get().getPasswordHash())) {
            return userOpt;
        }
        return Optional.empty();
    }

    public User register(String name, String email, String password, User.Role role) throws SQLException {
        if (userDAO.findByEmail(email).isPresent()) {
            throw new IllegalArgumentException("Email already registered");
        }
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPasswordHash(PasswordUtil.hash(password));
        user.setRole(role);
        return userDAO.save(user);
    }
}
