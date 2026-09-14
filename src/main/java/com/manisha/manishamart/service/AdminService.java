package com.manisha.manishamart.service;

import com.manisha.manishamart.dao.OrderDAO;
import com.manisha.manishamart.dao.ProductDAO;
import com.manisha.manishamart.model.Order;
import com.manisha.manishamart.model.Product;

import java.sql.SQLException;
import java.util.List;

public class AdminService {

    private final ProductDAO productDAO;
    private final OrderDAO orderDAO;

    public AdminService(ProductDAO productDAO, OrderDAO orderDAO) {
        this.productDAO = productDAO;
        this.orderDAO = orderDAO;
    }

    public List<Product> allListings() throws SQLException {
        return productDAO.findAll();
    }

    public List<Order> allOrders() throws SQLException {
        return orderDAO.findAll();
    }

    public void removeListing(Long productId) throws SQLException {
        productDAO.delete(productId);
    }
}
