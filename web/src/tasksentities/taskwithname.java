package tasksentities;
import java.lang.String;
import java.sql.Date;
import javax.persistence.*;
import java.util.*;
public class taskwithname {
	 private Long id;
	    private String title;
	    private String description;
	    private Date dateDebut;
	    private Date dateFin;
	    private String categoryName;
		public taskwithname(Long id, String title, String description, Date dateDebut, Date dateFin,
				String categoryName) {
			super();
			this.id = id;
			this.title = title;
			this.description = description;
			this.dateDebut = dateDebut;
			this.dateFin = dateFin;
			this.categoryName = categoryName;
		}
		public taskwithname() {
			super();
		}
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public Date getDateDebut() {
			return dateDebut;
		}
		public void setDateDebut(Date dateDebut) {
			this.dateDebut = dateDebut;
		}
		public Date getDateFin() {
			return dateFin;
		}
		public void setDateFin(Date dateFin) {
			this.dateFin = dateFin;
		}
		public String getCategoryName() {
			return categoryName;
		}
		public void setCategoryName(String categoryName) {
			this.categoryName = categoryName;
		}

}
