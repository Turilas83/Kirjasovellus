package swd20.kirjat.dao;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@SuppressWarnings("serial")
@ResponseStatus(value=HttpStatus.NOT_FOUND)
public class KirjaaEiLoydyPoikkeus extends RuntimeException {
	
	public KirjaaEiLoydyPoikkeus(Exception cause) {
		super(cause);
	}
	
}