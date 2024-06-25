package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tasksentities.action;
import tasksentities.task;

import javax.persistence.*;

/**
 * Servlet implementation class addaction
 */
@WebServlet("/addaction")
public class addaction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public addaction() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("id"));
        String description = request.getParameter("description");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            task associatedTask = em.find(task.class, taskId);
            if (associatedTask == null) {
                throw new ServletException("Task with ID " + taskId + " not found.");
            }

            action newAction = new action();
            newAction.setDescription(description);
            newAction.setId_task(associatedTask);  // Correctly setting the associated task

            em.persist(newAction);
            em.getTransaction().commit();

            response.sendRedirect("tasks.jsp");  // Redirect or handle the response as needed
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
