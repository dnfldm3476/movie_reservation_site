package customer;

public class Customer {
	private int id_mem;
	private String pass_word;
	private String name_mem;
	private int age_mem;
	private String register_date;
	
	public int getId_mem() {
		return id_mem;
	}
	public String getPass_word() {
		return pass_word;
	}
	public String getName_mem() {
		return name_mem;
	}
	public int getAge_mem() {
		return age_mem;
	}
	public String getRegister_date() {
		return register_date;
	}
	
	public void setId_mem(int id_mem) {
		this.id_mem = id_mem;
	}
	public void setPass_word(String pass_word) {
		this.pass_word = pass_word;
	}
	public void setName_mem(String name_mem) {
		this.name_mem = name_mem;
	}
	public void setAge_mem(int age_mem) {
		this.age_mem = age_mem;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	
}
