package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import tasksentities.task;
import tasksentities.user;
import tasksentities.category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addsingletask
 */
@WebServlet("/addsingletask")
public class addsingletask extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public addsingletask() {
        super();
    }

    /**
     * Handles the HTTP POST request.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve all parameters from the form
        int userId = Integer.parseInt(request.getParameter("id"));
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

            // Create new task and set its properties
            task newTask = new task();
            newTask.setTitle(title);
            newTask.setDescription(description);
            newTask.setDate_debut(startDate);
            newTask.setDate_fin(endDate);
            newTask.setStatus(0); // Assuming '0' is the default status for new tasks
            newTask.setId_user(associatedUser);
            newTask.setId_prioriter(associatedCategory);

            // Persist the new task
            em.persist(newTask);
            em.getTransaction().commit();

            response.sendRedirect("tasks.jsp");
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
