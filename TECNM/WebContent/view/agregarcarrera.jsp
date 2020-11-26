<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dao.carreraDAO"%>  
<jsp:useBean id="u" class="model.carrera"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Guardando Carrera</title>
</head>
<body>
	<%  
		int i=carreraDAO.guardarcarrera(u);  
		if(i>0){  
	%>		<script>
                alert('Carrera registrada con éxito!');
    		</script>  
			<jsp:include page="actualizarol.jsp"></jsp:include>
	<%  
		}else{  
			
	%>		<script>
                alert('Error al registrar la carrera! Intentalo de nuevo');
    		</script>  
			<jsp:include page="formulariocarrera.jsp"></jsp:include>
			
	<%  
		}  
	%> 
</body>
</html>

