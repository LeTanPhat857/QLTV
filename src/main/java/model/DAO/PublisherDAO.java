package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.DBConnection.DBConnection;
import model.object.Publisher;

public class PublisherDAO {

	public static Publisher getPublisherById(int id) {
        String query = "select * from Publisher where QuanLyThuVien.dbo.Publisher.id = ?";
        try {
            PreparedStatement preparedStatement = DBConnection.connect(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Publisher publisher = new Publisher();
                publisher.setId(id);
                publisher.setPublisher(resultSet.getString("publisher"));
                publisher.setAddress(resultSet.getString("address"));                
                publisher.setDescription(resultSet.getString("description"));
                return publisher;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
	}
}
