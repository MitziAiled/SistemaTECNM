<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dao.*,model.*,java.util.*"%> 
<%@page import="controller.conexion"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Consultar Materia</title>
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
                            <div class="sb-sidenav-menu-heading">Men�</div>
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
                            <a class="nav-link" href="tables.html">
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
                        <h1 class="mt-4">Edici�n de Materia</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Edite los campos necesarios del formulario que aparece a 
                            continuaci�n para modificar la informaci�n necesaria para la materia.</li>
                        </ol>
                        <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-body">
	                                    <%  
											String id=request.getParameter("id_materia");  
											materia u=materiaDAO.getRecordById(Integer.parseInt(id));
										%>
                                        <form action="editarmateria.jsp" method="post">
                                            <div class="form-row">
                                            	<div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="clavehorario">Clave del horario</label>
                                                        <input class="form-control py-4" name="clavehorario" id="clavehorario" type="text" value="<%=u.getClavehorario() %>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="clavemateria">Clave de la materia</label>
                                                        <input class="form-control py-4" name="clavemateria" id="clavemateria" type="text" value="<%=u.getClavemateria() %>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="materia">Nombre de la materia</label>
                                                        <input class="form-control py-4" name="materia" id="materia" type="text" value="<%=u.getMateria() %>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="carrera">Carrera</label>
                                                        <select name="carrera" class="form-control">
                                                        <option><%=u.getCarrera() %></option>
														<%
															String usu = sesion.getAttribute("user").toString();
															request.setAttribute("usuario", usu);
		                                                    List<carrera> list=carreraDAO.getCarrera(usu); 
															request.setAttribute("list",list);
														%>
														<c:forEach items="${list}" var="carrera">
														 	<option>
														 		${carrera.getCarrera()}
														 	</option>
													 	</c:forEach>
														</select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="maestro">Maestro</label>
                                                        <select name="maestro" class="form-control">
                                                        	<option><%=u.getMaestro() %></option>
															<%
															conexion conex = new conexion();
															try{
																conex.Conectar();
																String sql = "Select * from maestro;";
																conex.st=conex.conec.createStatement();
												                conex.rt=conex.st.executeQuery(sql);
												                while (conex.rt.next()){
												                    out.println("<option>"+conex.rt.getString(3)+"</option>");
												                }
												                }catch(Exception e){
												                    out.print(e.toString());
															}
															%>
														</select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="periodoescolar">Periodo Escolar</label>
                                                        <select name="periodoescolar" class="form-control">
                                                        	<option><%=u.getPeriodoescolar() %></option>
                                                        	<option value="AGOSTO-DICIEMBRE 2020">AGOSTO-DICIEMBRE 2020</option>
                                                        	<option value="ENERO-JUNIO 2021">ENERO-JUNIO 2021</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="turno">Turno</label>
                                                        <select name="turno" class="form-control">
                                                        	<option><%=u.getTurno() %></option>
                                                        	<option value="Matutino">Matutino</option>
                                                        	<option value="Vespertino">Vespertino</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="campus">Campus</label>
                                                        <select name="campus" class="form-control">
                                                        	<option><%=u.getCampus() %></option>
                                                        	<option value="1">1</option>
                                                        	<option value="2">2</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="grupo">Grupo</label>
                                                        <input class="form-control py-4" name="grupo" id="grupo" type="text" value="<%=u.getGrupo() %>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="alumnos">N�mero de Alumnos</label>
                                                        <input class="form-control py-4" name="alumnos" id="alumnos" type="text" value="<%=u.getAlumnos() %>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="semestre">Semestre</label>
                                                        <input class="form-control py-4" name="semestre" id="semestre" type="text" value="<%=u.getSemestre() %>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="creditos">Creditos</label>
                                                        <input class="form-control py-4" name="creditos" id="creditos" type="text" value="<%=u.getCreditos() %>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="horas_t">Horas te�ricas</label>
                                                        <input class="form-control py-4" name="horas_t" id="horas_t" type="text" value="<%=u.getHorast() %>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="horas_p">Horas pr�cticas</label>
                                                        <input class="form-control py-4" name="horas_p" id="horas_p" type="text" value="<%=u.getHorasp() %>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="luneshora">Horario para el Lunes</label>
                                                        <select name="luneshora" class="form-control">
                                                        	<option><%=u.getLuneshora() %></option>
                                                        	<option value="7:00 - 8:40">7:00 - 8:40</option>
                                                        	<option value="8:45 - 10:25">8:45 - 10:25</option>
                                                        	<option value="10:30 - 12:10">10:30 - 12:10</option>
                                                        	<option value="12:15 - 13:55">12:15 - 13:55</option>
                                                        	<option value="14:00 - 15:40">14:00 - 15:40</option>
                                                        	<option value="15:45 - 17:25">15:45 - 17:25</option>
                                                        	<option value="17:30 - 19:10">17:30 - 19:10</option>
                                                        	<option value="19:15 - 20:55">19:15 - 20:55</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="lunessalon">Sal�n para el Lunes</label>
                                                        <input class="form-control py-4" name="lunessalon" id="lunessalon" type="text" value="<%=u.getLunessalon() %>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="marteshora">Horario para el Martes</label>
                                                        <select name="marteshora" class="form-control">
                                                        	<option><%=u.getMarteshora() %></option>
                                                        	<option value="7:00 - 8:40">7:00 - 8:40</option>
                                                        	<option value="8:45 - 10:25">8:45 - 10:25</option>
                                                        	<option value="10:30 - 12:10">10:30 - 12:10</option>
                                                        	<option value="12:15 - 13:55">12:15 - 13:55</option>
                                                        	<option value="14:00 - 15:40">14:00 - 15:40</option>
                                                        	<option value="15:45 - 17:25">15:45 - 17:25</option>
                                                        	<option value="17:30 - 19:10">17:30 - 19:10</option>
                                                        	<option value="19:15 - 20:55">19:15 - 20:55</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="martessalon">Sal�n para el Martes</label>
                                                        <input class="form-control py-4" name="martessalon" id="martessalon" type="text" value="<%=u.getMartessalon() %>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="miercoleshora">Horario para el Mi�rcoles</label>
                                                        <select name="miercoleshora" class="form-control">
                                                        	<option><%=u.getMiercoleshora() %></option>
                                                        	<option value="7:00 - 8:40">7:00 - 8:40</option>
                                                        	<option value="8:45 - 10:25">8:45 - 10:25</option>
                                                        	<option value="10:30 - 12:10">10:30 - 12:10</option>
                                                        	<option value="12:15 - 13:55">12:15 - 13:55</option>
                                                        	<option value="14:00 - 15:40">14:00 - 15:40</option>
                                                        	<option value="15:45 - 17:25">15:45 - 17:25</option>
                                                        	<option value="17:30 - 19:10">17:30 - 19:10</option>
                                                        	<option value="19:15 - 20:55">19:15 - 20:55</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="miercolessalon">Sal�n para el Mi�rcoles</label>
                                                        <input class="form-control py-4" name="miercolessalon" id="miercolessalon" type="text" value="<%=u.getMiercolessalon() %>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="jueveshora">Horario para el Jueves</label>
                                                        <select name="luneshora" class="form-control">
                                                        	<option><%=u.getJueveshora() %></option>
                                                        	<option value="7:00 - 8:40">7:00 - 8:40</option>
                                                        	<option value="8:45 - 10:25">8:45 - 10:25</option>
                                                        	<option value="10:30 - 12:10">10:30 - 12:10</option>
                                                        	<option value="12:15 - 13:55">12:15 - 13:55</option>
                                                        	<option value="14:00 - 15:40">14:00 - 15:40</option>
                                                        	<option value="15:45 - 17:25">15:45 - 17:25</option>
                                                        	<option value="17:30 - 19:10">17:30 - 19:10</option>
                                                        	<option value="19:15 - 20:55">19:15 - 20:55</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="juevessalon">Sal�n para el Jueves</label>
                                                        <input class="form-control py-4" name="juevessalon" id="juevessalon" type="text" value="<%=u.getJuevessalon() %>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="vierneshora">Horario para el Viernes</label>
                                                        <select name="luneshora" class="form-control">
                                                        	<option><%=u.getVierneshora() %></option>
                                                        	<option value="7:00 - 8:40">7:00 - 8:40</option>
                                                        	<option value="8:45 - 10:25">8:45 - 10:25</option>
                                                        	<option value="10:30 - 12:10">10:30 - 12:10</option>
                                                        	<option value="12:15 - 13:55">12:15 - 13:55</option>
                                                        	<option value="14:00 - 15:40">14:00 - 15:40</option>
                                                        	<option value="15:45 - 17:25">15:45 - 17:25</option>
                                                        	<option value="17:30 - 19:10">17:30 - 19:10</option>
                                                        	<option value="19:15 - 20:55">19:15 - 20:55</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="viernessalon">Sal�n para el Viernes</label>
                                                        <input class="form-control py-4" name="viernessalon" id="viernessalon" type="text" value="<%=u.getViernessalon() %>" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="clavemaestro">ID Maestro </label>
                                                        <input class="form-control py-4" name="clavemaestro" id="clavemaestro" type="text" value="<%=u.getClavemaestro() %>" readonly/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mt-4 mb-0"><input class="btn btn-primary btn-block" type="submit" value="Editar"/></div>
                                        </form>
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