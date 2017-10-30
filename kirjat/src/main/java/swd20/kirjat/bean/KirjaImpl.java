package swd20.kirjat.bean;


import javax.validation.constraints.Digits;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class KirjaImpl implements Kirja {
	
	@Size(min=1, max=255)
	String nimi;
	String tekija;
	@Pattern(regexp = "^(?:ISBN(?:-1[03])?:? )?(?=[0-9X]{10}$|(?=(?:[0-9]+[- ]){3})[- 0-9X]{13}$|97[89][0-9]{10}$|(?=(?:[0-9]+[- ]){4})[- 0-9]{17}$)(?:97[89][- ]?)?[0-9]{1,5}[- ]?[0-9]+[- ]?[0-9]+[- ]?[0-9X]$")
	String isbn;
	@Digits(fraction = 0, integer = 4)
	int julkaisuvuosi;
	@Digits(fraction = 0, integer = 5)
	int painos;

	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNimi() {
		return nimi;
	}

	public void setNimi(String nimi) {
		this.nimi = nimi;
	}

	public String getTekija() {
		return tekija;
	}

	public void setTekija(String tekija) {
		this.tekija = tekija;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public int getJulkaisuvuosi() {
		return julkaisuvuosi;
	}

	public void setJulkaisuvuosi(int julkaisuvuosi) {
		this.julkaisuvuosi = julkaisuvuosi;
	}

	public int getPainos() {
		return painos;
	}

	public void setPainos(int painos) {
		this.painos = painos;
	}

	@Override
	public String toString() {
		return "KirjaImpl [nimi=" + nimi + ", tekija=" + tekija + ", isbn=" + isbn + ", julkaisuvuosi=" + julkaisuvuosi
				+ ", painos=" + painos + ", id=" + id + "]";
	}

}
