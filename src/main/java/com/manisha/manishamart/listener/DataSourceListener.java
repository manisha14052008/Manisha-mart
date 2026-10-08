package com.manisha.manishamart.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DataSourceListener implements ServletContextListener {

    private static HikariDataSource dataSource;

    @Override
    public void contextInitialized(ServletContextEvent event) {

        try {
            HikariConfig config = new HikariConfig();

            config.setJdbcUrl(
                "jdbc:h2:mem:manishamart;DB_CLOSE_DELAY=-1"
            );
            config.setUsername("sa");
            config.setPassword("");

            config.setMaximumPoolSize(10);
            config.setMinimumIdle(2);

            dataSource = new HikariDataSource(config);

            event.getServletContext().setAttribute(
                "dataSource",
                dataSource
            );

            System.out.println(
                "ManishaMart DataSource initialized successfully."
            );

        } catch (Exception e) {
            System.err.println(
                "Failed to initialize DataSource."
            );
            e.printStackTrace();
        }
    }

    public static HikariDataSource getDataSource() {
        return dataSource;
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {

        if (dataSource != null && !dataSource.isClosed()) {
            dataSource.close();
            System.out.println(
                "ManishaMart DataSource closed."
            );
        }
    }
}
