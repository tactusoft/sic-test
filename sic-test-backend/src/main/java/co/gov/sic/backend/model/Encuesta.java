package co.gov.sic.backend.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "encuesta")
public class Encuesta {

	private Long nroDocumento;
	private String email;
	private String comentarios;
	private MarcaPC marcaPC;
	private Date fechaRespuesta;

	@Id
	@Column(name = "nro_documento", nullable = false)
	public Long getNroDocumento() {
		return nroDocumento;
	}

	public void setNroDocumento(Long nroDocumento) {
		this.nroDocumento = nroDocumento;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getComentarios() {
		return comentarios;
	}

	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}

	@ManyToOne
	@JoinColumn(name = "id_marca_pc")
	public MarcaPC getMarcaPC() {
		return marcaPC;
	}

	public void setMarcaPC(MarcaPC marcaPC) {
		this.marcaPC = marcaPC;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "fecha_respuesta", nullable = false)
	public Date getFechaRespuesta() {
		return fechaRespuesta;
	}

	public void setFechaRespuesta(Date fechaRespuesta) {
		this.fechaRespuesta = fechaRespuesta;
	}

}
