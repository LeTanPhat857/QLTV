package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.DBConnection.DBConnection;
import model.object.Author;
import model.object.Language;

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
	
	public static List<Author> getListAuthor() {
        String query = "select * from Author ";
        try {
        	List<Author> list = new ArrayList<Author>();
            PreparedStatement preparedStatement = DBConnection.connect(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Author author = new Author();
                author.setId(resultSet.getInt("id"));
                author.setName(resultSet.getString("name"));
                author.setDescription(resultSet.getString("description"));
                list.add(author);
            }
            return list;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
	}
	
	public static Boolean insertAuthor(Author author) {
        String query = "insert into Author(name, description) values(?, ?);";
        try {
            PreparedStatement preparedStatement = DBConnection.connect(query);
            preparedStatement.setString(1, author.getName());
            preparedStatement.setString(2, author.getDescription());
            return 1 == preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
	}
}
