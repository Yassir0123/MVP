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

@WebServlet("/deleteaction")
public class deleteaction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public deleteaction() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("idt"));
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
            EntityManager em = emf.createEntityManager();
            em.getTransaction().begin();
            action actionToDelete = em.find(action.class, id);

            if (actionToDelete == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Action not found.");
                return;
            }

            // Assuming the Action entity has a getId_task() method returning the task entity
            // and Task has an getId() method
            int taskId = actionToDelete.getId_task().getId();

            em.remove(actionToDelete);
            em.getTransaction().commit();
            response.sendRedirect("allactions.jsp?idtask=" + taskId);  // Include the idtask in the redirect URL
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid format for ID.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred.");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
