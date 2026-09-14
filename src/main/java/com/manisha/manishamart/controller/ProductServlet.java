package com.manisha.manishamart.controller;

import com.manisha.manishamart.dao.ProductDAOImpl;
import com.manisha.manishamart.listener.DataSourceListener;
import com.manisha.manishamart.model.Product;
import com.manisha.manishamart.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/products"})
public class ProductServlet extends HttpServlet {

    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductService(new ProductDAOImpl(DataSourceListener.getDataSource()));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        String category = req.getParameter("category");
        try {
            List<Product> products = productService.browse(keyword, category);
            req.setAttribute("products", products);
            req.getRequestDispatcher("/products.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Database error loading products", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Product product = new Product();
        product.setSellerId(Long.valueOf(req.getParameter("sellerId")));
        product.setName(req.getParameter("name"));
        product.setDescription(req.getParameter("description"));
        product.setPrice(new BigDecimal(req.getParameter("price")));
        product.setStockQty(Integer.parseInt(req.getParameter("stockQty")));
        product.setCategory(req.getParameter("category"));

        try {
            productService.create(product);
            resp.sendRedirect(req.getContextPath() + "/products");
        } catch (SQLException e) {
            throw new ServletException("Database error creating product", e);
        }
    }
}
