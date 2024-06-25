package tasksentities;

import java.io.Serializable;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: actiongrp
 *
 */
@Entity

public class actiongrp implements Serializable {

	   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	public user getId_user() {
		return id_user;
	}
	public void setId_user(user id_user) {
		this.id_user = id_user;
	}
	public taskgrp getId_taskgrp() {
		return id_taskgrp;
	}
	public void setId_taskgrp(taskgrp id_taskgrp) {
		this.id_taskgrp = id_taskgrp;
	}

	private String description;
	@ManyToOne()
	@JoinColumn(name="id_user")
	private user id_user;
	@ManyToOne()
	@JoinColumn(name="id_taskgrp")
	private taskgrp id_taskgrp;
	private static final long serialVersionUID = 1L;
	public actiongrp() {
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
