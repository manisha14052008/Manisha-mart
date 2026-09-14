package com.manisha.manishamart.listener;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

/**
 * Single owner of the connection pool lifecycle (Section 2, rule 5).
 * No DriverManager.getConnection() calls should exist anywhere outside this class.
 */
@WebListener
public class DataSourceListener implements ServletContextListener {

    private static HikariDataSource dataSource;
    public static final String ATTRIBUTE_NAME = "dataSource";

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        HikariConfig config = new HikariConfig();

        // Local dev: embedded H2. Switch to the tcp:// URL for server-mode H2 in production.
        config.setJdbcUrl("jdbc:h2:./data/manishamart;AUTO_SERVER=TRUE");
        config.setDriverClassName("org.h2.Driver");
        config.setUsername("sa");
        config.setPassword("");
        config.setMaximumPoolSize(10);

        dataSource = new HikariDataSource(config);
        sce.getServletContext().setAttribute(ATTRIBUTE_NAME, dataSource);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (dataSource != null) {
            dataSource.close();
        }
    }

    public static DataSource getDataSource() {
        return dataSource;
    }
}
