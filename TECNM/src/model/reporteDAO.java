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
	
	public static List<reporte> getAllRecords(String usuario){  
	    List<reporte> list = new ArrayList<reporte>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("SELECT DISTINCT maes.clavemaestro, mat.maestro "
	        		+ "FROM materia AS mat "
	        		+ "JOIN maestro AS maes ON mat.maestro = maes.nombre "
	        		+ "JOIN usuario AS us ON mat.clavemaestro=us.clavemaestro "
	        		+ "WHERE us.usuario=? "
	        		+ "ORDER BY us.clavemaestro;");  
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
	
	/*public static List<reporte> getAllInformation(int clavemaestro){  
	    List<reporte> list = new ArrayList<reporte>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("SELECT sabana.maestro, sabana.clavemaestro, sabana.clavemateria, " + 
	        		"sabana.materia, sabana.grupo, sabana.salon, sabana.alumnos, sabana.clavecarrera, sabana.semestre, " + 
	        		"sabana.lunes, sabana.martes, sabana.miercoles,sabana.jueves, " + 
	        		"sabana.viernes, sabana.horast, sabana.horasp, sabana.creditos " + 
	        		"FROM sabana " + 
	        		"JOIN usuario ON sabana.clavemaestro = usuario.clavemaestro " + 
	        		"WHERE usuario.clavemaestro = ?");  
	        ps.setInt(1, clavemaestro);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            reporte u=new reporte();  
	            u.setClavemaestro(rs.getInt("clavemaestro"));  
	            u.setMaestro(rs.getString("maestro"));
	            u.setClavemateria(rs.getString("clavemateria"));
	            u.setMateria(rs.getString("materia"));
	            u.setGrupo(rs.getString("grupo"));
	            u.setSalon(rs.getString("salon"));
	            u.setAlumnos(rs.getInt("alumnos"));
	            u.setClavecarrera(rs.getString("clavecarrera"));
	            u.setSemestre(rs.getInt("semestre"));
	            u.setLunes(rs.getString("lunes"));
	            u.setMartes(rs.getString("martes"));
	            u.setMiercoles(rs.getString("miercoles"));
	            u.setJueves(rs.getString("jueves"));
	            u.setViernes(rs.getString("viernes"));
	            u.setHorast(rs.getInt("horast"));
	            u.setHorasp(rs.getInt("horasp"));
	            u.setCreditos(rs.getInt("creditos"));
	            list.add(u);  
	        }  
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    
	    return list;  
	}
	
	public static List<reporte> getAllTeacher(String usuario){  
	    List<reporte> list = new ArrayList<reporte>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("SELECT sabana.maestro, sabana.clavemaestro, sabana.clavemateria, " + 
	        		"sabana.materia, sabana.grupo, sabana.salon, sabana.alumnos, sabana.clavecarrera, sabana.semestre, " + 
	        		"sabana.lunes, sabana.martes, sabana.miercoles,sabana.jueves, " + 
	        		"sabana.viernes, sabana.horast, sabana.horasp, sabana.creditos " + 
	        		"FROM sabana " + 
	        		"JOIN usuario ON sabana.clavemaestro = usuario.clavemaestro " + 
	        		"WHERE usuario.usuario = ?");  
	        ps.setString(1, usuario);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            reporte u=new reporte();  
	            u.setClavemaestro(rs.getInt("clavemaestro"));  
	            u.setMaestro(rs.getString("maestro"));
	            u.setClavemateria(rs.getString("clavemateria"));
	            u.setMateria(rs.getString("materia"));
	            u.setGrupo(rs.getString("grupo"));
	            u.setSalon(rs.getString("salon"));
	            u.setAlumnos(rs.getInt("alumnos"));
	            u.setClavecarrera(rs.getString("clavecarrera"));
	            u.setSemestre(rs.getInt("semestre"));
	            u.setLunes(rs.getString("lunes"));
	            u.setMartes(rs.getString("martes"));
	            u.setMiercoles(rs.getString("miercoles"));
	            u.setJueves(rs.getString("jueves"));
	            u.setViernes(rs.getString("viernes"));
	            u.setHorast(rs.getInt("horast"));
	            u.setHorasp(rs.getInt("horasp"));
	            u.setCreditos(rs.getInt("creditos"));
	            list.add(u);  
	        }  
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    
	    return list;  
	}*/
	
}

