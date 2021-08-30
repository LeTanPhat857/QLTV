package model.DAO;

import model.DBConnection.DBConnection;
import model.object.Book;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookDAO {
	public static Book getBookByBarcode(int barcode) {
		Book book = new Book();
		String bookQuery = "select * from Book where barcode = ?";
		try {
			PreparedStatement preparedStatement = DBConnection.connect(bookQuery);
			preparedStatement.setInt(1, barcode);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				book.setId(resultSet.getInt("id"));
				book.setBarcode(barcode);
				book.setTitle(resultSet.getString("title"));
				book.setPageNumber(resultSet.getInt("pageNumber"));
				book.setPrice(resultSet.getInt("price"));
				book.setDescription(resultSet.getString("description"));
				book.setImgLink(resultSet.getString("imgLink"));
				book.setCreateDate(resultSet.getDate("createdDate"));
				book.setBookStatusId(resultSet.getInt("bookStatusId"));
				book.setPublisherId(resultSet.getInt("publisherId"));
				book.setAuthorId(resultSet.getInt("authorId"));
				book.setLanguageId(resultSet.getInt("languageId"));
				book.setTypeId(resultSet.getInt("typeId"));
				book.setBatchId(resultSet.getInt("batchId"));
				return book;
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static boolean updateBorrowedStatusById(int id) {
		try {
			String query = "update Book set bookStatus = 2 where id = ?";
			PreparedStatement preparedStatement = DBConnection.connect(query);
			preparedStatement.setInt(1, id);
			return 1 == preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static void main(String[] args) {
		System.out.println(getBookByBarcode(85970001).getTitle());;
	}
}
