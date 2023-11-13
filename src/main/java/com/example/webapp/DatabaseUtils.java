package com.example.webapp;

import javax.xml.crypto.Data;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseUtils {

    private String mysqlDriver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://i1i7nk6d2r6ujwjh:gcmjbobuqrl61m0z@i54jns50s3z6gbjt.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/aemu3k287ijuu5wv";
    private String database = "aemu3k287ijuu5wv";
    private Connection connection = null;

    public static DatabaseUtils instance = null;

    public static DatabaseUtils getInstance() {
        if (instance == null) {
            instance = new DatabaseUtils();
        }
        return instance;
    }

    public DatabaseUtils() {
        super();
    }

    public String getDatabase() {
        return database;
    }
    public Connection getConnection() {
        if (connection == null) {
            try {
                Class.forName(mysqlDriver);
                connection = DriverManager.getConnection(url);
                System.out.println("Connected to PostgreSQL database!");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
        return connection;
    }

    public ResultSet sendQuery(String query) {

        if(connection == null) getConnection();

        try {
            java.sql.Statement statement = connection.createStatement();
            statement.executeQuery(query);
            return statement.getResultSet();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

}