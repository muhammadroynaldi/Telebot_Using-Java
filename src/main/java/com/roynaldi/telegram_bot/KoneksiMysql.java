/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.roynaldi.telegram_bot;

import java.sql.*;

/**
 *
 * @author m_roynaldi30
 */
public class KoneksiMysql {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/chatbot";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    private Connection connection;

    public Connection getConnection(){
        return connection;
    }
    
    public KoneksiMysql() {
        try {
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
//            System.out.println("Berhasil terhubung ke database!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Database connection closed!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
