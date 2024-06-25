package controllers;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tasksentities.user;

/**
 * Servlet implementation class registerservlet
 */
@WebServlet("/registerservlet")
public class registerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerservlet() {
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
	        HttpSession sess = request.getSession();
	        int id;
	        String nom = request.getParameter("nom");
	        String telephone = request.getParameter("telephone");
	        String prenom = request.getParameter("prenom");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        
	        // Get the current date
	        Date currentDate = new Date(System.currentTimeMillis());
	        
	        EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
	        EntityManager em = emf.createEntityManager();
	        em.getTransaction().begin();
	        
	        // Create new user object and set its properties
	        user newone = new user();
	        newone.setNom(nom);
	        newone.setPrenom(prenom);
	        newone.setEmail(email);
	        newone.setPassword(password);
	        newone.setTelephone(telephone);
	        newone.setDate_creation(currentDate);  // Set the date_creation to the current date
	        
	        em.persist(newone);
	        em.getTransaction().commit();
	        
	        em.getTransaction().begin();
	        id = (int) em.createQuery("select MAX(u.id) from user u").getSingleResult();
	        sess.setAttribute("access", "1");
	        sess.setAttribute("userid", id);
	        response.sendRedirect("tasks.jsp");
	        em.getTransaction().commit();
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	}
}
