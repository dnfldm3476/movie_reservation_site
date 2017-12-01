package movie_book;

public class movie_book {
	private int id_resv;
	private int id_mem;
	private int id_film;
	private String film_name;
	private String date;
	private String resv_date;
	private int seat_no;
	private String status;

	public int getId_resv() {
		return this.id_resv;
	}

	public int getId_mem() {
		return this.id_mem;
	}

	public int getId_film() {
		return this.id_film;
	}

	public String getFilm_name() {
		return this.film_name;
	}

	public String getDate() {
		return this.date;
	}

	public String getResv_date() {
		return this.resv_date;
	}

	public int getSeat_no() {
		return this.seat_no;
	}

	public String getStatus() {
		return this.status;
	}

	public void setId_resv(int id_resv) {
		this.id_resv = id_resv;
	}

	public void setId_mem(int id_mem) {
		this.id_mem = id_mem;
	}

	public void setId_film(int id_film) {
		this.id_film = id_film;
	}

	public void setFilm_name(String film_name) {
		this.film_name = film_name;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setResv_date(String resv_date) {
		this.resv_date = resv_date;
	}

	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
