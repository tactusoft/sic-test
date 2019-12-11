package co.gov.sic.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import co.gov.sic.backend.model.MarcaPC;
import co.gov.sic.backend.repository.MarcaPCRepository;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api/v1")
public class MarcaPCController {
	@Autowired
	private MarcaPCRepository marcaPCRepository;

	@GetMapping("/marcapc")
	public List<MarcaPC> getAllencuesta() {
		return marcaPCRepository.findAll();
	}
}
