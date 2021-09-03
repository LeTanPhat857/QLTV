package model.DAO;

import model.DBConnection.DBConnection;
import model.object.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
	
	public static boolean checkLibraryCardId(int libraryCardId) {
		String query = "select libraryCardId from Users where libraryCardId = ?";
		try {
			PreparedStatement preparedStatement = DBConnection.connect(query);
			preparedStatement.setInt(1, libraryCardId);
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				return false;
			}else {
				return true;
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
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
	
	public static List<User> getUserList(int size, int page) {
		String sql = "with x as (select ROW_NUMBER() over (order by id) as row, * from Users where QuanLyThuVien.dbo.Users.roleId  = ? and QuanLyThuVien.dbo.Users.userStatusId = ?) "
						+ " select * from x where row between (?-1)*?+1 and (?-1)*?+?";
		List<User> list = new ArrayList<User>();
		try {
			PreparedStatement preparedStatement = DBConnection.connect(sql);
			preparedStatement.setInt(1, 1);
			preparedStatement.setInt(2, 1);
			preparedStatement.setInt(3, page);
			preparedStatement.setInt(4, size);
			preparedStatement.setInt(5, page);
			preparedStatement.setInt(6, size);
			preparedStatement.setInt(7, size);
			ResultSet resultSet =  preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				User user = new User();
				user.setId(resultSet.getInt("id"));
				user.setLibraryCardId(resultSet.getInt("libraryCardId"));
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
				list.add(user);
			}
				return list;
			
		} catch (SQLException | ClassNotFoundException | NumberFormatException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static int getQuantityUserInDb() {
		try {
			String sql = "select count(id) as quantity from Users where roleId  = 1 and userStatusId = 1";
			Statement statement = DBConnection.connectStatement();
			ResultSet result = statement.executeQuery(sql);
			int quantity =0;
			if (result.next()) {
				quantity =  result.getInt("quantity");
			}
			return quantity;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public static List<User> getStaffList() {
		String sql = "select * from QuanLyThuVien.dbo.Users where QuanLyThuVien.dbo.Users.roleId  > 1 and QuanLyThuVien.dbo.Users.userStatusId = ?";
		List<User> list = new ArrayList<User>();
		try {
			PreparedStatement preparedStatement = DBConnection.connect(sql);
			preparedStatement.setInt(1, 1);
			ResultSet resultSet =  preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				User user = new User();
				user.setId(resultSet.getInt("id"));
				user.setLibraryCardId(resultSet.getInt("libraryCardId"));
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
				list.add(user);
			}
				return list;
			
		} catch (SQLException | ClassNotFoundException | NumberFormatException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean setInformationUser(User user) {
		String update = "update Users set QuanLyThuVien.dbo.Users.getPassTime = current_timestamp where id = ?";
		try {
			PreparedStatement preparedStatement = DBConnection.connect(update);
			preparedStatement.setString(1, user.getEmail());
			preparedStatement.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public static boolean deleteReader(int libraryCardId) {
		try {
			String query = "update QuanLyThuVien.dbo.Users set userStatusId = 2 where libraryCardId = ?";
			PreparedStatement preparedStatement = DBConnection.connect(query);
			preparedStatement.setInt(1, libraryCardId);
			return 1 == preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean insertReader(User user) {
		try {
			String query = "INSERT INTO QuanLyThuVien.dbo.Users VALUES(? , ? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
			PreparedStatement preparedStatement = DBConnection.connect(query);
			preparedStatement.setInt(1, user.getLibraryCardId());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getName());
			preparedStatement.setString(4, user.getCMND());
			preparedStatement.setString(5, user.getGender());
			preparedStatement.setDate(6, user.getBirthday());
			preparedStatement.setString(7, user.getImgLink());
			preparedStatement.setString(8, user.getEmail());
			preparedStatement.setString(9, user.getAddress());
			preparedStatement.setDate(10, user.getCreatedDate());
			preparedStatement.setTimestamp(11, user.getGetPassTime());
			preparedStatement.setString(12, user.getRandomKey());
			preparedStatement.setInt(13, user.getRoleId());
			preparedStatement.setInt(14, user.getUserStatusId());
			return 1 == preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean updateReader(User user) {
		try {
			String query = "UPDATE QuanLyThuVien.dbo.Users SET libraryCardId = ?,password = ?,name = ?,CMND = ?,gender = ?,birthday = ?,imgLink = ?,email = ?,address = ?,createdDate = ?,getPassTime = ?,randomKey = ?,roleId = ?,userStatusId = ? where libraryCardId = ? ";
			PreparedStatement preparedStatement  = DBConnection.connect(query);
			preparedStatement.setInt(1, user.getLibraryCardId());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getName());
			preparedStatement.setString(4, user.getCMND());
			preparedStatement.setString(5, user.getGender());
			preparedStatement.setDate(6, user.getBirthday());
			preparedStatement.setString(7, user.getImgLink());
			preparedStatement.setString(8, user.getEmail());
			preparedStatement.setString(9, user.getAddress());
			preparedStatement.setDate(10, user.getCreatedDate());
			preparedStatement.setTimestamp(11, user.getGetPassTime());
			preparedStatement.setString(12, user.getRandomKey());
			preparedStatement.setInt(13, user.getRoleId());
			preparedStatement.setInt(14, user.getUserStatusId());
			preparedStatement.setInt(15, user.getLibraryCardId());
			return 1 == preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static void main(String[] args) {
	
	}
}
