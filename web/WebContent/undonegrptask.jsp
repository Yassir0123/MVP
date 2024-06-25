<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.persistence.*" %>
<%@ page import="tasksentities.task" %>
<%@ page import="tasksentities.taskgrp" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.0/mdb.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <title>Group Tasks</title>
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
        .S {
            color: azure;
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
        .sidebar {
            height: 100vh;
            width: 200px;
            background-color: #343a40;
            padding-top: 20px;
        }
        .sidebar a {
            display: block;
            padding: 10px 15px;
            color: #fff;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #495057;
            color: #fff;
        }
        .content {
            flex-grow: 1;
            padding: 20px;
        }
        .newTask {
            position: fixed;
            z-index: 999;
            top: 90%;
            right: 1%;
            cursor: pointer;
        }
        .newTask:hover {
            width: 70px;
            height: 70px;
        }
        .addTask, .editTask {
            position: fixed;
            z-index: 999;
            top: 2%;
            right: 30%;
            cursor: pointer;
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

    <%
    HttpSession sess = request.getSession();
    if (sess.getAttribute("access") == null) {
        response.sendRedirect("login.jsp");
    } else {
        if (sess.getAttribute("access").equals("0")) {
            response.sendRedirect("login.jsp");
        } else {
            try {
                int id = (int) sess.getAttribute("userid");
                int ownerid = Integer.parseInt(request.getParameter("ownerid"));
                Long passphrase = Long.parseLong(request.getParameter("passphrase"));
                int grpid = Integer.parseInt(request.getParameter("idgrp"));
                EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
                EntityManager em = emf.createEntityManager();

                em.getTransaction().begin();
                List<taskgrp> currenttasks = em.createQuery("select t from taskgrp t where t.date_debut < t.date_fin and t.status = 0 and t.id_grp.id = :id")
                                                .setParameter("id", grpid).getResultList();
                long counttasks = (long) em.createQuery("select Count(t.id) from taskgrp t where t.date_debut > t.date_fin and t.status = 0 and t.id_grp.id = :id")
                                            .setParameter("id", grpid).getSingleResult();
                List<taskgrp> uncompletedtasks = em.createQuery("select t from taskgrp t where t.date_debut > t.date_fin and t.status = 0 and t.id_grp.id = :id")
                                                   .setParameter("id", grpid).getResultList();
                List<taskgrp> completedtasks = em.createQuery("select t from taskgrp t where t.status = 1 and t.id_grp.id = :id")
                                                 .setParameter("id", grpid).getResultList();
                em.getTransaction().commit();
    %>

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
                            <h2 class="my-4">Group Tasks</h2>
                        </div>
                        <div class="mb-4">
                            <a href="alltasksgrp.jsp?ownerid=<%=ownerid%>&idgrp=<%=grpid%>&passphrase=<%=passphrase%>" class="btn btn-primary">See completed tasks</a>
                            <%
                            if (id == ownerid) {
                            %>
                            <a href="addtaskgrp.jsp?ownerid=<%=ownerid%>&idgrp=<%=grpid%>&passphrase=<%=passphrase%>" class="btn btn-success">Add Task</a>
                            <%
                            }
                            %>
                        </div>
                       
                        <table class="table text-white mb-0" style="background-color: aliceblue">
                            <thead>
                                <tr style="color: rgb(43, 42, 42);">
                                    <th scope="col">Id</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Date Start</th>
                                    <th scope="col">Date End</th>
                                    <th scope="col">Priority</th>
                                    <th scope="col">Actions</th>
                                    <%
                                    if (id == ownerid) {
                                    %>
                                    <th scope="col">Action</th>
                                    <%
                                    }
                                    %>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                for (taskgrp tasker : uncompletedtasks) {
                                %>
                                <tr class="fw-normal" style="color: rgb(43, 42, 42);">
                                    <td><%= tasker.getId() %></td>
                                    <td><%= tasker.getTitle() %></td>
                                    <td><%= tasker.getDescription() %></td>
                                    <td><%= tasker.getDate_debut() %></td>
                                    <td><%= tasker.getDate_fin() %></td>
                                    <td><%= tasker.getId_prioritergrp().getName() %></td>
                                    <td>
                                        <a href="addactiongrp.jsp?idtask=<%= tasker.getId() %>&ownerid=<%= ownerid %>&idgrp=<%= grpid %>&passphrase=<%= passphrase %>" class="btn btn-info btn-sm" title="Add Action"><i class="fas fa-plus"></i></a>
                                        <a href="allactionsgrp.jsp?idtask=<%= tasker.getId() %>&ownerid=<%= ownerid %>&idgrp=<%= grpid %>&passphrase=<%= passphrase %>" class="btn btn-info btn-sm" title="See All Actions"><i class="fas fa-eye"></i></a>
                                    </td>
                                    <%
                                    if (id == ownerid) {
                                    %>
                                    <td>
                                        <a href="modifytaskgrp.jsp?idtask=<%= tasker.getId() %>&title=<%= tasker.getTitle() %>&description=<%= tasker.getDescription() %>&datedebut=<%= tasker.getDate_debut() %>&datefin=<%= tasker.getDate_fin() %>&ownerid=<%= ownerid %>&idgrp=<%= grpid %>&passphrase=<%= passphrase %>" class="btn btn-primary btn-sm" title="Modify"><i class="fas fa-pencil-alt"></i></a>
                                        <a href="deletegrouptask?idtask=<%= tasker.getId() %>&ownerid=<%= ownerid %>&idgrp=<%= grpid %>&passphrase=<%= passphrase %>" class="btn btn-danger btn-sm" title="Delete"><i class="fas fa-trash-alt"></i></a>
                                        <a href="validertachegrp?idtask=<%= tasker.getId() %>&ownerid=<%= ownerid %>&idgrp=<%= grpid %>&passphrase=<%= passphrase %>" class="btn btn-success btn-sm" title="Validate"><i class="fas fa-check"></i></a>
                                    </td>
                                    <%
                                    }
                                    %>
                                </tr>
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
    %>

    <!-- jQuery, Popper.js, and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
