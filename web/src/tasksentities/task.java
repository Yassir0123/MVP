package tasksentities;

import java.io.Serializable;
import java.lang.String;
import java.sql.Date;
import javax.persistence.*;
import java.util.*;
/**
 * Entity implementation class for Entity: task
 *
 */
@Entity

public class task implements Serializable {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String title;
	private String description;
	public user getId_user() {
		return id_user;
	}
	public void setId_user(user id_user) {
		this.id_user = id_user;
	}
	public category getId_prioriter() {
		return id_prioriter;
	}
	public void setId_prioriter(category id_prioriter) {
		this.id_prioriter = id_prioriter;
	}
	public List<action> getActions() {
		return actions;
	}
	public void setActions(List<action> actions) {
		this.actions = actions;
	}

	private Date date_debut;
	private Date date_fin;
	private int status;
	private static final long serialVersionUID = 1L;
    @ManyToOne()
    @JoinColumn(name="id_user")
    private user id_user;
    @ManyToOne()
    @JoinColumn(name="id_prioriter")
    private category id_prioriter;
    @OneToMany(mappedBy="id_task")
    private List<action>actions = new ArrayList<action>();
	public task() {
		super();
	}   
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}   
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}   
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}   
	public Date getDate_debut() {
		return this.date_debut;
	}

	public void setDate_debut(Date date_debut) {
		this.date_debut = date_debut;
	}   
	public Date getDate_fin() {
		return this.date_fin;
	}

	public void setDate_fin(Date date_fin) {
		this.date_fin = date_fin;
	}   
	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
   
}
