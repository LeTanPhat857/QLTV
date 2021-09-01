package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.DBConnection.DBConnection;
import model.object.News;

public class NewsDAO {

	public static List<News> getNews(int numOfNews, int page) {
		try {
			List<News> result = new ArrayList<News>();
			String query = "select top (?) * from News  where id not in (select top (?) id from News order by createdDate desc) order by createdDate desc";

			PreparedStatement preparedStatement = DBConnection.connect(query);
			preparedStatement.setInt(1, numOfNews);
			preparedStatement.setInt(2, numOfNews * (page - 1));

			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				News news = new News();
				news.setId(resultSet.getInt("id"));
				news.setTitle(resultSet.getString("title"));
				news.setContent(resultSet.getString("content"));
				news.setCreatedDate(resultSet.getTimestamp("createdDate"));
				news.setImgLink(resultSet.getString("imgLink"));
				news.setUserId(resultSet.getInt("userId"));

				result.add(news);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		System.out.println(getNews(3, 1));
	}
}
