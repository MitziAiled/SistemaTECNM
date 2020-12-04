<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*, model.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Actualizar Jefes</title>
        <link href="startbootstrap-sb-admin-gh-pages/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="admin.jsp">ADMINISTRADOR</a>
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
                             <a class="nav-link" href="perfil.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Perfil
                            </a>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Carrera
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="formulariocarrera.jsp">Registrar Nueva</a>
                                    <a class="nav-link" href="actualizajefe.jsp">Consulta y Modificación</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="actualizarol.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Asignar Permisos a Jefes
                            </a>
                            <a class="nav-link" href="maestroxcarrera.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Registrar Maestros por Carrera
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Asignar Permisos a Jefes</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">En el siguiente apartado debera modificar 
                            el registro del maestro seleccionado como jefe de carrera para asignarle dicho rol.</li>
                        </ol>
                        <div class="container">
                        <div class="container-fluid">
                        <div class="card mb-4">
                        	<div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Código de Status
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<tr>
											<td>Administrador </td>
											<td>1</td>
										</tr>
										<tr>
											<td>Jefe de carrera</td>
											<td>2</td>
										</tr>
										<tr>
											<td>Maestro</td>
											<td>3</td>
										</tr>
									</table>
                                <%  
								List<usuario> list = usuarioDAO.getAllRecords();  
								request.setAttribute("list",list);  
								%>
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Clave del maestro</th>
												<th>Prefijo</th>
												<th>Nombre</th>
												<th>Apellido Paterno</th>
												<th>Apellido Materno</th>
												<th>Correo</th>
												<th>Teléfono</th>
												<th>Departamento</th>
												<th>Usuario</th>
												<th>Contraseña</th>
												<th>Rol</th>
												<th>Opción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list}" var="u">  
											<tr>
												<td>${u.getClavemaestro()}</td>
												<td>${u.getPrefijo()}</td>
												<td>${u.getNombre()}</td>  
												<td>${u.getApellidopat()}</td>
												<td>${u.getApellidomat()}</td>
												<td>${u.getMail()}</td>
												<td>${u.getTel()}</td>
												<td>${u.getDepto()}</td> 
												<td>${u.getUsuario()}</td>
												<td>${u.getContrasena()}</td>
												<td>${u.getRol()}</td>    
												<td><a href="formulariorol.jsp?clavemaestro=${u.getClavemaestro()}">Editar</a></td>
											</tr>  
										</c:forEach>
                                        </tbody>
                                    </table>
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