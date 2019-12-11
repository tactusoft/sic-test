package co.gov.sic.backend.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import co.gov.sic.backend.exception.ResourceNotFoundException;
import co.gov.sic.backend.model.Encuesta;
import co.gov.sic.backend.repository.EncuestaRepository;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api/v1")
public class EncuestaController {
	@Autowired
	private EncuestaRepository encuestaRepository;

	@GetMapping("/encuesta")
	public List<Encuesta> getAllencuesta() {
		return encuestaRepository.findAll();
	}

	@GetMapping("/encuesta/{id}")
	public ResponseEntity<Encuesta> getEncuestaById(@PathVariable(value = "id") Long id)
			throws ResourceNotFoundException {
		Encuesta encuesta = encuestaRepository.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("No existe la encuesta con id: " + id));
		return ResponseEntity.ok().body(encuesta);
	}

	@PostMapping("/encuesta")
	public Encuesta createEncuesta(@Valid @RequestBody Encuesta encuesta) {
		encuesta.setFechaRespuesta(new Date());
		return encuestaRepository.save(encuesta);
	}

	@DeleteMapping("/encuesta/{id}")
	public Map<String, Boolean> deleteEncuesta(@PathVariable(value = "id") Long id) throws ResourceNotFoundException {
		Encuesta encuesta = encuestaRepository.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("No existe el encuesta con id: " + id));

		encuestaRepository.delete(encuesta);
		Map<String, Boolean> response = new HashMap<>();
		response.put("deleted", Boolean.TRUE);
		return response;
	}
}
