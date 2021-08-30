package model.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import model.DBConnection.DBConnection;
import model.object.Confirm;
import model.object.History;

public class BorrowDAO {
	
	public static boolean createHistoryAndConfirm(History history, Confirm confirm) {
		Connection connection = DBConnection.connection;
		try {
			// disable auto commit mode
			connection.setAutoCommit(false);
			// save history
			String query1 = "insert into History(borrowDate, payDate, note, bookId, userId) values (?, ?, ?, ?, ?)";
			PreparedStatement preparedStatement1 = DBConnection.connect(query1);
			preparedStatement1.setTimestamp(1, history.getBorrowDate());
			preparedStatement1.setTimestamp(2,  history.getPayDate());
			preparedStatement1.setString(3, history.getNote());
			preparedStatement1.setInt(4, history.getBookId());
			preparedStatement1.setInt(5, history.getUserId());
			// save confirm
			String query2 = "insert into Confirm(historyId, userId) values (?, ?)";
			PreparedStatement preparedStatement2 = DBConnection.connect(query2);
			preparedStatement2.setInt(1, confirm.getHistoryId());
			preparedStatement2.setInt(2, confirm.getId());
			// commit
			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		return false;
	}

	public static boolean createHistoryAndUpdateBookStatus(Timestamp borrowDate, Timestamp payDate, String note, int bookId, int userId) {
		Connection connection = DBConnection.connection;
		try {
			// disable auto commit mode
			connection.setAutoCommit(false);
			// save history
			String query1 = "insert into History(borrowDate, payDate, note, bookId, userId) values (?, ?, ?, ?, ?)";
			PreparedStatement preparedStatement1 = DBConnection.connect(query1);
			preparedStatement1.setTimestamp(1, borrowDate);
			preparedStatement1.setTimestamp(2, payDate);
			preparedStatement1.setString(3, note);
			preparedStatement1.setInt(4, bookId);
			preparedStatement1.setInt(5, userId);
			// upadate book status
			String query2 = "update Book set bookStatusId = 2 where id = ?";
			PreparedStatement preparedStatement = DBConnection.connect(query2);
			preparedStatement.setInt(1, bookId);
			// commit
			connection.commit();
			// return
			return 1 == preparedStatement1.executeUpdate() && 1 == preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		// reset autocommit
		try {
			connection.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
