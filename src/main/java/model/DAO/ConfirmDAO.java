package model.DAO;

import java.sql.PreparedStatement;

import model.DBConnection.DBConnection;

public class ConfirmDAO {

	public static boolean createConfirm(int historyId, int userId) {
		try {
			String query = "insert into Confirm(historyId, userId) values (?, ?)";
			PreparedStatement preparedStatement = DBConnection.connect(query);
			preparedStatement.setInt(1, historyId);
			preparedStatement.setInt(2, userId);
			return 1 == preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
