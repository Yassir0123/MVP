package tasksentities;

import java.io.Serializable;
import java.lang.String;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: taskgrp
 *
 */
@Entity

public class taskgrp implements Serializable {

	public category getId_prioritergrp() {
		return id_prioritergrp;
	}
	public void setId_prioritergrp(category id_prioritergrp) {
		this.id_prioritergrp = id_prioritergrp;
	}
	public user getId_user() {
		return id_user;
	}
	public void setId_user(user id_user) {
		this.id_user = id_user;
	}
	public List<actiongrp> getActions() {
		return actions;
	}
	public void setActions(List<actiongrp> actions) {
		this.actions = actions;
	}
	public groupe getId_grp() {
		return id_grp;
	}
	public void setId_grp(groupe id_grp) {
		this.id_grp = id_grp;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String title;
	private String description;
	private Date date_debut;
	private Date date_fin;
	private int status;
	@ManyToOne()
	@JoinColumn(name="id_prioritergrp")
	private category id_prioritergrp;
	 @ManyToOne()
	 @JoinColumn(name="id_user")
	 private user id_user;
	 @OneToMany(mappedBy="id_taskgrp")
	  private List<actiongrp>actions = new ArrayList<actiongrp>();
	  @ManyToOne()
	  @JoinColumn(name="id_grp")
	  private groupe id_grp;
	private static final long serialVersionUID = 1L;

	public taskgrp() {
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
