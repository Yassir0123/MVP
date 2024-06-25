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
 * Servlet implementation class deleteactiongroupe
 */
@WebServlet("/deleteactiongroupe")
public class deleteactiongroupe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteactiongroupe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("idt"));
        	int ownerid=Integer.parseInt(request.getParameter("ownerid"));
        	int taskid=Integer.parseInt(request.getParameter("taskid"));
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
            EntityManager em = emf.createEntityManager();
            em.getTransaction().begin();
            actiongrp actionToDelete = em.find(actiongrp.class, id);

            if (actionToDelete == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Action not found.");
                return;
            }

            // Assuming the Action entity has a getId_task() method returning the task entity
            // and Task has an getId() method
            int taskId = actionToDelete.getId_taskgrp().getId();

            em.remove(actionToDelete);
            em.getTransaction().commit();
            response.sendRedirect("allactionsgrp.jsp?idtask=" + taskId+"&ownerid="+ownerid);  // Include the idtask in the redirect URL
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid format for ID.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred.");
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
