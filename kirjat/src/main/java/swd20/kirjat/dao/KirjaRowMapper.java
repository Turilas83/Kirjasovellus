package swd20.kirjat.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import swd20.kirjat.bean.Kirja;
import swd20.kirjat.bean.KirjaImpl;


public class KirjaRowMapper implements RowMapper<Kirja> {

		public Kirja mapRow(ResultSet rs, int rowNum) throws SQLException {
			Kirja k = new KirjaImpl();
			k.setNimi(rs.getString("nimi"));
			k.setTekija(rs.getString("tekija"));
			k.setId(rs.getInt("id"));
			k.setIsbn(rs.getString("isbn"));
			k.setJulkaisuvuosi(rs.getInt("julkaisuvuosi"));
			k.setPainos(rs.getInt("painos"));
			
			return k;
		}

	}

