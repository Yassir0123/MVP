<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.persistence.*" %>
<%@ page import="tasksentities.task" %>
<%@ page import="tasksentities.category" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.0/mdb.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<style>
    a {
        text-decoration: none;
        font-size: medium;
        color: aliceblue;
    }
    a:hover {
        text-decoration: none;
        font-size: 14px;
        color: antiquewhite;
    }
    .gradient-custom-2 {
        background: linear-gradient(to right, rgba(126, 64, 246, 1), rgba(80, 139, 252, 1));
    }
    .mask-custom {
        background: rgba(24, 24, 16, 0.2);
        border-radius: 2em;
        backdrop-filter: blur(25px);
        border: 2px solid rgba(255, 255, 255, 0.05);
        background-clip: padding-box;
        box-shadow: 10px 10px 10px rgba(46, 54, 68, 0.03);
    }
    .content {
        flex-grow: 1;
        padding: 20px;
    }
    .tsk:hover {
        font-size: 16px;
        color: #140338a8;
        text-decoration: none;
    }
    .tsk {
        font-size: 14px;
        color: #0e0e0e;
        text-decoration: none;
    }
</style>
</head>
<body class="gradient-custom-2">
    <!-- NAV -->
    <div style="background-color: aliceblue;color: #495057;">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <ul class="navbar-nav">
                <li class="nav-item" style="font-weight: bold; color: #343a40;">
                    <div class="d-flex align-items-center">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" width="40" height="auto" class="mr-2">
                        <a class="nav-link" style="color: #343a40;" href="#">Welcome</a>
                        <div style="position: absolute; right:50%;">
                            <a href="" class="w3-bar-item w3-button w3-wide" style="text-decoration: none;">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-todo-list/check1.webp" alt="TASKERR" width="30">
                                <b style="color: #1a1a1a;font-size: 16px;" class="ml-2 mb-2">TASKERR</b></a>
                        </div>
                        <div style="position: absolute;right: 15%;">
                            <a href="home.jsp" class="tsk"><i class="fa fa-home "></i> Home</a>
                            <a href="tasks.jsp" class="tsk"><i class="fa fa-tasks ml-4 "></i> Tasks</a>
                            <a href="groups.jsp" class="tsk"><i class="fa fa-users ml-4 "></i> Groups</a>
                        </div>
                        <div class="nav-item dropdown ml-auto" style="z-index: 99;position: absolute;cursor: pointer;right: 2%;">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                <img width="30" height="30" src="https://img.icons8.com/ios-filled/50/settings.png" alt="settings"/>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="#"><i class="fa fa-user mr-4 "></i>User Settings</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="login.jsp"><i class="fa fa-sign-out-alt mr-4 "></i>Log Out</a>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </nav>
    </div>

    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-12 col-xl-10">
                <div class="card mask-custom">
                    <div class="card-body p-4 text-white">
                        <div class="text-center pt-3 pb-2">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-todo-list/check1.webp" alt="Check" width="60">
                            <h2 class="my-4">Ajouter une tâche</h2>
                        </div>
                        <%
                        List<category> cat = null;
                        try {
                            HttpSession sess = request.getSession();
                            int idgrp = Integer.parseInt(request.getParameter("idgrp"));
                            int id = (int) sess.getAttribute("userid");
                            int ownerid = Integer.parseInt(request.getParameter("ownerid"));
                            Long passphrase = Long.parseLong(request.getParameter("passphrase"));
                            EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
                            EntityManager em = emf.createEntityManager();
                            em.getTransaction().begin();
                            cat = em.createQuery("select c from category c").getResultList();
                            em.getTransaction().commit();
                        %>
                        <form method="post" action="addgrouptask">
                            <input type="hidden" name="id" value="<%=id%>"/>
                            <input type="hidden" name="idgrp" value="<%=idgrp%>"/>
                            <input type="hidden" name="passphrase" value="<%=passphrase%>"/>
                            <input type="hidden" name="ownerid" value="<%=ownerid%>"/>
                            <div class="form-group">
                                <label for="title">Title</label>
                                <input type="text" class="form-control" id="title" name="title" required>
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <input type="text" class="form-control" id="description" name="description" required>
                            </div>
                            <div class="form-group">
                                <label for="datedebut">Date Début</label>
                                <input type="date" class="form-control" id="datedebut" name="datedebut" required>
                            </div>
                            <div class="form-group">
                                <label for="datefin">Date Fin</label>
                                <input type="date" class="form-control" id="datefin" name="datefin" required>
                            </div>
                            <div class="form-group">
                                <label for="prioriter">Prioriter</label>
                                <select class="form-control" id="prioriter" name="prioriter" required>
                                    <%
                                    for (category c : cat) {
                                    %>
                                    <option value="<%=c.getId()%>"><%=c.getName() %></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-success">Add Task</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
                        <%
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery, Popper.js, and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
