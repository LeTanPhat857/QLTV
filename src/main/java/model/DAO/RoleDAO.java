package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.DBConnection.DBConnection;
import model.object.Role;

public class RoleDAO {
    // methods
    public static Role getRoleById(int id) {
        String query = "select * from Role where QuanLyThuVien.dbo.Role.id = ?";
        try {
            PreparedStatement preparedStatement = DBConnection.connect(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Role role = new Role();
                role.setId(id);
                role.setRole(resultSet.getString("role"));
                role.setDescription(resultSet.getString("description"));
                return role;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}
