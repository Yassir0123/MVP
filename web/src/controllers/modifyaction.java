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
import tasksentities.task;

/**
 * Servlet implementation class modifyaction
 */
@WebServlet("/modifyaction")
public class modifyaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifyaction() {
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
			int id = Integer.parseInt(request.getParameter("id"));
			String desc = request.getParameter("description");
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
			EntityManager em = emf.createEntityManager();
			em.getTransaction().begin();
			action actionadd = em.find(action.class, id);
			actionadd.setDescription(desc);
			//em.remove(actionadd);
			em.getTransaction().commit();
			response.sendRedirect("tasks.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
