package movie;

public class Movie {
	private int id_film;
	private String name_film;
	private int age_phase;
	private int seat_num;
	private String date;
	
	
	public int getId_film() {
		return this.id_film;
	}
	public String getName_film() {
		return this.name_film;
	}
	public int getAge_phase() {
		return this.age_phase;
	}
	public int getSeat_num() {
		return this.seat_num;
	}
	public String getDate() {
		return this.date;
	}
	public void setId_film(int id_film) {
		this.id_film = id_film;
	}
	public void setName_film(String name_film) {
		this.name_film= name_film;
	}
	public void setAge_phase(int age_phase) {
		this.age_phase = age_phase;
	}
	public void setSeat_num(int seat_num) {
		this.seat_num= seat_num;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
