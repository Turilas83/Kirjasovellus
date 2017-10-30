package swd20.kirjat.bean;

public interface Kirja {
	
	public abstract int getId();

	public abstract void setId(int id);

	public abstract String getNimi();

	public abstract void setNimi(String nimi);

	public abstract String getTekija();

	public abstract void setTekija(String tekija);
	
	public abstract String getIsbn();
	
	public abstract void setIsbn(String isbn);
	
	public abstract int getJulkaisuvuosi();
	
	public abstract void setJulkaisuvuosi(int julkaisuvuosi);
	
	public abstract int getPainos();
	
	public abstract void setPainos(int painos);
	
}
