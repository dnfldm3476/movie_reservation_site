package movie_book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import movie_book.movie_book;
import movie_seat.movie_seat;

public class book_Beans {

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
	public movie_book getDB(int id_resv) {
		connect();

		String sql = "select * from movie_book where id_resv = ? ";
		movie_book book = new movie_book();
		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id_resv);
			rs = stat.executeQuery();
			rs.next();
			
			book.setId_resv(rs.getInt("id_resv"));
			book.setId_mem(rs.getInt("id_mem"));
			book.setId_film(rs.getInt("id_film"));
			book.setFilm_name(rs.getString("film_name"));
			book.setDate(rs.getString("date"));
			book.setResv_date(rs.getString("resv_date"));
			book.setSeat_no(rs.getInt("seat_no"));
			book.setStatus(rs.getString("status"));
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return book;
	}
	public movie_book getDB(int id_mem, String film_name) {
		connect();

		String sql = "select * from movie_book where id_mem = ? and film_name = ?";
		movie_book book = new movie_book();
		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id_mem);
			stat.setString(2,  film_name);
			rs = stat.executeQuery();
			rs.next();
			book.setId_resv(rs.getInt("id_resv"));
			book.setId_mem(rs.getInt("id_mem"));
			book.setId_film(rs.getInt("id_film"));
			book.setFilm_name(rs.getString("film_name"));
			book.setDate(rs.getString("date"));
			book.setResv_date(rs.getString("resv_date"));
			book.setSeat_no(rs.getInt("seat_no"));
			book.setStatus(rs.getString("status"));
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return book;
	}
	public ArrayList<movie_book> getAllDBList() {
		connect();
		ArrayList<movie_book> data = new ArrayList<movie_book>();

		String sql = "select * from movie_book order by id_film";
		try {
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			while (rs.next()) {
				movie_book book = new movie_book();

				book.setId_resv(rs.getInt("id_resv"));
				book.setId_mem(rs.getInt("id_mem"));
				book.setId_film(rs.getInt("id_film"));
				book.setFilm_name(rs.getString("film_name"));
				book.setDate(rs.getString("date"));
				book.setResv_date(rs.getString("resv_date"));
				book.setSeat_no(rs.getInt("seat_no"));
				book.setStatus(rs.getString("status"));
				
				data.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return data;
	}

	public ArrayList<movie_book> getDBList(int id_mem) {
		connect();
		ArrayList<movie_book> data = new ArrayList<movie_book>();

		String sql = "select * from movie_book where id_mem = ? order by id_film";
		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1,  id_mem);
			rs = stat.executeQuery();
			while (rs.next()) {
				movie_book book = new movie_book();

				book.setId_resv(rs.getInt("id_resv"));
				book.setId_mem(rs.getInt("id_mem"));
				book.setId_film(rs.getInt("id_film"));
				book.setFilm_name(rs.getString("film_name"));
				book.setDate(rs.getString("date"));
				book.setResv_date(rs.getString("resv_date"));
				book.setSeat_no(rs.getInt("seat_no"));
				book.setStatus(rs.getString("status"));
				
				data.add(book);
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

	public boolean insertDB(movie_book book) {
		connect();
		String sql = "insert into movie_book(id_resv, id_mem, id_film, film_name, date, resv_date, seat_no, status) values(?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1, book.getId_resv());
			stat.setInt(2, book.getId_mem());
			stat.setInt(3, book.getId_film());
			stat.setString(4, book.getFilm_name());
			stat.setString(5, book.getDate());
			stat.setString(6, book.getResv_date());
			stat.setInt(7, book.getSeat_no());
			stat.setString(8, book.getStatus());
			stat.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	public boolean updateDB(movie_book book) {
		connect();
		
		String sql = "update movie_book set status = ? where id_mem = ? and id_film = ?";
		try {
			stat = conn.prepareStatement(sql);
			stat.setString(1,  "OK");
			stat.setInt(2, book.getId_mem());
			stat.setInt(3, book.getId_film());
			stat.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean deleteDB_idmem(int id_mem) {
		connect();
		
		String sql = "delete from movie_book where id_mem = ?";
		
		try { 
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id_mem);
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
	public boolean deleteDB_idfilm(int id_film) {
		connect();
		
		String sql = "delete from movie_book where id_film = ?";
		
		try { 
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id_film);
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
	public boolean deleteDB_idresv(int id_resv) {
		connect();
		
		String sql = "delete from movie_book where id_resv = ?";
		
		try { 
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id_resv);
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
