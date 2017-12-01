package movie_seat;

public class movie_seat {
	private int id_seat;
	private int id_film;
	private int s1;
	private int s2;
	private int s3;
	private int s4;
	private int s5;
	private int s6;
	private int s7;
	private int s8;
	private int s9;
	public int[] seat = new int[10];
	
	public int getId_seat() {
		return this.id_seat;
	}
	public int getId_film() {
		return this.id_film;
	}
	public int getS1() {
		return this.s1;
	}
	public int getS2() {
		return this.s2;
	}
	public int getS3() {
		return this.s3;
	}
	public int getS4() {
		return this.s4;
	}
	public int getS5() {
		return this.s5;
	}
	public int getS6() {
		return this.s6;
	}
	public int getS7() {
		return this.s7;
	}
	public int getS8() {
		return this.s8;
	}
	public int getS9() {
		return this.s9;
	}
	public void setId_seat(int id_seat) {
		this.id_seat = id_seat;
	}
	public void setId_film(int id_film) {
		this.id_film = id_film;
	}
	public void setS1(int s1) {
		seat[0] = s1;
		this.s1 = s1;
	}
	public void setS2(int s2) {
		seat[1] = s2;
		this.s2 = s2;
	}
	public void setS3(int s3) {
		seat[2] = s3;
		this.s3 = s3;
	}
	
	public void setS4(int s4) {
		seat[3] = s4;
		this.s4 = s4;
	}
	public void setS5(int s5) {
		seat[4] = s5;
		this.s5 = s5;
	}
	public void setS6(int s6) {
		seat[5] = s6;
		this.s6 = s6;
	}
	public void setS7(int s7) {
		seat[6] = s7;
		this.s7 = s7;
	}
	public void setS8(int s8) {
		seat[7] = s8;
		this.s8 = s8;
	}
	public void setS9(int s9) {
		seat[8] = s9;
		this.s9 = s9;
	}	
	
}
