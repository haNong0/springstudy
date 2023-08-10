package com.lec.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCUtil {
//sql명령어를 객체로 만들어서 코드의 가독성 + 편의성을 높인다.
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			// dummy
		}
	}
	
	public static void rollback(Connection conn) {
		try { if(conn != null) conn.rollback();	} catch (Exception e) {}	
	}
}