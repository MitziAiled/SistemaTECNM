<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>  
<jsp:useBean id="u" class="model.carrera"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Editando Jefe de Carrera</title>
	</head>
	<body>
		<%  
			int i = carreraDAO.editarjefe(u);  
		%>		<script>
	                alert('Jefe actualizado con éxito!');
	    		</script>  
				<jsp:include page="actualizarol.jsp"></jsp:include> 
	</body>
</html>