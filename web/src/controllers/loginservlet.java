package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.persistence.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tasksentities.user;

import java.util.*;
/**
 * Servlet implementation class loginservlet
 */
@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginservlet() {
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
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
			EntityManager em = emf.createEntityManager();
			em.getTransaction().begin();
			List<user> users = em.createQuery("select u from user u where email = :email and password = :password").setParameter("email", email).setParameter("password", password).getResultList();
			if(users.isEmpty()) {
				sess.setAttribute("access", "0");
				response.sendRedirect("login.jsp");
			}
			else {
				sess.setAttribute("access", "1");
				id = users.get(0).getId();
				sess.setAttribute("userid", id);
				sess.setAttribute("admin", users.get(0));
		
				if (users.get(0).getEmail().endsWith("@admin.com")) {
					sess.setAttribute("adminaccess", "1");
                    response.sendRedirect("dash.jsp");
                } else {
                    response.sendRedirect("tasks.jsp");
                }
				
			}
			em.getTransaction().commit();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
