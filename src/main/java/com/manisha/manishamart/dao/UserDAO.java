package com.manisha.manishamart.dao;

import com.manisha.manishamart.model.User;
import java.sql.SQLException;
import java.util.Optional;

public interface UserDAO {
    Optional<User> findByEmail(String email) throws SQLException;
    User save(User user) throws SQLException;
}
