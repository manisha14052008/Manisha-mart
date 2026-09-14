package com.manisha.manishamart.dao;

import com.manisha.manishamart.model.Order;
import com.manisha.manishamart.model.OrderItem;
import java.sql.SQLException;
import java.util.List;

public interface OrderDAO {
    Order createOrder(Order order, List<OrderItem> items) throws SQLException;
    List<Order> findByBuyer(Long buyerId) throws SQLException;
    List<Order> findAll() throws SQLException;
    void updateStatus(Long orderId, Order.Status status) throws SQLException;
}
