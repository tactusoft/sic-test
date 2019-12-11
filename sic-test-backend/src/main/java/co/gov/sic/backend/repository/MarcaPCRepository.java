package co.gov.sic.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import co.gov.sic.backend.model.MarcaPC;

@Repository
public interface MarcaPCRepository extends JpaRepository<MarcaPC, Long> {

}
