package controllers;

import java.io.IOException;
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

import tasksentities.task;
import tasksentities.taskgrp;

/**
 * Servlet implementation class modifygrouptask
 */
@WebServlet("/modifygrouptask")
public class modifygrouptask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifygrouptask() {
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
	        response.setContentType("text/html");
	  
	        int idgrp = Integer.parseInt(request.getParameter("idgrp"));
	        int ownerid=Integer.parseInt(request.getParameter("ownerid"));
			Long passphrase=Long.parseLong(request.getParameter("passphrase"));
	        try (java.io.PrintWriter out = response.getWriter()) {
	            String idStr = request.getParameter("idtask");
	            String prioriterStr = request.getParameter("prioriter");  // Assuming "prioriter" is the correct parameter name
	            out.println("<p>idtask: " + idStr + "</p>");
	            out.println("<p>prioriter: " + prioriterStr + "</p>");

	            int id = Integer.parseInt(idStr);
	            int prioriter = Integer.parseInt(prioriterStr);
	            String title = request.getParameter("title");
	            String description = request.getParameter("description");
	            Date db = parseDate(request.getParameter("datedebut"));
	            Date df = parseDate(request.getParameter("datefin"));

	            EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
	            EntityManager em = emf.createEntityManager();
	            em.getTransaction().begin();
	            taskgrp taskadd = em.find(taskgrp.class, id);
	            taskadd.setTitle(title);
	            taskadd.setDescription(description);
	            taskadd.setDate_debut(db);
	            taskadd.setDate_fin(df);
	            taskadd.getId_prioritergrp().setId(prioriter);
	            em.getTransaction().commit();

	            String redirectUrl = String.format("showgrouptasks.jsp?ownerid=%d&idgrp=%d&passphrase=%d", ownerid, idgrp, passphrase);
	            response.sendRedirect(redirectUrl);
	        } catch (Exception e) {
	            e.printStackTrace(response.getWriter());
	        }
	    }

	    private Date parseDate(String dateString) {
	        LocalDate localDate = LocalDate.parse(dateString);
	        return Date.valueOf(localDate);
	    }

}
