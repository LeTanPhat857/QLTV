package model.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
			preparedStatement1.setDate(1, (Date) history.getBorrowDate());
			preparedStatement1.setDate(2, (Date) history.getPayDate());
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
}
