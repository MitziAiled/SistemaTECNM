package controller;

import java.sql.*;

public class conexion {
	String driver;
	String url;
	String uss;
	String pass;
	String host;
	String db;
	public static Connection conec=null;
	public static Statement st=null;
    public static ResultSet rt=null;
	
	public conexion() {
		driver = "com.mysql.jdbc.Driver";
		url = "jdbc:mysql://localhost:3306/tecnmmvc"; 
		uss = "root";
		pass = "";
	}
	
	public void Conectar(){
        try{;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conec=DriverManager.getConnection(url,uss,pass);
        }catch(Exception e){
            System.out.println(e);
        }
    }
	
	public int loguear(String us, String contra) {
		Connection conn;
		PreparedStatement pst;
		ResultSet rs;
		int rol = 0;
		String sql = "select rol from usuario where usuario ='" + us + "' and contrasena ='" + contra + "'";
		try {
			Class.forName(this.driver);
			conn = DriverManager.getConnection(this.url,this.uss,this.pass);
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rol = rs.getInt(1);
			}
			conn.close();
		}catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
		}
		return rol;
	}  
}