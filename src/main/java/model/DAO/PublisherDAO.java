package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public static List<Publisher> getListPublisher() {
        String query = "select * from Publisher ";
        try {
            PreparedStatement preparedStatement = DBConnection.connect(query);
            List<Publisher> list = new ArrayList<Publisher>();
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Publisher publisher = new Publisher();
                publisher.setId(resultSet.getInt("id"));
                publisher.setPublisher(resultSet.getString("publisher"));
                publisher.setAddress(resultSet.getString("address"));                
                publisher.setDescription(resultSet.getString("description"));
               list.add(publisher);
            }
            return list;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
	}
}
