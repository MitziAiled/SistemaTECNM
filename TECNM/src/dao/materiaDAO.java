package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;

import model.*;

public class materiaDAO {
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
	
	public static int guardarmateria(materia u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	        		"insert into materia(clavemateria,clavehorario,materia,carrera,maestro,"
	        		+ "periodoescolar,turno,campus,grupo,alumnos,semestre,creditos,horas_t,"
	        		+ "horas_p,luneshora,lunessalon,marteshora,martessalon,miercoleshora,"
	        		+ "miercolessalon,jueveshora,juevessalon,vierneshora,viernessalon,clavemaestro) "
	        		+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	        ps.setString(1,u.getClavemateria());  
	        ps.setString(2,u.getClavehorario());  
	        ps.setString(3,u.getMateria());  
	        ps.setString(4,u.getCarrera());  
	        ps.setString(5,u.getMaestro());
	        ps.setString(6,u.getPeriodoescolar());
	        ps.setString(7,u.getTurno());
	        ps.setInt(8,u.getCampus());
	        ps.setString(9,u.getGrupo());
	        ps.setInt(10,u.getAlumnos());
	        ps.setInt(11,u.getSemestre());
	        ps.setInt(12,u.getCreditos());
	        ps.setInt(13,u.getHorast());
	        ps.setInt(14,u.getHorasp());
	        ps.setString(15,u.getLuneshora());
	        ps.setString(16,u.getLunessalon());
	        ps.setString(17,u.getMarteshora());
	        ps.setString(18,u.getMartessalon());
	        ps.setString(19,u.getMiercoleshora());
	        ps.setString(20,u.getMiercolessalon());
	        ps.setString(21,u.getJueveshora());
	        ps.setString(22,u.getJuevessalon());
	        ps.setString(23,u.getVierneshora());
	        ps.setString(24,u.getViernessalon());
	        ps.setInt(25,u.getClavemaestro());
	        status=ps.executeUpdate();  
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    return status;  
	}
	
	/*public static List<materia> getAllRecords(){  
	    List<materia> list=new ArrayList<materia>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from materia");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            materia u=new materia();  
	            u.setId_materia(rs.getInt("id_materia"));  
	            u.setClavemateria(rs.getString("clavemateria"));
	            u.setClavehorario(rs.getString("clavehorario"));
	            u.setMateria(rs.getString("materia"));
	            u.setCarrera(rs.getString("carrera"));
	            u.setMaestro(rs.getString("maestro"));
	            u.setPeriodoescolar(rs.getString("periodoescolar"));
	            u.setTurno(rs.getString("turno"));
	            u.setCampus(rs.getInt("campus"));  
	            u.setGrupo(rs.getString("grupo"));
	            u.setAlumnos(rs.getInt("alumnos"));
	            u.setSemestre(rs.getInt("semestre"));   
	            u.setCreditos(rs.getInt("creditos"));  
	            u.setHorast(rs.getInt("horas_t")); 
	            u.setHorasp(rs.getInt("horas_p")); 
	            u.setLuneshora(rs.getString("luneshora"));
	            u.setLunessalon(rs.getString("lunessalon"));
	            u.setMarteshora(rs.getString("marteshora"));
	            u.setMartessalon(rs.getString("martessalon"));
	            u.setMiercoleshora(rs.getString("miercoleshora"));
	            u.setMiercolessalon(rs.getString("miercolessalon"));
	            u.setJueveshora(rs.getString("jueveshora"));
	            u.setJuevessalon(rs.getString("juevessalon"));
	            u.setVierneshora(rs.getString("vierneshora"));
	            u.setViernessalon(rs.getString("viernessalon"));
	            list.add(u);  
	        }  
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    
	    return list;  
	}
	
	public static materia getRecordById(int id_materia){  
	    materia u = null;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from materia where id_materia=?");  
	        ps.setInt(1,id_materia);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new materia();  
	            u.setId_materia(rs.getInt("id_materia"));  
	            u.setClavemateria(rs.getString("clavemateria"));
	            u.setClavehorario(rs.getString("clavehorario"));
	            u.setMateria(rs.getString("materia"));
	            u.setCarrera(rs.getString("carrera"));
	            u.setMaestro(rs.getString("maestro"));
	            u.setPeriodoescolar(rs.getString("periodoescolar"));
	            u.setTurno(rs.getString("turno"));
	            u.setCampus(rs.getInt("campus"));  
	            u.setGrupo(rs.getString("grupo"));
	            u.setAlumnos(rs.getInt("alumnos"));
	            u.setSemestre(rs.getInt("semestre"));   
	            u.setCreditos(rs.getInt("creditos"));  
	            u.setHorast(rs.getInt("horas_t")); 
	            u.setHorasp(rs.getInt("horas_p")); 
	            u.setLuneshora(rs.getString("luneshora"));
	            u.setLunessalon(rs.getString("lunessalon"));
	            u.setMarteshora(rs.getString("marteshora"));
	            u.setMartessalon(rs.getString("martessalon"));
	            u.setMiercoleshora(rs.getString("miercoleshora"));
	            u.setMiercolessalon(rs.getString("miercolessalon"));
	            u.setJueveshora(rs.getString("jueveshora"));
	            u.setJuevessalon(rs.getString("juevessalon"));
	            u.setVierneshora(rs.getString("vierneshora"));
	            u.setViernessalon(rs.getString("viernessalon"));  
	        }  
	    }catch(Exception e){
	    	System.out.println(e);
	    }
	    return u;
	}
	
	public static int eliminarmateria(materia u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from materia where id_materia=?");  
	        ps.setInt(1,u.getId_materia());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){
	    	System.out.println(e);
	    }
	    return status;  
	}
	
	public static List<materia> getAllRecordsC(){  
	    List<materia> list=new ArrayList<materia>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from materia order by carrera");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            materia u=new materia();  
	            u.setId_materia(rs.getInt("id_materia"));  
	            u.setClavemateria(rs.getString("clavemateria"));
	            u.setClavehorario(rs.getString("clavehorario"));
	            u.setMateria(rs.getString("materia"));
	            u.setCarrera(rs.getString("carrera"));
	            u.setMaestro(rs.getString("maestro"));
	            u.setPeriodoescolar(rs.getString("periodoescolar"));
	            u.setTurno(rs.getString("turno"));
	            u.setCampus(rs.getInt("campus"));  
	            u.setGrupo(rs.getString("grupo"));
	            u.setAlumnos(rs.getInt("alumnos"));
	            u.setSemestre(rs.getInt("semestre"));   
	            u.setCreditos(rs.getInt("creditos"));  
	            u.setHorast(rs.getInt("horas_t")); 
	            u.setHorasp(rs.getInt("horas_p")); 
	            u.setLuneshora(rs.getString("luneshora"));
	            u.setLunessalon(rs.getString("lunessalon"));
	            u.setMarteshora(rs.getString("marteshora"));
	            u.setMartessalon(rs.getString("martessalon"));
	            u.setMiercoleshora(rs.getString("miercoleshora"));
	            u.setMiercolessalon(rs.getString("miercolessalon"));
	            u.setJueveshora(rs.getString("jueveshora"));
	            u.setJuevessalon(rs.getString("juevessalon"));
	            u.setVierneshora(rs.getString("vierneshora"));
	            u.setViernessalon(rs.getString("viernessalon"));
	            list.add(u);  
	        }  
	    }catch(Exception e){
	    	System.out.println(e);
	    }  
	    
	    return list;  
	}*/
}
	
	
