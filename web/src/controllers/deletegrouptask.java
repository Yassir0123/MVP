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

import tasksentities.task;
import tasksentities.taskgrp;

/**
 * Servlet implementation class deletegrouptask
 */
@WebServlet("/deletegrouptask")
public class deletegrouptask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletegrouptask() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			 int idgrp = Integer.parseInt(request.getParameter("idgrp"));
		        int ownerid=Integer.parseInt(request.getParameter("ownerid"));
				Long passphrase=Long.parseLong(request.getParameter("passphrase"));
			int id = Integer.parseInt(request.getParameter("idtask"));
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
			EntityManager em = emf.createEntityManager();
			em.getTransaction().begin();
			taskgrp taskadd = em.find(taskgrp.class, id);
			em.remove(taskadd);
			em.getTransaction().commit();
			String redirectUrl = String.format("showgrouptasks.jsp?ownerid=%d&idgrp=%d&passphrase=%d", ownerid, idgrp, passphrase);
            response.sendRedirect(redirectUrl);
		}
		catch(Exception e) {
			e.printStackTrace();
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
