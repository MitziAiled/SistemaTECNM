package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class reporteDAO {
	
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tecnmmvc","root","");  
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    return con;  
	} 
	
	//Para obtener la lista de los maestros que tiene cada jefe
	public static List<reporte> getAllRecords(String usuario){  
	    List<reporte> list = new ArrayList<reporte>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("SELECT DISTINCT maes.clavemaestro, mat.maestro "
	        		+ "FROM materia AS mat "
	        		+ "JOIN maestro AS maes ON mat.maestro = maes.nombre "
	        		+ "JOIN usuario AS us ON mat.clavemaestro=us.clavemaestro "
	        		+ "WHERE us.usuario=? "
	        		+ "ORDER BY mat.clavemaestro;");  
	        ps.setString(1,usuario);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            reporte u=new reporte();  
	            u.setClavemaestro(rs.getInt("clavemaestro"));  
	            u.setMaestro(rs.getString("maestro"));
	            list.add(u);  
	        }  
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    
	    return list;  
	}
	
	//Para obtener el reporte que se muestra al jefe
	public static List<reporte> getAllInformation(int clavemaestro){  
	    List<reporte> list = new ArrayList<reporte>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("SELECT DISTINCT m.maestro, m.clavemaestro, m.creditos,"
	        		+ "m.clavemateria, m.materia, m.grupo, m.alumnos, carrera.clavecarrera, m.semestre,"
	        		+ "m.luneshora, m.marteshora, m.miercoleshora, m.jueveshora, m.vierneshora, m.horas_t,"
	        		+ "m.horas_p, m.creditos "
	        		+ "FROM materia as m "
	        		+ "JOIN maestro ON m.maestro = maestro.nombre "
	        		+ "JOIN carrera ON carrera.carrera = m.carrera "
	        		+ "WHERE maestro.clavemaestro = ?");  
	        ps.setInt(1, clavemaestro);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            reporte u=new reporte();  
	            u.setClavemaestro(rs.getInt("clavemaestro"));  
	            u.setMaestro(rs.getString("maestro"));
	            u.setCreditos(rs.getInt("creditos"));
	            u.setClavemateria(rs.getString("clavemateria"));
	            u.setMateria(rs.getString("materia"));
	            u.setGrupo(rs.getString("grupo"));
	            u.setAlumnos(rs.getInt("alumnos"));
	            u.setClavecarrera(rs.getString("clavecarrera"));
	            u.setSemestre(rs.getInt("semestre"));
	            u.setLuneshora(rs.getString("luneshora"));
	            u.setMarteshora(rs.getString("marteshora"));
	            u.setMiercoleshora(rs.getString("miercoleshora"));
	            u.setJueveshora(rs.getString("jueveshora"));
	            u.setVierneshora(rs.getString("vierneshora"));
	            u.setHorast(rs.getInt("horas_t"));
	            u.setHorasp(rs.getInt("horas_p"));
	            u.setCreditos(rs.getInt("creditos"));
	            list.add(u);  
	        }  
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    
	    return list;  
	}
	
	//Para mostrar el reporte de cada maestro que ingresa
	public static List<reporte> getAllTeacher(String usuario){  
	    List<reporte> list = new ArrayList<reporte>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("SELECT DISTINCT materia.maestro, "
	        		+ "maestro.clavemaestro, materia.clavemateria, materia.materia, "
	        		+ "materia.grupo, materia.alumnos, carrera.clavecarrera, materia.semestre, "
	        		+ "materia.luneshora, materia.marteshora, materia.miercoleshora, "
	        		+ "materia.jueveshora, materia.vierneshora, materia.horas_t, "
	        		+ "materia.horas_p, materia.creditos "
	        		+ "FROM materia "
	        		+ "JOIN carrera ON carrera.carrera = materia.carrera "
	        		+ "JOIN maestro ON materia.maestro = maestro.nombre "
	        		+ "JOIN usuario ON maestro.clavemaestro = usuario.clavemaestro "
	        		+ "WHERE usuario.usuario = ?");  
	        ps.setString(1, usuario);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            reporte u=new reporte();  
	            u.setClavemaestro(rs.getInt("clavemaestro"));  
	            u.setMaestro(rs.getString("maestro"));
	            u.setClavemateria(rs.getString("clavemateria"));
	            u.setMateria(rs.getString("materia"));
	            u.setGrupo(rs.getString("grupo"));
	            u.setAlumnos(rs.getInt("alumnos"));
	            u.setClavecarrera(rs.getString("clavecarrera"));
	            u.setSemestre(rs.getInt("semestre"));
	            u.setLuneshora(rs.getString("luneshora"));
	            u.setMarteshora(rs.getString("marteshora"));
	            u.setMiercoleshora(rs.getString("miercoleshora"));
	            u.setJueveshora(rs.getString("jueveshora"));
	            u.setVierneshora(rs.getString("vierneshora"));
	            u.setHorast(rs.getInt("horas_t"));
	            u.setHorasp(rs.getInt("horas_p"));
	            u.setCreditos(rs.getInt("creditos"));
	            list.add(u);  
	        }  
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    
	    return list;  
	}
	
	
}

