package model.DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import model.DBConnection.DBConnection;
import model.object.BorrowedBook;

public class HistoryDAO {

	public static List<BorrowedBook> getBorrowedBookByLibraryCardId(int libraryCardId) {
		try {
			List<BorrowedBook> borrowedBooks = new LinkedList<BorrowedBook>();
			String query = "select borrowDate, barcode, title, Author.name, publisher, price from Users, History, Book, Author, Publisher where  Book.authorId = Author.id and Book.id = History.bookId and Users.id = History.userId and Book.publisherId = Publisher.id and Users.libraryCardId = ?";

			PreparedStatement preparedStatement = DBConnection.connect(query);
			preparedStatement.setInt(1, libraryCardId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				BorrowedBook book = new BorrowedBook();
				book.setDate(resultSet.getTimestamp("borrowDate"));
				book.setBarcode(resultSet.getInt("barcode"));
				book.setTitle(resultSet.getString("title"));
				book.setAuthor(resultSet.getString("name"));
				book.setPublisher(resultSet.getString("publisher"));
				book.setPrice(resultSet.getInt("price"));
				borrowedBooks.add(book);
			}
			return borrowedBooks;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static boolean createHistory(Timestamp borrowDate, Timestamp payDate, String note, int bookId, int userId) {
		try {
			String query = "insert into History(borrowDate, payDate, note, bookId, userId) values (?, ?, ?, ?, ?)";
			PreparedStatement preparedStatement = DBConnection.connect(query);
			preparedStatement.setTimestamp(1, borrowDate);
			preparedStatement.setTimestamp(2, payDate);
			preparedStatement.setString(3, note);
			preparedStatement.setInt(4, bookId);
			preparedStatement.setInt(5, userId);
			return 1 == preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static void main(String[] args) {
//		System.out.println(createHistory(new Date(2021, 8, 23), null, "", 2, 1));
		System.out.println(new Timestamp(System.currentTimeMillis()));
		System.out.println(new Date(System.currentTimeMillis()));
	}
}
