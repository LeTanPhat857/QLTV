package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.DBConnection.DBConnection;
import model.object.Language;
import model.object.Publisher;

public class LaguageDAO {
	
	public static List<Language> getListLanguage() {
        String query = "select * from Language ";
        try {
            PreparedStatement preparedStatement = DBConnection.connect(query);
            List<Language> list = new ArrayList<Language>();
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Language language = new Language();
                language.setId(resultSet.getInt("id"));
                language.setLanguage(resultSet.getString("language"));
               list.add(language);
            }
            return list;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
	}
	
	public static Boolean insertLanguage(Language language) {
        String query = "insert into Language(language) values(?)";
        try {
            PreparedStatement preparedStatement = DBConnection.connect(query);
            preparedStatement.setString(1, language.getLanguage());
            return 1 == preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
	}

}
