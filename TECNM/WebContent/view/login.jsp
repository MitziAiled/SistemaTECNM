<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page session="true" %>
<%@ page import="controller.conexion" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>TECNM</title>
        <link href="startbootstrap-sb-admin-gh-pages/dist/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Inicia Sesión</h3></div>
                                    <div class="card-body">
                                        <form>
                                            <div class="form-group">
                                                <label class="small mb-1" for="usuario">Usuario</label>
                                                <input class="form-control py-4" id="usuario" type="text" name="txtusuario" id="usuario" placeholder="Ingresa tu nombre de usuario" />
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="contrasena">Contraseña</label>
                                                <input class="form-control py-4" id="contrasena" type="password" name="txtcontrasena" id="contrasena" placeholder="Ingresa tu contraseña" />
                                            </div>
                                            
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <button class="btn btn-primary" type="submit" name="ingresar" >Ingresar</a>
                                            </div>
                                        </form>
                                        <%
										conexion c = new conexion();
									
										if(request.getParameter("ingresar")!=null){
											String nombre = request.getParameter("txtusuario");
											String contra = request.getParameter("txtcontrasena");
											
											HttpSession sesion = request.getSession();
											
											switch(c.loguear(nombre, contra)){
												case 1:
													sesion.setAttribute("user", nombre);
													sesion.setAttribute("rol", "1");
													response.sendRedirect("admin.jsp");
													break;
												case 2:
													sesion.setAttribute("user", nombre);
													sesion.setAttribute("rol", "2");
													response.sendRedirect("jefe.jsp");
													break;
												case 3:
													sesion.setAttribute("user", nombre);
													sesion.setAttribute("rol", "3");
													response.sendRedirect("maestro.jsp");
													break;
												default:
													out.write("Usuario o contraseña invalido!");
													break;
											}
										}
										
										if(request.getParameter("cerrar")!=null){
											session.invalidate();
										}
									%>
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
    </body>
</html>