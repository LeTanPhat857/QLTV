package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.DBConnection.DBConnection;
import model.object.UserStatus;

public class UserStatusDAO {

    // methods
    public static UserStatus getStatusById(int id) {
        String query = "select * from UserStatus where QuanLyThuVien.dbo.UserStatus.id = ?";
        try {
            PreparedStatement preparedStatement = DBConnection.connect(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
            	UserStatus status = new UserStatus();
                status.setId(id);
                status.setStatus(resultSet.getString("status"));
                status.setDescription(resultSet.getString("description"));
                return status;                
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}
