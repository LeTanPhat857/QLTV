package model.DAO;

import model.DBConnection.DBConnection;
import model.object.Book;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookDAO {
    public static Book getBookByCode(int bookCode) {
        Book book = new Book();
        String bookQuery = "select * from Book where isDelete = false and bookCode = ?";
        try {
            PreparedStatement preparedStatement = DBConnection.connect(bookQuery);
            preparedStatement.setInt(1, bookCode);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                book.setBookCode(bookCode);
                book.setTitle(resultSet.getString("title"));
                book.setPageNumber(resultSet.getInt("pageNumber"));
                book.setBorrow(resultSet.getBoolean("isBorrow"));
                book.setPrice(resultSet.getDouble("price"));
                book.setDelete(resultSet.getBoolean("isDelete"));
                book.setCreateDate(resultSet.getDate("createDate"));
                book.setAuthorId(resultSet.getInt("authorId"));
                book.setLanguageId(resultSet.getInt("langugeId"));
                book.setTypeId(resultSet.getInt("typeId"));
                book.setInputId(resultSet.getInt("inputId"));
                return book;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}
