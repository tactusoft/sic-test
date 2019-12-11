package co.gov.sic.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import co.gov.sic.backend.model.Encuesta;

@Repository
public interface EncuestaRepository extends JpaRepository<Encuesta, Long> {

}
