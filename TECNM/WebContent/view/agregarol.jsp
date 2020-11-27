<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>  
<jsp:useBean id="u" class="model.usuario"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Editar rol</title>
	</head>
	<body>
		<%  
			int i = usuarioDAO.editarol(u);  
		%>		<script>
	                alert('Rol actualizado con éxito!');
	    		</script>  
				<jsp:include page="actualizarol.jsp"></jsp:include>
	</body>
</html>