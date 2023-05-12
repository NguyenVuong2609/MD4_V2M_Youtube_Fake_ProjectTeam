package rikkei.academy.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectToMySQL {
    private static Connection connection;
    private static final String URL = System.getenv("URL");
    private static final String USER = System.getenv("USER");
    private static final String PASS = System.getenv("PASS");
    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL,USER,PASS);
            System.out.println("Connect Successful");
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Connect Failed");
            throw new RuntimeException(e);
        }
        return connection;
    }
}
