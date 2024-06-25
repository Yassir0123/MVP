package tasksentities;

import java.io.Serializable;
import java.util.*;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: user
 *
 */
@Entity

public class user implements Serializable {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private java.sql.Date date_creation;
	public java.sql.Date getDate_creation() {
		return date_creation;
	}
	public void setDate_creation(java.sql.Date date_creation) {
		this.date_creation = date_creation;
	}
	public List<task> getTasks() {
		return tasks;
	}
	public void setTasks(List<task> tasks) {
		this.tasks = tasks;
	}
	public List<task> getTasksgrp() {
		return tasksgrp;
	}
	public void setTasksgrp(List<task> tasksgrp) {
		this.tasksgrp = tasksgrp;
	}
	public List<actiongrp> getActions() {
		return actions;
	}
	public void setActions(List<actiongrp> actions) {
		this.actions = actions;
	}
	public List<detailgroupe> getGroups() {
		return groups;
	}
	public void setGroups(List<detailgroupe> groups) {
		this.groups = groups;
	}
	public List<groupe> getGrp() {
		return grp;
	}
	public void setGrp(List<groupe> grp) {
		this.grp = grp;
	}

	private String nom;
	private String prenom;
	private String password;
	private String email;
	private String telephone;


	@OneToMany(mappedBy="id_user")
	List<task> tasks = new ArrayList<task>();
	@OneToMany(mappedBy="id_user")
	List<task> tasksgrp = new ArrayList<task>();
	private static final long serialVersionUID = 1L;
	@OneToMany(mappedBy="id_user")
	List<actiongrp> actions = new ArrayList<actiongrp>();
	@OneToMany(mappedBy="id_user")
	private List<detailgroupe> groups = new ArrayList<detailgroupe>();
	@OneToMany(mappedBy="id_user")
	private List<groupe> grp = new ArrayList<groupe>();
	
	public user() {
		super();
	}   
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}   
	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}   
	public String getPrenom() {
		return this.prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}   
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}   
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
   
}
