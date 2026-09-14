package com.manisha.manishamart.dao;

import com.manisha.manishamart.model.Review;
import java.sql.SQLException;
import java.util.List;

public interface ReviewDAO {
    List<Review> findByProduct(Long productId) throws SQLException;
    Review save(Review review) throws SQLException;
}
