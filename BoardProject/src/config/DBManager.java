package config;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBManager {
	private static DBManager instance = new DBManager();
	private DataSource source;
	private DBManager() {
		Context context;
		try {
			context = new InitialContext();
			source  = (DataSource) context.lookup("java:/comp/env/jdbc/myoracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public DataSource getSource() {
		return source;
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
	
}
