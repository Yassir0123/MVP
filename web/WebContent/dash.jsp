<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.persistence.*" %>
<%@ page import="tasksentities.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
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
a.show-all {
    display: block;
    margin-bottom: 10px;
    text-align: right;
    color: #4CAF50;
    text-decoration: none;
}
a.show-all:hover {
    text-decoration: underline;
}
</style>
</head>
<body>
<%
HttpSession sess = request.getSession();
if (sess.getAttribute("adminaccess") == null) {
    response.sendRedirect("login.jsp");
} else {
    if (sess.getAttribute("adminaccess").equals("0")) {
        response.sendRedirect("login.jsp");
    } else {
        try {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
            EntityManager em = emf.createEntityManager();
            
            // Fetch users data
            List<user> users = em.createQuery("SELECT u FROM user u", user.class).getResultList();
            
            // Fetch groups data
            List<groupe> groups = em.createQuery("SELECT g FROM groupe g", groupe.class).getResultList();
            
            // Fetch tasks data
            List<taskgrp> tasks = em.createQuery("SELECT t FROM taskgrp t", taskgrp.class).getResultList();
%>

<header>
    <h1>Welcome <%= ((user) sess.getAttribute("admin")).getNom() %></h1>
</header>

<nav>
    <ul>
        <li><a href="dash.jsp">Home</a></li>
        <li><a href="allusers.jsp">Users</a></li>
        <li><a href="alladmintask.jsp">Tasks</a></li>
        <li><a href="allgroups.jsp">Groups</a></li>
        <li><a href="logout">Logout</a></li>
    </ul>
</nav>

<div class="container">
    <h2>Users</h2>
    <a href="allusers.jsp" class="show-all">Show All Users</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Total Tasks</th>
            <th>Total Groups</th>
        </tr>
        <%
        if (!users.isEmpty()) {
            user u = users.get(0);
            long totalTasks = u.getTasksgrp().size();
            long totalGroups = u.getGroups().size();
        %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getNom() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= totalTasks %></td>
            <td><%= totalGroups %></td>
        </tr>
        <%
        }
        %>
    </table>

    <h2>Groups</h2>
    <a href="allgroups.jsp" class="show-all">Show All Groups</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Group Name</th>
            <th>Group Owner</th>
            <th>Total Tasks</th>
        </tr>
        <%
        if (!groups.isEmpty()) {
            groupe g = groups.get(0);
            String ownerName = g.getId_user().getNom();
            long totalTasks = g.getTasks().size();
        %>
        <tr>
            <td><%= g.getId() %></td>
            <td><%= g.getNom() %></td>
            <td><%= ownerName %></td>
            <td><%= totalTasks %></td>
        </tr>
        <%
        }
        %>
    </table>

    <h2>Tasks</h2>
    <a href="alladmintask.jsp" class="show-all">Show All Tasks</a>
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
        if (!tasks.isEmpty()) {
            taskgrp t = tasks.get(0);
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
        %>
    </table>
</div>

<%
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
%>
</body>
</html>
