package model;

public class usuario {
	private int clavemaestro;
	private String prefijo; 
	private String nombre; 
	private String apellidopat; 
	private String apellidomat; 
	private String mail; 
	private String tel; 
	private String depto; 
	private String usuario; 
	private String contrasena; 
	private int rol;
	
	public int getClavemaestro() {
		return clavemaestro;
	}
	public void setClavemaestro(int clavemaestro) {
		this.clavemaestro = clavemaestro;
	}
	public String getPrefijo() {
		return prefijo;
	}
	public void setPrefijo(String prefijo) {
		this.prefijo = prefijo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidopat() {
		return apellidopat;
	}
	public void setApellidopat(String apellidopat) {
		this.apellidopat = apellidopat;
	}
	public String getApellidomat() {
		return apellidomat;
	}
	public void setApellidomat(String apellidomat) {
		this.apellidomat = apellidomat;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getDepto() {
		return depto;
	}
	public void setDepto(String depto) {
		this.depto = depto;
	}
	public int getRol() {
		return rol;
	}
	public void setRol(int rol) {
		this.rol = rol;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getContrasena() {
		return contrasena;
	}
	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}
	
}
