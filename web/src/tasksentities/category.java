package tasksentities;

import java.io.Serializable;
import java.lang.String;
import javax.persistence.*;
import java.util.*;
/**
 * Entity implementation class for Entity: category
 *
 */
@Entity

public class category implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private static final long serialVersionUID = 1L;
    @OneToMany(mappedBy="id_prioriter")
    private List<task> tasks = new ArrayList<task>();
    @OneToMany(mappedBy="id_prioriter")
    private List<task> tasksgrp = new ArrayList<task>();
	public category() {
		super();
	}   
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}   
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
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
   
}
