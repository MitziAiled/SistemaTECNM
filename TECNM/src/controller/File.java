package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/File")
public class File extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String insercion = "INSERT INTO materia (clavemateria, clavehorario, materia, carrera,"
			+ " maestro, periodoescolar, turno, campus, grupo, alumnos, semestre, creditos, horas_t, horas_p) "
			+ "VALUE (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

    public File() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

	public static String getInsercion() {
		return insercion;
	}

}
