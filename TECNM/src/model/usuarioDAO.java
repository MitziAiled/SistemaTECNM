package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class usuarioDAO {
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
	
	public static List<usuario> getAllRecords(){  
	    List<usuario> list=new ArrayList<usuario>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from usuario;");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            usuario u=new usuario();  
	            u.setClavemaestro(rs.getInt("clavemaestro")); 
	            u.setPrefijo(rs.getString("prefijo"));
	            u.setNombre(rs.getString("nombre"));
	            u.setApellidopat(rs.getString("apellidopat")); 
	            u.setApellidomat(rs.getString("apellidomat"));
	            u.setMail(rs.getString("mail"));
	            u.setTel(rs.getString("tel"));
	            u.setDepto(rs.getString("depto"));
	            u.setUsuario(rs.getString("usuario"));
	            u.setContrasena(rs.getString("contrasena"));
	            u.setRol(rs.getInt("rol"));
	            list.add(u);  
	        }  
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    }
	    return list;
	}
	
	public static usuario getRecordById(int clavemaestro){  
	    usuario u = null;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from usuario where clavemaestro=?");  
	        ps.setInt(1,clavemaestro);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new usuario();  
	            u.setClavemaestro(rs.getInt("clavemaestro"));  
	            u.setPrefijo(rs.getString("prefijo"));
	            u.setNombre(rs.getString("nombre"));  
	            u.setApellidopat(rs.getString("apellidopat"));  
	            u.setApellidomat(rs.getString("apellidomat"));
	            u.setMail(rs.getString("mail"));  
	            u.setTel(rs.getString("tel"));  
	            u.setDepto(rs.getString("depto"));  
	            u.setUsuario(rs.getString("usuario"));  
	            u.setContrasena(rs.getString("contrasena"));  
	            u.setRol(rs.getInt("rol")); 
	        }  
	    }catch(Exception e){
	    	System.out.println(e);
	    }
	    return u;
	}
	
	public static int editarol(usuario u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	        		"update usuario set rol=? where clavemaestro=?");  
	        ps.setInt(1,u.getRol());
	        ps.setInt(2,u.getClavemaestro()); 
	        status=ps.executeUpdate(); 
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    return status;  
	}
	
	public static usuario getId(String usuario){  
	    usuario u = null;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select clavemaestro from usuario where usuario=?");  
	        ps.setString(1,usuario);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new usuario();  
	            u.setClavemaestro(rs.getInt("clavemaestro"));  
	        }  
	    }catch(Exception e){
	    	System.out.println(e);
	    }
	    return u;
	}
	
	//Para mostrar la información del perfil del usuario
		public static List<usuario> getPerfil(String usuario){  
		    List<usuario> list = new ArrayList<usuario>();  
		      
		    try{  
		        Connection con=getConnection();  
		        PreparedStatement ps=con.prepareStatement("SELECT clavemaestro, nombre, apellidopat, "
		        		+ "apellidomat, tel, mail, depto, usuario, contrasena "
		        		+ "FROM usuario WHERE usuario = ?");  
		        ps.setString(1, usuario);
		        ResultSet rs=ps.executeQuery();  
		        while(rs.next()){  
		            usuario u = new usuario();  
		            u.setNombre(rs.getString("nombre"));
		            u.setApellidopat(rs.getString("apellidopat"));
		            u.setApellidomat(rs.getString("apellidomat"));
		            u.setTel(rs.getString("tel"));
		            u.setMail(rs.getString("mail"));
		            u.setDepto(rs.getString("depto"));
		            u.setUsuario(rs.getString("usuario"));
		            u.setContrasena(rs.getString("contrasena"));
		            u.setClavemaestro(rs.getInt("clavemaestro"));
		            list.add(u);  
		        }  
		    }catch(Exception e){
		    	System.out.println(e);
		    }  
		    
		    return list;  
		}
}
