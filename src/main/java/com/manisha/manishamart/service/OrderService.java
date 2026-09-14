package com.manisha.manishamart.service;

import com.manisha.manishamart.dao.CartDAO;
import com.manisha.manishamart.dao.OrderDAO;
import com.manisha.manishamart.model.CartItem;
import com.manisha.manishamart.model.Order;
import com.manisha.manishamart.model.OrderItem;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderService {

    private final OrderDAO orderDAO;
    private final CartDAO cartDAO;

    public OrderService(OrderDAO orderDAO, CartDAO cartDAO) {
        this.orderDAO = orderDAO;
        this.cartDAO = cartDAO;
    }

    /** Mock payment confirmation step (F5) — no real gateway, just marks the order placed. */
    public Order checkout(Long buyerId) throws SQLException {
        List<CartItem> cartItems = cartDAO.findByUser(buyerId);
        if (cartItems.isEmpty()) {
            throw new IllegalStateException("Cart is empty");
        }

        BigDecimal total = BigDecimal.ZERO;
        List<OrderItem> orderItems = new ArrayList<>();
        for (CartItem ci : cartItems) {
            BigDecimal lineTotal = ci.getUnitPrice().multiply(BigDecimal.valueOf(ci.getQuantity()));
            total = total.add(lineTotal);

            OrderItem oi = new OrderItem();
            oi.setProductId(ci.getProductId());
            oi.setQuantity(ci.getQuantity());
            oi.setUnitPrice(ci.getUnitPrice());
            orderItems.add(oi);
        }

        Order order = new Order();
        order.setBuyerId(buyerId);
        order.setStatus(Order.Status.CONFIRMED); // mock payment "succeeds" immediately
        order.setTotalAmount(total);

        Order saved = orderDAO.createOrder(order, orderItems);
        cartDAO.clearForUser(buyerId);
        return saved;
    }

    public List<Order> buyerHistory(Long buyerId) throws SQLException {
        return orderDAO.findByBuyer(buyerId);
    }

    public List<Order> allOrders() throws SQLException {
        return orderDAO.findAll();
    }

    public void updateStatus(Long orderId, Order.Status status) throws SQLException {
        orderDAO.updateStatus(orderId, status);
    }
}
