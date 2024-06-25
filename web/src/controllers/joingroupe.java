package controllers;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import tasksentities.detailgroupe;
import tasksentities.groupe;
import tasksentities.user;
/**
 * Servlet implementation class joingroupe
 */
@WebServlet("/joingroupe")
public class joingroupe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joingroupe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			long passphrase = Long.parseLong(request.getParameter("passphrase"));
			int id = Integer.parseInt(request.getParameter("id"));
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
			EntityManager em = emf.createEntityManager();
			user usr = em.find(user.class, id);
			em.getTransaction().begin();
			groupe grp = (groupe) em.createQuery("select g from groupe g where g.passphrase=:passphrase").setParameter("passphrase", passphrase).getSingleResult();
			em.getTransaction().commit();
			em.getTransaction().begin();
	            detailgroupe dgr = new detailgroupe();
	            dgr.setId_grp(grp);
	            dgr.setId_user(usr);
	            em.persist(dgr);
	            em.getTransaction().commit();

			response.sendRedirect("groups.jsp");
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
