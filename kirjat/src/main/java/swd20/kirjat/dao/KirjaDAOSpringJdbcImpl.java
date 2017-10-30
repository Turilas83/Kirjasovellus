package swd20.kirjat.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import swd20.kirjat.bean.Kirja;

@Repository
public class KirjaDAOSpringJdbcImpl implements KirjaDAO {
		
	@Inject
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}


	
	/**
	 * Tallettaa parametrina annetun kirjan tietokantaan.
	 * Tietokannan generoima id asetetaan parametrina annettuun olioon.
	 */
	public void talleta(Kirja k) {
		final String sql = "insert into kirja(nimi, tekija, isbn, julkaisuvuosi, painos) values(?,?,?,?,?)";
		
		//anonyymi sisäluokka tarvitsee vakioina välitettävät arvot,
		//jotta roskien keruu onnistuu tämän metodin suorituksen päättyessä. 
		final String nimi = k.getNimi();
		final String tekija = k.getTekija();
		final String isbn = k.getIsbn();
		final int julkaisuvuosi = k.getJulkaisuvuosi();
		final int painos = k.getPainos();
				
		//jdbc pistää generoidun id:n tänne talteen
		KeyHolder idHolder = new GeneratedKeyHolder();
	    
		//suoritetaan päivitys itse määritellyllä PreparedStatementCreatorilla ja KeyHolderilla
		jdbcTemplate.update(
	    	    new PreparedStatementCreator() {
	    	        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
	    	            PreparedStatement ps = connection.prepareStatement(sql, new String[] {"id"});
	    	            ps.setString(1, nimi);
	    	            ps.setString(2, tekija);
	    	            ps.setString(3, isbn);
	    	            ps.setInt(4, julkaisuvuosi);
	    	            ps.setInt(5, painos);
	    	            return ps;
	    	        }
	    	    }, idHolder);
	    
		//tallennetaan id takaisin beaniin, koska
		//kutsujalla pitäisi olla viittaus samaiseen olioon
	    k.setId(idHolder.getKey().intValue());

	}
	

	public Kirja etsi(int id) {
		String sql = "select nimi, tekija, id, isbn, julkaisuvuosi, painos from kirja where id = ?";
		Object[] parametrit = new Object[] { id };
		RowMapper<Kirja> mapper = new KirjaRowMapper();
		
	    Kirja k;
	    try { 
	    k = jdbcTemplate.queryForObject(sql , parametrit, mapper);
	    } catch(IncorrectResultSizeDataAccessException e) {
	    	throw new KirjaaEiLoydyPoikkeus(e);
	    }
	    return k;
	                                  

	}
	

	public List<Kirja> haeKaikki() {
		
		String sql = "select id, nimi, tekija, isbn, julkaisuvuosi, painos from kirja";
		RowMapper<Kirja> mapper = new KirjaRowMapper();
		List<Kirja> kirjat = jdbcTemplate.query(sql,mapper);

		return kirjat;
	}
}
