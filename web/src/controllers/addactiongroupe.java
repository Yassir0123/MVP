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
import tasksentities.task;
import tasksentities.taskgrp;
import tasksentities.user;

/**
 * Servlet implementation class addactiongroupe
 */
@WebServlet("/addactiongroupe")
public class addactiongroupe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addactiongroupe() {
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
        int taskId = Integer.parseInt(request.getParameter("id"));
        int userid=Integer.parseInt(request.getParameter("iduser"));
        int ownerid=Integer.parseInt(request.getParameter("ownerid"));
        Long passphrase=Long.parseLong(request.getParameter("passphrase"));
        int grpid=Integer.parseInt(request.getParameter("idgrp"));
        String description = request.getParameter("description");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            user users = em.find(user.class, userid);
            taskgrp associatedTask = em.find(taskgrp.class, taskId);
            if (associatedTask == null) {
                throw new ServletException("Task with ID " + taskId + " not found.");
            }

            actiongrp newAction = new actiongrp();
            newAction.setDescription(description);
            newAction.setId_taskgrp(associatedTask);  // Correctly setting the associated task
            newAction.setId_user(users);
            em.persist(newAction);
            em.getTransaction().commit();
            String redirectUrl = String.format("showgrouptasks.jsp?ownerid=%d&idgrp=%d&passphrase=%d", ownerid, grpid, passphrase);
            response.sendRedirect(redirectUrl);
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing the action: " + e.getMessage());
        } finally {
            em.close();
            emf.close();
        }
    }

}
