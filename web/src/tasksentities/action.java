package tasksentities;

import java.io.Serializable;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: action
 *
 */
@Entity

public class action implements Serializable {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	public task getId_task() {
		return id_task;
	}
	public void setId_task(task id_task) {
		this.id_task = id_task;
	}

	private String description;
	@ManyToOne()
	@JoinColumn(name="id_task")
	private task id_task;
	private static final long serialVersionUID = 1L;

	public action() {
		super();
	}   
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}   
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
   
}
