<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dao.*"%>  
<jsp:useBean id="u" class="model.materia"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Editar una Materia</title>
	</head>
	<body>
		<%  
			int i = materiaDAO.editarmateria(u);
			response.sendRedirect("vermateria.jsp");  
		%>  
	</body>
</html>