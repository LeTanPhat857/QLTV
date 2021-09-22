package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.DBConnection.DBConnection;
import model.object.Language;
import model.object.Type;

public class TypeDAO {
	
	public static List<Type> getListType() {
        String query = "select * from Type ";
        try {
            PreparedStatement preparedStatement = DBConnection.connect(query);
            List<Type> list = new ArrayList<Type>();
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Type type = new Type();
                type.setId(resultSet.getInt("id"));
                type.setType(resultSet.getString("type"));
               list.add(type);
            }
            return list;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
	}
	
	public static Boolean insertTypeBook(Type type) {
        String query = "insert into Type (type) values(?)";
        try {
            PreparedStatement preparedStatement = DBConnection.connect(query);
            preparedStatement.setString(1, type.getType());
            return 1 == preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
	}
}
