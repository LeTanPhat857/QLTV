package model.DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
    public static Connection connection;
    //"jdbc:sqlserver://localhost:1433;databaseName=QuanLyThuVien;username=sa;password=123"
    public static PreparedStatement connect(String sql) throws ClassNotFoundException, SQLException {
            if (connection == null || connection.isClosed()) {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=QuanLyThuVien;username=sa;password=123;CharacterSet=UTF-8");
              //connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=QuanLyThuVien;user=sa;password=sa;CharacterSet=UTF-8");
            }
            return connection.prepareStatement(sql);
    }
    
    public static Statement connectStatement() throws ClassNotFoundException, SQLException {
        if (connection == null || connection.isClosed()) {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=QuanLyThuVien;username=sa;password=123;CharacterSet=UTF-8");
          //connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=QuanLyThuVien;user=sa;password=sa;CharacterSet=UTF-8");
            
        }
        return  connection.createStatement();
}
}
