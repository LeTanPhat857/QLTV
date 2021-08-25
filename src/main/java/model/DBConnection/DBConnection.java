package model.DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnection {
    static Connection connection;

    public static PreparedStatement connect(String sql) throws ClassNotFoundException, SQLException {
            if (connection == null || connection.isClosed()) {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=QuanLyThuVien;user=sa;password=sa");
            }
            return connection.prepareStatement(sql);
    }
}
