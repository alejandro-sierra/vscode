package es.severo.bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JardineriaBD {

	public void holaSevero() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null; // Similar a un cursor
		try {
			// Crea la conexión con localhost con usuario root y sin contraseña
			conn = DriverManager.getConnection("jdbc:mariadb://localhost/", "severo", "severo");
			// Crea una sentencia a partir de la conexión
			stmt = conn.createStatement();
			// Ejecuta una consulta
			rs = stmt.executeQuery("SELECT 'Hola Severo!'");
			// Obtiene el primer registro
			rs.first();
			// Mostramos el primer campo
			System.out.println(rs.getString(1));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				// Cerramos la sentencia y la conexión
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void listarClientes() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			// Nos conectamos a la bd de 'jardineria'
			conn = DriverManager.getConnection("jdbc:mariadb://localhost/jardineria", "severo", "severo");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from cliente");
			// Recorremos el Resulset
			while (rs.next()) {
				// Recuperamos campos por la posición o por el nombre de la columna
				System.out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString("telefono"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	

	public void insertaOficinaMal(String codigo, String ciudad,String  pais, String codigoPostal, String telefono,String  direccion) {
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DriverManager.getConnection("jdbc:mariadb://localhost/jardineria", "severo", "severo");
			stmt = conn.createStatement();
			// Realizamos una inserción con los datos que recibimos como parámetros
			// Mal: posible SQLInjection al concatenar los datos directamente sobre la construcción de la consulta
			String sql = "insert into oficina (codigo_oficina, ciudad, pais, codigo_postal, telefono, linea_direccion1) ";
			sql += " values ('" + codigo + "','" + ciudad + "','" + pais + "','" + codigoPostal + "','" + telefono + "','" + direccion + "')";
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	

	public void insertaOficinaBien(String codigo, String ciudad,String  pais, String codigoPostal, String telefono,String  direccion) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {

			conn = DriverManager.getConnection("jdbc:mariadb://localhost/jardineria", "severo", "severo");
			// Preparamos la consulta con parámetros
			String sql = "insert into oficina (codigo_oficina, ciudad, pais, codigo_postal, telefono, linea_direccion1) ";
			sql += " values (?, ?, ?, ?, ?, ?)";
			// Creamos la sentencia preparada y le asignamos los datos por posición
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, codigo);
			pstmt.setString(2, ciudad);
			pstmt.setString(3, pais);
			pstmt.setString(4, codigoPostal);
			pstmt.setString(5, telefono);
			pstmt.setString(6, direccion);
			// No se le pasa la consulta pq la hemos asignado al crear la sentencia
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
		JardineriaBD maria = new JardineriaBD();
		maria.holaSevero();
		maria.listarClientes();
		maria.insertaOficinaMal("SQLI","Elche", "Spain", "03206", "966 123 123", "Debajo del puente");
		maria.insertaOficinaBien("PSTMT","Elche", "Spain", "03206", "966 123 123", "Debajo del puente");
	}
}