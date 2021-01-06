package config;

public interface DBConfig {
	public static final String DB_DRIVER = "oracle.jdbc.OracleDriver";
	
	// 접속 경로
	public static final String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	
	// 아이디, 비번 저장
	public static final String DB_USER = "scott";
	public static final String DB_PASSWD ="tiger";
}
