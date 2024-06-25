<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.persistence.*" %>
<%@ page import="tasksentities.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Groups</title>
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
    <h1>All Groups</h1>
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
    <form method="get" action="allgroups.jsp">
        <label for="group_name">Group Name:</label>
        <input type="text" id="group_name" name="group_name" value="<%= request.getParameter("group_name") %>">
        <label for="owner_name">Owner Name:</label>
        <input type="text" id="owner_name" name="owner_name" value="<%= request.getParameter("owner_name") %>">
        <button type="submit">Search</button>
    </form>

    <%
    try {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
        EntityManager em = emf.createEntityManager();
        
        String groupName = request.getParameter("group_name");
        String ownerName = request.getParameter("owner_name");

        StringBuilder queryBuilder = new StringBuilder("SELECT g FROM groupe g WHERE 1=1");
        if (groupName != null && !groupName.isEmpty()) {
            queryBuilder.append(" AND g.nom LIKE :groupName");
        }
        if (ownerName != null && !ownerName.isEmpty()) {
            queryBuilder.append(" AND g.id_user.nom LIKE :ownerName");
        }

        TypedQuery<groupe> query = em.createQuery(queryBuilder.toString(), groupe.class);
        if (groupName != null && !groupName.isEmpty()) {
            query.setParameter("groupName", "%" + groupName + "%");
        }
        if (ownerName != null && !ownerName.isEmpty()) {
            query.setParameter("ownerName", "%" + ownerName + "%");
        }

        List<groupe> groups = query.getResultList();
    %>
    <table>
    <tr>
        <th>ID</th>
        <th>Group Name</th>
        <th>Group Owner</th>
        <th>Total Tasks</th>
    </tr>
    <%
    for (groupe g : groups) {
        String ownerNameResult = g.getId_user().getNom();
        long totalTasks = g.getTasks().size();
    %>
    <tr>
        <td><%= g.getId() %></td>
        <td><%= g.getNom() %></td>
        <td><%= ownerNameResult %></td>
        <td><%= totalTasks %></td>
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
