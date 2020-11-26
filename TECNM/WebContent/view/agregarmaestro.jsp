<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dao.*"%>  
<jsp:useBean id="u" class="model.carrera"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Guardando Maestro</title>
</head>
<body>
	<%  
		int i=carreraDAO.guardarmaestro(u);  
		if(i>0){  
	%>		<script>
                alert('Maestro asignado con éxito!');
    		</script>  
			<jsp:include page="maestroxcarrera.jsp"></jsp:include>
	<%  
		}else{  
			
	%>		<script>
                alert('Error al registrar al maestro! Intentalo de nuevo');
    		</script>  
			<jsp:include page="maestroxcarrera.jsp"></jsp:include>
			
	<%  
		}  
	%> 
</body>
</html>

html>