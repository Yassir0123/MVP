package controllers;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.persistence.*;
import tasksentities.task;
import tasksentities.category;

@WebServlet("/modifysingletask")
public class modifysingletask extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public modifysingletask() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("idtask"));
        int prioriterId = Integer.parseInt(request.getParameter("prioriter"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Date startDate = Date.valueOf(request.getParameter("datedebut"));
        Date endDate = Date.valueOf(request.getParameter("datefin"));

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            task taskToUpdate = em.find(task.class, taskId);
            category priorityCategory = em.find(category.class, prioriterId);

            taskToUpdate.setTitle(title);
            taskToUpdate.setDescription(description);
            taskToUpdate.setDate_debut(startDate);
            taskToUpdate.setDate_fin(endDate);
            taskToUpdate.setId_prioriter(priorityCategory);
            
            em.merge(taskToUpdate); // Ensures changes are saved
            em.getTransaction().commit();
            response.sendRedirect("tasks.jsp");
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            response.getWriter().append("Error processing the request: " + e.getMessage());
        } finally {
            em.close();
            emf.close();
        }
    }
}