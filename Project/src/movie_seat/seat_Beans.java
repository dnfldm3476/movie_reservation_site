package movie_seat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import movie_seat.movie_seat;

public class seat_Beans {
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
			String option = "?useUnicode=true&characterEncoding=utf8";
			url = url + option;

			conn = DriverManager.getConnection(url, ID, PWD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public movie_seat getDB(int id_film) {
		connect();

		String sql = "select * from movie_seat where id_film = ?";
		movie_seat seat = new movie_seat();
		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id_film);
			rs = stat.executeQuery();
			
			rs.next();
			seat.setId_seat(rs.getInt("id_seat"));
			seat.setId_film(rs.getInt("id_film"));
			seat.setS1(rs.getInt("s1"));
			seat.setS2(rs.getInt("s2"));
			seat.setS3(rs.getInt("s3"));
			seat.setS4(rs.getInt("s4"));
			seat.setS5(rs.getInt("s5"));
			seat.setS6(rs.getInt("s6"));
			seat.setS7(rs.getInt("s7"));
			seat.setS8(rs.getInt("s8"));
			seat.setS9(rs.getInt("s9"));
			System.out.println("int getDB");
			System.out.println(seat.getS1());
			System.out.println(seat.getS2());
			System.out.println(seat.getS3());
			System.out.println(seat.getS4());
			System.out.println(seat.getS5());
			System.out.println(seat.getS6());
			System.out.println(seat.getS7());
			System.out.println(seat.getS8());					
			System.out.println(seat.getS9());
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return seat;
	}

	public ArrayList<movie_seat> getDBList() {
		connect();
		ArrayList<movie_seat> data = new ArrayList<movie_seat>();

		String sql = "select * from movie_seat order by id_seat";
		try {
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			while (rs.next()) {
				movie_seat seat = new movie_seat();
				seat.setId_seat(rs.getInt("id_seat"));
				seat.setId_film(rs.getInt("id_film"));
				seat.setS1(rs.getInt("s1"));
				seat.setS2(rs.getInt("s2"));
				seat.setS3(rs.getInt("s3"));
				seat.setS4(rs.getInt("s4"));
				seat.setS5(rs.getInt("s5"));
				seat.setS6(rs.getInt("s6"));
				seat.setS7(rs.getInt("s7"));
				seat.setS8(rs.getInt("s8"));
				seat.setS9(rs.getInt("s9"));
				data.add(seat);
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

	public boolean insertDB(movie_seat seat) {
		connect();
		String sql = "insert into movie_seat(id_seat, id_film, s1, s2, s3, s4,s5, s6, s7, s8, s9) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1, seat.getId_seat());
			stat.setInt(2, seat.getId_film());
			stat.setInt(3, seat.getS1());
			stat.setInt(4, seat.getS2());
			stat.setInt(5, seat.getS3());
			stat.setInt(6, seat.getS4());
			stat.setInt(7, seat.getS5());
			stat.setInt(8, seat.getS6());
			stat.setInt(9, seat.getS7());
			stat.setInt(10, seat.getS8());
			stat.setInt(11, seat.getS9());
			stat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	public boolean updateDB(int id_film, int cnt, int value) {
		connect();
		
		String sql = "update movie_seat set s" + cnt +"= ? where id_film = ?";
		System.out.println(sql);
		
		
		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1,  value);
			stat.setInt(2,  id_film);
			stat.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean deleteDB(int id) {
		connect();
		
		String sql = "delete from movie_seat where id_seat = ?";
		
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
