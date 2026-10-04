package com.manisha.manishamart.controller;

import com.manisha.manishamart.dao.ProductDAOImpl;
import com.manisha.manishamart.listener.DataSourceListener;
import com.manisha.manishamart.model.Product;
import com.manisha.manishamart.model.User;
import com.manisha.manishamart.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/products"})
public class ProductServlet extends HttpServlet {

    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductService(
                new ProductDAOImpl(DataSourceListener.getDataSource())
        );
    }

    // Browse products
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String keyword = req.getParameter("keyword");
        String category = req.getParameter("category");

        try {
            List<Product> products =
                    productService.browse(keyword, category);

            req.setAttribute("products", products);

            req.getRequestDispatcher("/products.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(
                    "Database error loading products", e);
        }
    }

    // Add product
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // Check login
        if (session == null ||
                session.getAttribute("user") == null) {

            resp.sendRedirect(
                    req.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");

        // Only Seller can add products
        if (user.getRole() != User.Role.SELLER) {

            resp.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "Only sellers can add products."
            );
            return;
        }

        try {

            Product product = new Product();

            // Get seller ID from logged-in user
            product.setSellerId(user.getId());

            // Get product details from form
            product.setName(req.getParameter("name"));

            product.setDescription(
                    req.getParameter("description"));

            product.setPrice(
                    new BigDecimal(
                            req.getParameter("price")));

            product.setStockQty(
                    Integer.parseInt(
                            req.getParameter("stockQty")));

            product.setCategory(
                    req.getParameter("category"));

            // Save product
            productService.create(product);

            // Go back to products page
            resp.sendRedirect(
                    req.getContextPath() + "/products");

        } catch (NumberFormatException e) {

            throw new ServletException(
                    "Invalid price or stock quantity", e);

        } catch (SQLException e) {

            throw new ServletException(
                    "Database error creating product", e);
        }
    }
}
