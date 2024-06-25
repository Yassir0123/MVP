package tasksentities;

import java.io.Serializable;
import java.lang.String;
import javax.persistence.*;
import java.util.*;
/**
 * Entity implementation class for Entity: groupe
 *
 */
@Entity

public class groupe implements Serializable {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	public List<taskgrp> getTasks() {
		return tasks;
	}
	public void setTasks(List<taskgrp> tasks) {
		this.tasks = tasks;
	}
	public List<detailgroupe> getGroups() {
		return groups;
	}
	public void setGroups(List<detailgroupe> groups) {
		this.groups = groups;
	}
	public user getId_user() {
		return id_user;
	}
	public void setId_user(user id_user) {
		this.id_user = id_user;
	}

	private String nom;
	private long passphrase;
	@OneToMany(mappedBy="id_grp")
	private List<taskgrp> tasks = new ArrayList<taskgrp>();
	@OneToMany(mappedBy="id_grp")
	private List<detailgroupe> groups = new ArrayList<detailgroupe>();
	@ManyToOne()
	@JoinColumn(name="id_user")
	private user id_user;
	private static final long serialVersionUID = 1L;
	public groupe() {
		super();
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
	public long getPassphrase() {
		return this.passphrase;
	}

	public void setPassphrase(long passphrase) {
		this.passphrase = passphrase;
	}
   
}
