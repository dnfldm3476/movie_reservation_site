package customer;
import java.sql.*;
import java.util.ArrayList;
public class customer_Beans {

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
			System.out.println("in connect");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Customer> getDBList() {
		connect();
		ArrayList<Customer> data = new ArrayList<Customer>();
		
		String sql = "select * from customer order by id_mem";
		try {
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			while(rs.next()) {
				Customer customer = new Customer();

				customer.setId_mem(rs.getInt("id_mem"));
				customer.setPass_word(rs.getString("pass_word"));
				customer.setName_mem(rs.getString("name_mem"));
				customer.setAge_mem(rs.getInt("age_mem"));
				customer.setRegister_date(rs.getString("register_date"));
				data.add(customer);
			}	
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		
		return data;
	}
	void disconnect() {
		if (stat != null) {
			try {
				stat.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public boolean insertDB(Customer customer) {
		connect();
		System.out.println("in insertDB");
		String sql = "insert into customer(id_mem, pass_word, name_mem, age_mem, register_date) values(?, ?, ?, ?, ?)";
		
		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1, customer.getId_mem());
			stat.setString(2, customer.getPass_word());
			stat.setString(3,  customer.getName_mem());
			stat.setInt(4,  customer.getAge_mem());
			stat.setString(5,  customer.getRegister_date());
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
	//public boolean updateDB(Customer customer);
	//public boolean deleteDB(int id);
	
}
