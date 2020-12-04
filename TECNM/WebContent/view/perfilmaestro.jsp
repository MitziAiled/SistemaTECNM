<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="model.*,java.util.*"%> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Perfil de Maestro</title>
        <link href="startbootstrap-sb-admin-gh-pages/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="maestro.jsp">MAESTRO</a>
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
                            <a class="nav-link" href="perfilmaestro.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Perfil
                            </a>
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
                        <h1 class="mt-4">Perfil</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">En este apartado podras visualizar la información de tu perfil.</li>
                        </ol>
                        <div class="container">
                        	<div class="row justify-content-center">
                            	<div class="col-lg-7">
                                	<div class="card shadow-lg border-0 rounded-lg mt-5">
                                    	<div class="card-body">
		                                    <%  
		                                    String usu = sesion.getAttribute("user").toString();
		            						List<usuario> list = usuarioDAO.getPerfil(usu);
		            						request.setAttribute("list",list); 
											%>
	                                        <form action="editarmateria.jsp" method="post">
	                                            <div class="form-row">
	                                            	<div class="col-md-6">
	                                                    <div class="form-group">
	                                                        <label class="small mb-1" for="nombre">Nombre</label>
	                                                        <input class="form-control py-4" name="nombre" id="nombre" type="text" value="${list[0].getNombre()}" readonly/>
	                                                    </div>
	                                                </div>
	                                                <div class="col-md-6">
	                                                    <div class="form-group">
	                                                        <label class="small mb-1" for="apellidopat">Apellido Paterno</label>
	                                                        <input class="form-control py-4" name="apellidopat" id="apellidopat" type="text" value="${list[0].getApellidopat()}" readonly/>
	                                                    </div>
	                                                </div>
	                                                <div class="col-md-6">
	                                                    <div class="form-group">
	                                                        <label class="small mb-1" for="apellidomat">Apellido Materno</label>
	                                                        <input class="form-control py-4" name="apellidomat" id="apellidomat" type="text" value="${list[0].getApellidomat()}" readonly/>
	                                                    </div>
	                                                </div>
	                                                <div class="col-md-6">
	                                                    <div class="form-group">
	                                                        <label class="small mb-1" for="correo">Correo</label>
	                                                        <input class="form-control py-4" name="correo" id="correo" type="text" value="${list[0].getMail()}" readonly/>
	                                                    </div>
	                                                </div>
	                                                <div class="col-md-6">
	                                                    <div class="form-group">
	                                                        <label class="small mb-1" for="tel">Teléfono</label>
	                                                        <input class="form-control py-4" name="tel" id="tel" type="text" value="${list[0].getTel()}" readonly/>
	                                                    </div>
	                                                </div>
	                                                <div class="col-md-6">
	                                                    <div class="form-group">
	                                                        <label class="small mb-1" for="depto">Departamento</label>
	                                                        <input class="form-control py-4" name="depto" id="depto" type="text" value="${list[0].getDepto()}" readonly/>
	                                                    </div>
	                                                </div>
	                                                <div class="col-md-6">
	                                                    <div class="form-group">
	                                                        <label class="small mb-1" for="usuario">Usuario</label>
	                                                        <input class="form-control py-4" name="usuario" id="usuario" type="text" value="${list[0].getUsuario()}" readonly/>
	                                                    </div>
	                                                </div>
	                                                <div class="col-md-6">
	                                                    <div class="form-group">
	                                                        <label class="small mb-1" for="contrasena">Contraseña</label>
	                                                        <input class="form-control py-4" name="contrasena" id="contrasena" type="text" value="${list[0].getContrasena()}" readonly/>
	                                                    </div>
	                                                </div>
	                                                <div class="col-md-6">
	                                                    <div class="form-group">
	                                                        <label class="small mb-1" for="clavemaestro">Clave de Usuario</label>
	                                                        <input class="form-control py-4" name="clavemaestro" id="clavemaestro" type="text" value="${list[0].getClavemaestro()}" readonly/>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </form>
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