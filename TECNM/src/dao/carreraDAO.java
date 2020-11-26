package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.*;

public class carreraDAO {
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.cj.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tecnmmvc","root","");  
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    return con;  
	} 
	
	public static int guardarcarrera(carrera u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection(); 
	        PreparedStatement ps=con.prepareStatement(  
	        		"insert into carrera(carrera,clavecarrera,jefe) values(?,?,?)");
	        ps.setString(1,u.getCarrera());  
	        ps.setString(2,u.getClavecarrera()); 
	        ps.setString(3,u.getJefe());
	        status=ps.executeUpdate();
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    return status;  
	}  
	
	public static int guardarmaestro(carrera u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection(); 
	        PreparedStatement ps=con.prepareStatement(  
	        		"insert into maestroxcarrera(carrera,maestro) values(?,?)");
	        ps.setString(1,u.getCarrera());  
	        ps.setString(2,u.getMaestro()); 
	        status=ps.executeUpdate();
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    return status;  
	}
	
	public static List<carrera> getCarrera(String usuario){  
	    List<carrera> list = new ArrayList<carrera>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("SELECT DISTINCT c.carrera FROM carrera AS c " + 
	        		"JOIN maestro AS m ON c.jefe = m.nombre " + 
	        		"JOIN usuario AS u ON m.clavemaestro = u.clavemaestro " + 
	        		"where u.usuario = ?");  
	        ps.setString(1, usuario);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            carrera u=new carrera();  
	            u.setCarrera(rs.getString("carrera"));
	            list.add(u);  
	        }  
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    
	    return list;  
	}
	
	public static List<carrera> getAllRecords(){  
	    List<carrera> list=new ArrayList<carrera>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select clavecarrera,carrera,jefe from carrera");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            carrera u=new carrera();  
	            u.setClavecarrera(rs.getString("clavecarrera"));  
	            u.setCarrera(rs.getString("carrera"));  
	            u.setJefe(rs.getString("jefe")); 
	            list.add(u);  
	        }  
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    
	    return list;  
	}
	
	public static carrera getRecordById(String clavecarrera){  
	    carrera u = null;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select clavecarrera,jefe from carrera where clavecarrera=?");  
	        ps.setString(1,clavecarrera);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new carrera();   
	            u.setCarrera(rs.getString("clavecarrera"));  
	            u.setJefe(rs.getString("jefe"));  
	        }  
	    }catch(Exception e){
	    	System.out.println(e);
	    }
	    return u;
	}
	
	public static int editarjefe(carrera u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	        		"update carrera set jefe=? where clavecarrera=?");  
	        ps.setString(1,u.getJefe()); 
	        ps.setString(2,u.getClavecarrera());
	        status=ps.executeUpdate(); 
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    return status;  
	} 
	
	public static List<carrera> getMaestro(String usuario){  
	    List<carrera> lista = new ArrayList<carrera>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("SELECT DISTINCT mxc.maestro "
	        		+ "FROM maestroxcarrera AS mxc "
	        		+ "JOIN carrera AS c ON mxc.carrera = c.carrera "
	        		+ "JOIN maestro AS m ON c.jefe = m.nombre "
	        		+ "JOIN usuario AS u ON m.clavemaestro=u.clavemaestro "
	        		+ "WHERE u.usuario=?");  
	        ps.setString(1, usuario);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	carrera u=new carrera();  
	            u.setMaestro(rs.getString("maestro"));
	            lista.add(u);  
	        }  
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    
	    return lista;  
	}
} 
