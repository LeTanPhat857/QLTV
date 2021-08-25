package model.DAO;

import model.DBConnection.DBConnection;
import model.object.Role;
import model.object.Status;
import model.object.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StatusDAO {

    // methods
    public static Status getStatusById(int statusId) {
        Status status = null;
        String query = "select * from Status where QuanLyThuVien.dbo.Status.statusId = ?";
        try {
            PreparedStatement preparedStatement = DBConnection.connect(query);
            preparedStatement.setInt(1, statusId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                status = new Status();
                status.setStatusId(statusId);
                status.setStatusName(resultSet.getString("statusName"));
                status.setDescription(resultSet.getString("description"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return status;
    }
}
