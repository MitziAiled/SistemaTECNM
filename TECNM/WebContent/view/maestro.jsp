<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.*,java.util.*"%>  
<%@page import="controller.*"%>
<%@page import="dao.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - Maestro</title>
        <link href="startbootstrap-sb-admin-gh-pages/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="index.html">MAESTRO/A</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>

            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
	                        <%
								HttpSession sesion = request.getSession(); 
								String usuario;
								String rol;
								
								if(sesion.getAttribute("user")!=null && sesion.getAttribute("rol")!=null){
									usuario = sesion.getAttribute("user").toString(); 
									rol = sesion.getAttribute("rol").toString();
									out.print("<a class='dropdown-item' href='login.jsp?cerrar=true'>Cerrar sesion</a>");
								}else{
									out.print("<script>location.replace('login.jsp');</script>");
								}
							%>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Menú</div>
                            <a class="nav-link" href="">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Ver mi reporte
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Bienvenido (a)</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Bienvenido maestro(a), 
                            en el presente sistema podra visualizar el reporte de las materias que imparte, incluyendo sus horarios,
                            salones, numero de alumnos y horarios.</li>
                        </ol>
                        <!--%
						String usu = sesion.getAttribute("user").toString();
						request.setAttribute("usuario", usu);
						List<reporte> list = reporteDAO.getAllTeacher(usu);  
						request.setAttribute("list",list); 
						%-->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Información de maestro(a)
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<tr>
											<td>Nombre del Maestro: </td>
											<td>${list[0].getMaestro()}</td>
										</tr>
										<tr>
											<td>Clave del maestro: </td>
											<td>${list[0].getClavemaestro()}</td>
										</tr>
										<tr>
											<td>Horas por impartir: </td>
											<td>${list[0].getCreditos()}</td>
										</tr>
									</table>
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Clave Materia</th>
												<th>Materia</th>
												<th>Grupo</th>
												<th>Salon</th>
												<th>Alumnos</th>
												<th>Clave Carrera</th>
												<th>Semestre</th>
												<th>Lunes</th>
												<th>Martes</th>
												<th>Miercoles</th>
												<th>Jueves</th>
												<th>Viernes</th>
												<th>HT</th>
												<th>HP</th>
												<th>Creditos</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Clave Materia</th>
												<th>Materia</th>
												<th>Grupo</th>
												<th>Salon</th>
												<th>Alumnos</th>
												<th>Clave Carrera</th>
												<th>Semestre</th>
												<th>Lunes</th>
												<th>Martes</th>
												<th>Miercoles</th>
												<th>Jueves</th>
												<th>Viernes</th>
												<th>HT</th>
												<th>HP</th>
												<th>Creditos</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach items="${list}" var="report">
											 	<tr>
											 		<td>${report.getClavemateria()}</td>
											 		<td>${report.getMateria()}</td>
											 		<td>${report.getGrupo()}</td>
											 		<td>${report.getSalon()}</td>
											 		<td>${report.getAlumnos()}</td>
											 		<td>${report.getClavecarrera()}</td>
											 		<td>${report.getSemestre()}</td>
											 		<td>${report.getLunes()}</td>
											 		<td>${report.getMartes()}</td>
											 		<td>${report.getMiercoles()}</td>
											 		<td>${report.getJueves()}</td>
											 		<td>${report.getViernes()}</td>
											 		<td>${report.getHorast()}</td>
											 		<td>${report.getHorasp()}</td>
											 		<td>${report.getCreditos()}</td>
											 	</tr>
										 	</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                </main>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    </body>
</html>