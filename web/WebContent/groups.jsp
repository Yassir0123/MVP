<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.persistence.*" %>
<%@ page import="tasksentities.groupe" %>
<%@ page import="tasksentities.detailgroupe" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Group Management</title>
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
                                    if(sess.getAttribute("access") == null){
                                        response.sendRedirect("login.jsp");
                                    } else {
                                        if(sess.getAttribute("access").equals("0")){
                                            response.sendRedirect("login.jsp");
                                        } else {
                                            try {
                                                List<groupe> groups = null;
                                                int id = (int) sess.getAttribute("userid");
                                                EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskproject");
                                                EntityManager em = emf.createEntityManager();
                                                em.getTransaction().begin();
                                                List<Integer> idgroups = em.createQuery("select g.id_grp.id from detailgroupe g where g.id_user.id=:id").setParameter("id", id).getResultList();
                                                if (!idgroups.isEmpty()) {
                                                    groups = em.createQuery("SELECT g FROM groupe g WHERE g.id IN :ids").setParameter("ids", idgroups).getResultList();
                                                }
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

    <!-- form d'ajout de nouveau groupe -->
    <div class="addTask" style="display: none;background-color: aliceblue;width: 40%;">
        <a onclick="hideAdd();" style="margin-left: 97%;margin-top: 100%;">
            <label style="cursor: pointer;"><b>X</b></label>
        </a>
        <div class="container mt-5">
            <br>
            <form method="post" action="addgroupe">
                <div class="logo form-group" style="margin-left: 37%;">
                    <br>
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-todo-list/check1.webp" alt="Check" width="80">
                    <br>
                    <label style="font-weight: bold;font-size: 18px;margin-left: 2%;">
                        TASKERR
                    </label>
                </div>
                <div class="form-group">
                    <label for="groupTitle">Group Title</label>
                    <input type="text" class="form-control" id="groupTitle" name="nom" placeholder="Group title" required />
                </div>
                <button type="submit" class="btn btn-success">Submit</button>
                <button type="reset" class="btn btn-danger">Reset</button>
            </form>
        </div>
        <br>
    </div>

    <!-- button to add new group-->
    <div class="newTask">
        <button style="border: none;background-color: transparent;" onclick="showAdd();">
            <img width="66" height="66" src="https://img.icons8.com/external-bearicons-flat-bearicons/64/external-New-Task-reminder-and-to-do-bearicons-flat-bearicons.png" />
        </button>
    </div>

    <script>
        function showAdd() {
            var showTask = document.querySelector(".addTask");
            if (showTask.style.display != "block")
                showTask.style.display = "block";
            else
                showTask.style.display = "none";
        }
        function hideAdd() {
            var hideTask = document.querySelector(".addTask");
            hideTask.style.display = "none";
        }
    </script>

    <section class="vh-100 gradient-custom-2">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-12 col-xl-10">
                    <div class="card mask-custom">
                        <div class="card-body p-4 text-white">
                            <div class="text-center pt-3 pb-2">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-todo-list/check1.webp" alt="Check" width="60">
                                <h2 class="my-4">Groups</h2>
                            </div>
                            <div class="container">
                                <form method="post" action="joingroupe">
                                    <div class="row mb-2">
                                        <div class="col-sm-3 mb-2">
                                            <h6 class="mb-0 S"><span class="badge bg-secondary">Join Group</span></h6>
                                        </div>
                                        <div class="col-md-6 mb-2">
                                            <input type="text" class="form-control" name="passphrase" placeholder="Group Shared Key" required>
                                            <input type="hidden" name="id" value="<%=id%>"/>
                                        </div>
                                        <div class="col-sm-3 mb-2">
                                            <input type="submit" class="btn btn-success" value="Join">
                                        </div>
                                    </div>
                                </form>
                                <div class="row col-sm-3 mb-2">
                                    <a onclick="showAdd();">
                                        <h6 class="mb-0 H"><span class="badge bg-success" style="cursor: pointer;">Create Group</span></h6>
                                    </a>
                                </div>
                            </div>
                            <div class="container">
                                <div class="row">
                               
                                         <%
                                                for(groupe grp : groups){
                                    %>
                                    <div class="col-md-4 mb-4">
                                        <div class="card" style="width: 17rem;color: rgb(22, 22, 22);">
                                            <div class="card-body">
                                                <h5 class="card-title"><%= grp.getNom() %></h5>
                                                <p class="card-text">Group Passphrase: <%= grp.getPassphrase() %></p>
                                                <a href="showgrouptasks.jsp?idgrp=<%= grp.getId() %>&passphrase=<%= grp.getPassphrase() %>&ownerid=<%= grp.getId_user().getId() %>" class="btn btn-primary">View Tasks</a>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                                }
                                            } catch(Exception e) {
                                                e.printStackTrace();
                                            }
                                        }
                                    }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- jQuery, Popper.js, and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
