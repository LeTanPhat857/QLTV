package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.DBConnection.DBConnection;
import model.object.Author;

public class AuthorDAO {

	public static Author getAuthorById(int id) {
        String query = "select * from Author where QuanLyThuVien.dbo.Author.id = ?";
        try {
            PreparedStatement preparedStatement = DBConnection.connect(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Author author = new Author();
                author.setId(id);
                author.setName(resultSet.getString("name"));
                author.setDescription(resultSet.getString("description"));
                return author;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
	}
}
