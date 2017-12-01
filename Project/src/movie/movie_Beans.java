package movie;

import java.sql.*;
import java.util.ArrayList;

import movie.Movie;

public class movie_Beans {

	private final String SERVER = "localhost";
	private final String ID = "root";
	private final String PWD = "1234";
	private final String DATABASE = "movie";
	private final String PORT = "3306";
	private Connection conn = null;
	private PreparedStatement stat = null;
	private ResultSet rs = null;

	void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://" + SERVER + ":" + PORT + "/" + DATABASE;
			//String option = "?useUnicode=true&characterEncoding=utf8";
			//url = url + option;
			
			conn = DriverManager.getConnection(url, ID, PWD);
			System.out.println("in connect");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Movie getDB(int id_film) {
		connect();

		String sql = "select * from movie_info where id_film = ?";
		Movie movie = new Movie();
		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id_film);
			rs = stat.executeQuery();
			rs.next();
			movie.setId_film(rs.getInt("id_film"));
			movie.setName_film(rs.getString("name_film"));
			movie.setAge_phase(rs.getInt("age_phase"));
			movie.setSeat_num(rs.getInt("seat_num"));
			movie.setDate(rs.getString("date"));
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return movie;
	}

	public ArrayList<Movie> getDBList() {
		connect();
		ArrayList<Movie> data = new ArrayList<Movie>();

		String sql = "select * from movie_info order by id_film";
		try {
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			while (rs.next()) {
				Movie movie = new Movie();

				movie.setId_film(rs.getInt("id_film"));
				movie.setName_film(rs.getString("name_film"));
				movie.setAge_phase(rs.getInt("age_phase"));
				movie.setSeat_num(rs.getInt("seat_num"));
				movie.setDate(rs.getString("date"));
				data.add(movie);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return data;
	}

	void disconnect() {
		if (stat != null) {
			try {
				stat.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean insertDB(Movie movie) {
		connect();
		System.out.println("in insertDB");
		String sql = "insert into movie_info(id_film, name_film, age_phase, seat_num, date) values(?, ?, ?, ?, ?)";

		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1, movie.getId_film());
			stat.setString(2, movie.getName_film());
			stat.setInt(3, movie.getAge_phase());
			stat.setInt(4, movie.getSeat_num());
			stat.setString(5, movie.getDate());
			stat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	public boolean deleteDB(int id) {
		connect();
		
		String sql = "delete from movie_info where id_film = ?";
		
		try { 
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id);
			stat.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
			return false;			
		}
		finally {
			disconnect();
		}
		return true;
		
	}
}
