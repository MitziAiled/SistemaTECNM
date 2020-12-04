<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.*, java.util.*"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Reporte del maestro</title>
        <link href="startbootstrap-sb-admin-gh-pages/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="jefe.jsp">JEFE DE CARRERA</a>
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
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                MATERIAS
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="formulariomateria.jsp">Registro de Materia</a>
                                    <a class="nav-link" href="vermateria.jsp">Consulta de materias</a>
                                </nav>
                            </div>
                             <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                CARGAR ARCHIVO DE MATERIAS (csv)
                            </a>
                            <a class="nav-link" href="versabana.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                SABANA
                            </a>
                            <a class="nav-link" href="verreporte.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                REPORTES
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Reporte de Maestro</h1>
                        <div class="container">
                        	<div class="container-fluid">
                        		<div class="card mb-4">
                        			<div class="card-header">
                                		<i class="fas fa-table mr-1"></i>
                                		Información del maestro
                            		</div>
                            		<div class="card-body">
                                		<div class="table-responsive">
                                		<%  
											String clavemaestro=request.getParameter("clavemaestro");
											request.setAttribute("clavemaestro", clavemaestro);
											List<reporte> list = reporteDAO.getAllInformation(Integer.parseInt(clavemaestro));  
											request.setAttribute("list",list); 
										%>
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
		                                                <td>Clave Materia</td>
														<td>Materia</td>
														<td>Grupo</td>
														<td>Alumnos</td>
														<td>Clave Carrera</td>
														<td>Semestre</td>
														<td>Lunes</td>
														<td>Martes</td>
														<td>Miercoles</td>
														<td>Jueves</td>
														<td>Viernes</td>
														<td>HT</td>
														<td>HP</td>
														<td>Creditos</td>
		                                            </tr>
		                                        </thead>
		                                        <tbody>
		                                            <c:forEach items="${list}" var="report">  
													<tr>
														<td>${report.getClavemateria()}</td>
												 		<td>${report.getMateria()}</td>
												 		<td>${report.getGrupo()}</td>
												 		<td>${report.getAlumnos()}</td>
												 		<td>${report.getClavecarrera()}</td>
												 		<td>${report.getSemestre()}</td>
												 		<td>${report.getLuneshora()}</td>
												 		<td>${report.getMarteshora()}</td>
												 		<td>${report.getMiercoleshora()}</td>
												 		<td>${report.getJueveshora()}</td>
												 		<td>${report.getVierneshora()}</td>
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