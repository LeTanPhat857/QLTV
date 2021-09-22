package model.DAO;

import model.DBConnection.DBConnection;
import model.object.Book;
import model.object.Book_ver2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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

	// lay toan bo sach
	public static List<Book> getListBook() {
		String sql = "select * from book where bookStatusId <=3";
		List<Book> list = new ArrayList<Book>();
		try {
			Statement statement = DBConnection.connectStatement();
			ResultSet result = statement.executeQuery(sql);
			while (result.next()) {
				Book book = new Book();
				book.setId(result.getInt("id"));
				book.setBarcode(result.getInt("barcode"));
				book.setTitle(result.getNString("title"));
				book.setPageNumber(result.getInt("pageNumber"));
				book.setPrice(result.getInt("price"));
				book.setDescription(result.getString("description"));
				book.setImgLink(result.getString("imgLink"));
				book.setCreateDate(result.getDate("createdDate"));
				book.setBookStatusId(result.getInt("bookStatusId"));
				book.setAuthorId(result.getInt("authorId"));
				book.setLanguageId(result.getInt("languageId"));
				book.setTypeId(result.getInt("typeId"));
				book.setPublisherId(result.getInt("publisherId"));
				book.setBatchId(result.getInt("batchId"));
				list.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// phan trang
	public static List<Book_ver2> getListBookByPagination(int size, int page) throws SQLException {
		String sql = "with x as(select ROW_NUMBER() over(order by book.id) as row, book.id, barcode, title, pageNumber, price, Book.description, imgLink,createdDate,BookStatus.description as status,Author.name as author,Language.language as language, Type.type as type, Publisher.publisher as publisher,Batch.date as dateOfBatch from Book, Author, Publisher,BookStatus,Language,Type,Batch "
				+ " where  Book.authorId = Author.id " + " and Book.bookStatusId = BookStatus.id "
				+ " and Book.typeId = Type.id " + " and Book.languageId = Language.id "
				+ " and Book.batchId = Batch.id " + " and Book.publisherId = Publisher.id and Book.bookStatusId <=3 ) "
				+ " select * from x where row between (?-1)*?+1 and (?-1)*?+?";
		List<Book_ver2> list = new ArrayList<Book_ver2>();
		try {
			PreparedStatement preparedStatement = DBConnection.connect(sql);
			preparedStatement.setInt(1, page);
			preparedStatement.setInt(2, size);
			preparedStatement.setInt(3, page);
			preparedStatement.setInt(4, size);
			preparedStatement.setInt(5, size);
			ResultSet result = preparedStatement.executeQuery();
			while (result.next()) {
				Book_ver2 book = new Book_ver2();
				book.setId(result.getInt("id"));
				book.setBarcode(result.getInt("barcode"));
				book.setTitle(result.getNString("title"));
				book.setPageNumber(result.getInt("pageNumber"));
				book.setPrice(result.getInt("price"));
				book.setDescription(result.getString("description"));
				book.setImgLink(result.getString("imgLink"));
				book.setCreatedDate(result.getDate("createdDate"));
				book.setStatus(result.getString("status"));
				book.setAuthor(result.getString("author"));
				book.setLanguage(result.getString("language"));
				book.setType(result.getString("type"));
				book.setPublisher(result.getString("publisher"));
				book.setDateOfBatch(result.getDate("dateOfBatch"));
				list.add(book);
			}
		} catch (Exception e) {
			System.out.println("loi roi" + e);
		}
		return list;
	}

	public static int getQuantityBookInDb() {
		try {
			String sql = "select count(id) as quantity from book where bookStatusId <=3";
			Statement statement = DBConnection.connectStatement();
			ResultSet result = statement.executeQuery(sql);
			int quantity = 0;
			if (result.next()) {
				quantity = result.getInt("quantity");
			}
			return quantity;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static boolean insertBook(Book book) {
		try {
			String sql = "INSERT INTO Book VALUES(? , ? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement statement = DBConnection.connect(sql);
			statement.setInt(1, book.getBarcode());
			statement.setNString(2, book.getTitle());
			statement.setInt(3, book.getPageNumber());
			statement.setInt(4, (int) book.getPrice());
			statement.setNString(5, book.getDescription());
			statement.setString(6, book.getImgLink());
			statement.setDate(7, book.getCreatedDate());
			statement.setInt(8, book.getBookStatusId());
			statement.setInt(9, book.getAuthorId());
			statement.setInt(10, book.getLanguageId());
			statement.setInt(11, book.getTypeId());
			statement.setInt(12, book.getPublisherId());
			statement.setInt(13, book.getBatchId());
			return 1 == statement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean checkBookCanDelete(int bookId) {
		try {
			String query = "select * from book where  id = ? and bookStatusId = 1";
			PreparedStatement preparedStatement = DBConnection.connect(query);
			preparedStatement.setInt(1, bookId);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean deleteBook(int bookId) {
		try {
			String query = "update Book set bookStatusId = 4 where id = ?";
			PreparedStatement preparedStatement = DBConnection.connect(query);
			preparedStatement.setInt(1, bookId);
			return 1 == preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static Book getBookById(int id) {
		Book book = new Book();
		String bookQuery = "select * from Book where id = ?";
		try {
			PreparedStatement preparedStatement = DBConnection.connect(bookQuery);
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				book.setId(id);
				book.setBarcode(resultSet.getInt("barcode"));
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
	
	public static boolean updateBook(Book book) {
		try {
			String sql = "UPDATE Book SET barcode = ?, title = ?, pageNumber = ?, price = ?, description = ?, imgLink = ?, createdDate = ?, bookStatusId = ?, authorId = ?, languageId = ?, typeId = ?, publisherId = ?, batchId=? WHERE barcode = ?";
			PreparedStatement statement = DBConnection.connect(sql);
			statement.setInt(1, book.getBarcode());
			statement.setNString(2, book.getTitle());
			statement.setInt(3, book.getPageNumber());
			statement.setInt(4,(int) book.getPrice());
			statement.setNString(5, book.getDescription());
			statement.setString(6, book.getImgLink());
			statement.setDate(7, book.getCreatedDate());
			statement.setInt(8, book.getBookStatusId());
			statement.setInt(9, book.getAuthorId());
			statement.setInt(10, book.getLanguageId());
			statement.setInt(11, book.getTypeId());
			statement.setInt(12, book.getPublisherId());
			statement.setInt(13, book.getBatchId());
			statement.setInt(14, book.getBarcode());
		 return 1 == statement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}	
	}
	

	public static void main(String[] args) {
	}
}
