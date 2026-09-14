package com.manisha.manishamart.service;

import com.manisha.manishamart.dao.ProductDAO;
import com.manisha.manishamart.model.Product;
import com.manisha.manishamart.util.ValidationUtil;

import java.sql.SQLException;
import java.util.List;

public class ProductService {

    private final ProductDAO productDAO;

    public ProductService(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    public List<Product> browse(String keyword, String category) throws SQLException {
        return productDAO.search(keyword, category);
    }

    public Product create(Product product) throws SQLException {
        if (!ValidationUtil.isNonEmpty(product.getName()) || !ValidationUtil.isPositive(product.getPrice())) {
            throw new IllegalArgumentException("Product name and a positive price are required");
        }
        return productDAO.save(product);
    }

    public void update(Product product) throws SQLException {
        productDAO.update(product);
    }

    public void delete(Long id) throws SQLException {
        productDAO.delete(id);
    }

    public List<Product> listBySeller(Long sellerId) throws SQLException {
        return productDAO.findBySeller(sellerId);
    }
}
