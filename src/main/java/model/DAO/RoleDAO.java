package model.DAO;

import model.DBConnection.DBConnection;
import model.object.Role;
import model.object.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleDAO {
    // methods
    public static Role getRoleById(int roleId) {
        Role role = null;
        String query = "select * from Role where QuanLyThuVien.dbo.Role.roleId = ?";
        try {
            PreparedStatement preparedStatement = DBConnection.connect(query);
            preparedStatement.setInt(1, roleId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                role = new Role();
                role.setRoleId(roleId);
                role.setRoleName(resultSet.getString("roleName"));
                role.setDescription(resultSet.getString("description"));
                role.setCreateDate(resultSet.getDate("createDate"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return role;
    }
}
