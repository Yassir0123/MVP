<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.persistence.*" %>
<%@ page import="tasksentities.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Users</title>
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
    <h1>All Users</h1>
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
    <form method="get" action="allusers.jsp">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= request.getParameter("name") %>">
        <label for="date_creation">Date Creation:</label>
        <input type="date" id="date_creation" name="date_creation" value="<%= request.getParameter("date_creation") %>">
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="<%= request.getParameter("email") %>">
        <button type="submit">Search</button>
    </form>

    <%
    try {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
        EntityManager em = emf.createEntityManager();
        
        String name = request.getParameter("name");
        String dateCreation = request.getParameter("date_creation");
        String email = request.getParameter("email");

        List<user> users = new ArrayList<>();
        
        if (name != null && !name.isEmpty()) {
            users = em.createQuery("SELECT u FROM user u WHERE u.nom LIKE :name", user.class)
                      .setParameter("name", "%" + name + "%")
                      .getResultList();
        } else if (dateCreation != null && !dateCreation.isEmpty()) {
            users = em.createQuery("SELECT u FROM user u WHERE u.date_creation = :dateCreation", user.class)
                      .setParameter("dateCreation", java.sql.Date.valueOf(dateCreation))
                      .getResultList();
        } else if (email != null && !email.isEmpty()) {
            users = em.createQuery("SELECT u FROM user u WHERE u.email LIKE :email", user.class)
                      .setParameter("email", "%" + email + "%")
                      .getResultList();
        } else {
            users = em.createQuery("SELECT u FROM user u", user.class).getResultList();
        }
    %>
    <table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Date Creation</th>
        <th>Total Tasks</th>
        <th>Total Groups</th>
    </tr>
    <%
    for (user u : users) {
        long totalTasks = u.getTasksgrp().size();
        long totalGroups = u.getGroups().size();
    %>
    <tr>
        <td><%= u.getId() %></td>
        <td><%= u.getNom() %></td>
        <td><%= u.getEmail() %></td>
        <td><%= u.getDate_creation() %></td>
        <td><%= totalTasks %></td>
        <td><%= totalGroups %></td>
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
