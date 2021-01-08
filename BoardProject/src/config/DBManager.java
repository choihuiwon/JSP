package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBManager {
	/*
	private static DBManager instance = new DBManager();

	private Connection conn;
	
	private DBManager() {
		try {
			// 드라이버 로딩
			Class.forName(DBConfig.DB_DRIVER);
			// DB 접속
			conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_USER, DBConfig.DB_PASSWD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public Connection getConnection() {
		return conn;
	}
	
	public static DBManager getInstance() {
		if(instance == null)
			instance = new DBManager();
		return instance;
	}
	
	public void close(ResultSet rs, PreparedStatement pstmt) {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	*/
	private static DBManager instance = new DBManager();
	private DataSource source;
	private Connection connection;
	private DBManager() {
		Context context;
		try {
			context = new InitialContext();
			source = (DataSource) context.lookup("java:/comp/env/jdbc/myoracle");
			connection = source.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Connection getConnection() {
		return connection;
	}
	public void setConnection(Connection connection) {
		this.connection = connection;
	}
	public DataSource getSource() {
		return source;
	}
	public static DBManager getInstance() {
		if (instance == null)
			instance = new DBManager();
		return instance;
	}

	public void close(ResultSet rs, PreparedStatement pstmt) {
		try {
			if (pstmt != null)
				pstmt.close();
			if(rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
