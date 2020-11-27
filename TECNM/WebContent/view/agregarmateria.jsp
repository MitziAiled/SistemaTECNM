<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>  
<jsp:useBean id="u" class="model.materia"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregando materia</title>
</head>
<body>
	<%  
		int i=materiaDAO.guardarmateria(u);  
		if(i>0){  
	%>		<script>
                alert('Materia registrada con éxito!');
    		</script>  
			<jsp:include page="vermateria.jsp"></jsp:include>
	<%  
		}else{  
			
	%>		<script>
                alert('Error al registrar la materia! Intentalo de nuevo');
    		</script>  
			<jsp:include page="formulariomateria.jsp"></jsp:include>
			
	<%  
		}  
	%>  
</body>
</html>