package controllers;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tasksentities.action;
import tasksentities.actiongrp;

/**
 * Servlet implementation class modifyactiongroupe
 */
@WebServlet("/modifyactiongroupe")
public class modifyactiongroupe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifyactiongroupe() {
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
	            // Retrieve parameters from the form
	            int id = Integer.parseInt(request.getParameter("id"));
	            int taskid = Integer.parseInt(request.getParameter("taskid"));
	            int ownerid = Integer.parseInt(request.getParameter("ownerid"));
	            String desc = request.getParameter("description");

	            em.getTransaction().begin();

	            // Find the existing actiongrp entity
	            actiongrp actionadd = em.find(actiongrp.class, id);
	            actionadd.setDescription(desc);

	            // Commit the transaction
	            em.getTransaction().commit();

	            // Redirect to the appropriate page
	            String redirectUrl = String.format("allactionsgrp.jsp?ownerid=%d&idtask=%d", ownerid, taskid);
	            response.sendRedirect(redirectUrl);

	        } catch (Exception e) {
	            e.printStackTrace();

	            // Handle exception and roll back transaction if needed
	            if (em.getTransaction().isActive()) {
	                em.getTransaction().rollback();
	            }

	            // Send error response
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error while modifying action group");
	        } finally {
	            em.close();
	        }
	    }
}
