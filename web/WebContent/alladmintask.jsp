<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.persistence.*" %>
<%@ page import="tasksentities.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Tasks</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 0;
}
header {
    background-color: #4CAF50;
    padding: 10px 0;
    color: white;
    text-align: center;
}
nav {
    margin: 20px;
    text-align: center;
}
nav ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}
nav ul li {
    display: inline;
    margin-right: 20px;
}
nav ul li a {
    text-decoration: none;
    color: #333;
    padding: 8px 16px;
    border-radius: 4px;
}
nav ul li a:hover {
    background-color: #ddd;
    color: #333;
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}
th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}
th {
    background-color: #4CAF50;
    color: white;
}
.container {
    padding: 20px;
}
h1, h2 {
    color: #333;
}
form {
    margin-bottom: 20px;
}
form label {
    margin-right: 10px;
}
form input {
    margin-right: 20px;
}
form button {
    padding: 8px 16px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
form button:hover {
    background-color: #45a049;
}
</style>
</head>
<body>
<header>
    <h1>All Tasks</h1>
</header>

<nav>
    <ul>
        <li><a href="dash.jsp">Home</a></li>
        <li><a href="allusers.jsp">Users</a></li>
        <li><a href="alladmintask.jsp">Tasks</a></li>
        <li><a href="allgroups.jsp">Groups</a></li>
        <li><a href="login.jsp">Logout</a></li>
    </ul>
</nav>

<div class="container">
    <form method="get" action="alladmintask.jsp">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="<%= request.getParameter("title") %>">
        <label for="date_debut">Start Date:</label>
        <input type="date" id="date_debut" name="date_debut" value="<%= request.getParameter("date_debut") %>">
        <label for="date_fin">End Date:</label>
        <input type="date" id="date_fin" name="date_fin" value="<%= request.getParameter("date_fin") %>">
        <label for="creator">Creator Name:</label>
        <input type="text" id="creator" name="creator" value="<%= request.getParameter("creator") %>">
        <button type="submit">Search</button>
    </form>

    <%
    try {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
        EntityManager em = emf.createEntityManager();
        
        String title = request.getParameter("title");
        String dateDebut = request.getParameter("date_debut");
        String dateFin = request.getParameter("date_fin");
        String creator = request.getParameter("creator");

        StringBuilder queryBuilder = new StringBuilder("SELECT t FROM taskgrp t WHERE 1=1");
        if (title != null && !title.isEmpty()) {
            queryBuilder.append(" AND t.title LIKE :title");
        }
        if (dateDebut != null && !dateDebut.isEmpty()) {
            queryBuilder.append(" AND t.date_debut >= :dateDebut");
        }
        if (dateFin != null && !dateFin.isEmpty()) {
            queryBuilder.append(" AND t.date_fin <= :dateFin");
        }
        if (creator != null && !creator.isEmpty()) {
            queryBuilder.append(" AND t.id_user.nom LIKE :creator");
        }

        TypedQuery<taskgrp> query = em.createQuery(queryBuilder.toString(), taskgrp.class);
        if (title != null && !title.isEmpty()) {
            query.setParameter("title", "%" + title + "%");
        }
        if (dateDebut != null && !dateDebut.isEmpty()) {
            query.setParameter("dateDebut", java.sql.Date.valueOf(dateDebut));
        }
        if (dateFin != null && !dateFin.isEmpty()) {
            query.setParameter("dateFin", java.sql.Date.valueOf(dateFin));
        }
        if (creator != null && !creator.isEmpty()) {
            query.setParameter("creator", "%" + creator + "%");
        }

        List<taskgrp> tasks = query.getResultList();
    %>
    <table>
    <tr>
        <th>ID</th>
        <th>Creator</th>
        <th>Title</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Category</th>
    </tr>
    <%
    for (taskgrp t : tasks) {
        String creatorName = t.getId_user().getNom();
        String categoryName = t.getId_prioritergrp().getName();
    %>
    <tr>
        <td><%= t.getId() %></td>
        <td><%= creatorName %></td>
        <td><%= t.getTitle() %></td>
        <td><%= t.getDate_debut() %></td>
        <td><%= t.getDate_fin() %></td>
        <td><%= categoryName %></td>
    </tr>
    <%
    }
    em.close();
    emf.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
    </table>
</div>
</body>
</html>
