package model.DAO;

import model.DBConnection.DBConnection;
import model.object.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

public class UserDAO {
	public static User getUserByLibraryCardId(int libraryCardId) {
		String userQuery = "select * from QuanLyThuVien.dbo.Users where libraryCardId = ?";
		try {
			PreparedStatement preparedStatement = DBConnection.connect(userQuery);
			preparedStatement.setInt(1, libraryCardId);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				User user = new User();
				user.setId(resultSet.getInt("id"));
				user.setLibraryCardId(libraryCardId);
				user.setPassword(resultSet.getString("password"));
				user.setName(resultSet.getString("name"));
				user.setCMND(resultSet.getString("CMND"));
				user.setGender(resultSet.getString("gender"));
				user.setBirthday(resultSet.getDate("birthday"));
				user.setEmail(resultSet.getString("email"));
				user.setAddress(resultSet.getString("address"));
				user.setCreatedDate(resultSet.getDate("createdDate"));
				user.setImgLink(resultSet.getString("imgLink"));
				user.setRandomKey(resultSet.getString("randomKey"));
				user.setGetPassTime(resultSet.getTimestamp("getPassTime"));
				user.setRoleId(resultSet.getInt("roleId"));
				user.setUserStatusId(resultSet.getInt("userStatusId"));
				return user;
			}
		} catch (SQLException | ClassNotFoundException | NumberFormatException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static User getUserByLogin(int libraryCardId, String password) {
		try {
			User user = getUserByLibraryCardId(libraryCardId);
			if (user != null && user.getPassword().contentEquals(password)) {
				return user;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public static boolean checkEmail(String userEmail) {
		String query = "select email from Users where QuanLyThuVien.dbo.Users.Email = ?";
		try {
			PreparedStatement preparedStatement = DBConnection.connect(query);
			preparedStatement.setString(1, userEmail);
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				return true;
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static boolean checkGetPassTimeByEmail(String userEmail, int time) {
		String query = "select GetPassTime from Users where QuanLyThuVien.dbo.Users.Email = ?";
		try {
			PreparedStatement preparedStatement = DBConnection.connect(query);
			preparedStatement.setString(1, userEmail);
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				Date createdTime = resultSet.getTimestamp("getPassTime");
				Date currentTime = Calendar.getInstance().getTime();
				if (createdTime == null) {
					return false;
				}
				if (currentTime.getTime() - createdTime.getTime() > time) {
					return false;
				}
			} else {
				return false;
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean setGetPassTimeByEmail(String userEmail) {
		String update = "update Users set QuanLyThuVien.dbo.Users.getPassTime = current_timestamp where email = ?";
		try {
			PreparedStatement preparedStatement = DBConnection.connect(update);
			preparedStatement.setString(1, userEmail);
			preparedStatement.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public static boolean setRandomKeyByEmail(String userEmail, String randomKey) {
		String update = "update Users set QuanLyThuVien.dbo.Users.randomKey = ? where QuanLyThuVien.dbo.Users.email = ?";
		try {
			PreparedStatement preparedStatement = DBConnection.connect(update);
			preparedStatement.setString(1, randomKey);
			preparedStatement.setString(2, userEmail);
			preparedStatement.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean setGetPassTimeAndRandomKeyByEmail(String userEmail, String randomKey) {
		return setGetPassTimeByEmail(userEmail) && setRandomKeyByEmail(userEmail, randomKey);
	}

	public static User getUserByEmail(String email) {
		String userQuery = "select * from Users where QuanLyThuVien.dbo.Users.email = ?";
		try {
			PreparedStatement preparedStatement = DBConnection.connect(userQuery);
			preparedStatement.setString(1, email);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				User user = new User();
				user.setLibraryCardId(resultSet.getInt("libraryCardId"));
				user.setPassword(resultSet.getString("password"));
				user.setName(resultSet.getString("name"));
				user.setCMND(resultSet.getString("CMND"));
				user.setGender(resultSet.getString("gender"));
				user.setBirthday(resultSet.getDate("birthday"));
				user.setEmail(email);
				user.setAddress(resultSet.getString("address"));
				user.setCreatedDate(resultSet.getDate("createdDate"));
				user.setImgLink(resultSet.getString("imgLink"));
				user.setRandomKey(resultSet.getString("randomKey"));
				user.setGetPassTime(resultSet.getTimestamp("getPassTime"));
				user.setRoleId(resultSet.getInt("roleId"));
				user.setUserStatusId(resultSet.getInt("userStatusId"));
				return user;
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static boolean resetPassByEmail(String email, String pass) {
		String update = "update Users set QuanLyThuVien.dbo.Users.password = ? where QuanLyThuVien.dbo.Users.email = ?";
		try {
			PreparedStatement preparedStatement = DBConnection.connect(update);
			preparedStatement.setString(1, pass);
			preparedStatement.setString(2, email);
			preparedStatement.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public static void main(String[] args) {
		System.out.println(getUserByLibraryCardId(18130170).getName());
	}
}
