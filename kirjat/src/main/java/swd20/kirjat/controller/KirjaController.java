package swd20.kirjat.controller;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import swd20.kirjat.bean.Kirja;
import swd20.kirjat.bean.KirjaImpl;
import swd20.kirjat.dao.KirjaDAO;


@Controller
public class KirjaController {

	@Inject
	private KirjaDAO dao;
	
	public KirjaDAO getDao() {
		return dao;
	}

	public void setDao(KirjaDAO dao) {
		this.dao = dao;
	}
	
	//FORMIN TEKEMINEN
	@RequestMapping(value="secure/kirjat", method=RequestMethod.GET)
	public String getCreateForm(Model model) {
		Kirja tyhjaKirja = new KirjaImpl();
		//tyhjaKirja.setNimi("oletusnimi");
		
		model.addAttribute("kirja", tyhjaKirja);
		return "secure/createForm";
	}
	
	//FORMIN TIETOJEN VASTAANOTTO
	@RequestMapping(value="secure/kirjat", method=RequestMethod.POST)
	public String create( @ModelAttribute(value="kirja") @Valid KirjaImpl kirja, BindingResult result) {
		if (result.hasErrors()) {
			return "secure/createForm";
		} else {
			dao.talleta(kirja);
			return "redirect:/secure/kirjat/" + kirja.getId();
		}
	}
	
	//KIRJAN TIETOJEN NÄYTTÄMINEN
	@RequestMapping(value="secure/kirjat/{id}", method=RequestMethod.GET)
	public String getView(@PathVariable Integer id, Model model) {
		Kirja kirja = dao.etsi(id);
		model.addAttribute("kirja", kirja);
		return "secure/view";
	}
	
	//KIRJALISTAUS
	@RequestMapping(value="booklist", method=RequestMethod.GET) 
	public String getAll(Model model) {
		List<Kirja> kirjat = dao.haeKaikki();
		System.out.println(kirjat);
		model.addAttribute("kirjat", kirjat);
		return "kirj/booklist";
	}
	}
	

