package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tasksentities.category;
import tasksentities.groupe;
import tasksentities.task;
import tasksentities.taskgrp;
import tasksentities.user;

/**
 * Servlet implementation class addgrouptask
 */
@WebServlet("/addgrouptask")
public class addgrouptask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addgrouptask() {
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
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve all parameters from the form
        int userId = Integer.parseInt(request.getParameter("id"));
        int idgrp = Integer.parseInt(request.getParameter("idgrp"));
        int ownerid=Integer.parseInt(request.getParameter("ownerid"));
		Long passphrase=Long.parseLong(request.getParameter("passphrase"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        int prioriterId = Integer.parseInt(request.getParameter("prioriter"));
        Date startDate = parseDate(request.getParameter("datedebut"));
        Date endDate = parseDate(request.getParameter("datefin"));
        PrintWriter out = response.getWriter();
         out.print(userId+" "+title+" "+description+" "+startDate+" "+endDate);
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();

            // Find associated user and category entities
            user associatedUser = em.find(user.class, userId);
            category associatedCategory = em.find(category.class, prioriterId);
            groupe grp = em.find(groupe.class, idgrp);
            // Create new task and set its properties
            taskgrp newTask = new taskgrp();
            newTask.setTitle(title);
            newTask.setDescription(description);
            newTask.setDate_debut(startDate);
            newTask.setDate_fin(endDate);
            newTask.setStatus(0); // Assuming '0' is the default status for new tasks
            newTask.setId_user(associatedUser);
            newTask.setId_prioritergrp(associatedCategory);
            newTask.setId_grp(grp);


            // Persist the new task
            em.persist(newTask);
            em.getTransaction().commit();

            String redirectUrl = String.format("showgrouptasks.jsp?ownerid=%d&idgrp=%d&passphrase=%d", ownerid, idgrp, passphrase);
            response.sendRedirect(redirectUrl);
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw new ServletException("Error while adding new task", e);
        } finally {
            em.close();
            emf.close();
        }
    }

    /**
     * Parses a date string in the format "yyyy-mm-dd" to java.sql.Date.
     */
    private Date parseDate(String dateString) {
        LocalDate localDate = LocalDate.parse(dateString);
        return Date.valueOf(localDate);
    }

}
