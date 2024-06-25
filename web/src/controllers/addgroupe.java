package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tasksentities.detailgroupe;
import tasksentities.groupe;
import tasksentities.task;
import tasksentities.user;

/**
 * Servlet implementation class addgroupe
 */
@WebServlet("/addgroupe")
public class addgroupe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addgroupe() {
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
	    EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
	    EntityManager em = emf.createEntityManager();
	    
	    try {
	        PrintWriter out = response.getWriter();
	        Random random = new Random();
	        long tenDigitNumber = 1000000000L + (long) (random.nextDouble() * 9000000000L);
	        long passphrase = tenDigitNumber;
	        String nom = request.getParameter("nom");
	        int id = Integer.parseInt(request.getParameter("id"));

	        // Start transaction to add new group
	        em.getTransaction().begin();
	        user associatedUser = em.find(user.class, id);
	        groupe newGroup = new groupe();
	        newGroup.setNom(nom);
	        newGroup.setPassphrase(passphrase);
	        newGroup.setId_user(associatedUser);
	        em.persist(newGroup);
	        em.getTransaction().commit();

	        // Fetch the newly added group's ID
	        em.getTransaction().begin();
	        int groupId = (int) em.createQuery("SELECT MAX(g.id) FROM groupe g").getSingleResult();
	        em.getTransaction().commit();

	        // Start transaction to add detailgroupe
	        em.getTransaction().begin();
	        groupe groupRef = em.find(groupe.class, groupId);
	        detailgroupe newDetailGroup = new detailgroupe();
	        newDetailGroup.setId_grp(groupRef);
	        newDetailGroup.setId_user(associatedUser);
	        em.persist(newDetailGroup);
	        em.getTransaction().commit();

	        // Redirect once after all operations are complete
	        response.sendRedirect("groups.jsp");

	    } catch (Exception e) {
	        e.printStackTrace();
	        // Handle exceptions and possibly rollback transactions here
	        if (em.getTransaction().isActive()) {
	            em.getTransaction().rollback();
	        }
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to create group and detail group");
	    } finally {
	        em.close();
	    }
	}

}
