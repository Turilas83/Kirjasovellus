package swd20.kirjat.dao;

import java.util.List;

import swd20.kirjat.bean.Kirja;

public interface KirjaDAO {

	public abstract void talleta(Kirja kirja);

	public abstract Kirja etsi(int id);

	public abstract List<Kirja> haeKaikki();

}