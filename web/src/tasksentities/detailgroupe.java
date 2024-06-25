package tasksentities;

import java.io.Serializable;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: detailgroupe
 *
 */
@Entity
public class detailgroupe implements Serializable {
	@Id
	private int idtail;
	
	@ManyToOne()
	@JoinColumn(name="id_grp")
	private groupe id_grp;
	
	@ManyToOne()
	@JoinColumn(name="id_user")
	private user id_user;
	private static final long serialVersionUID = 1L;

	public detailgroupe() {
		super();
	}

	public detailgroupe(int idtail, groupe id_grp, user id_user) {
		super();
		this.idtail = idtail;
		this.id_grp = id_grp;
		this.id_user = id_user;
	}

	public int getIdtail() {
		return idtail;
	}

	public void setIdtail(int idtail) {
		this.idtail = idtail;
	}

	public groupe getId_grp() {
		return id_grp;
	}

	public void setId_grp(groupe id_grp) {
		this.id_grp = id_grp;
	}

	public user getId_user() {
		return id_user;
	}

	public void setId_user(user id_user) {
		this.id_user = id_user;
	}
	
   
}
