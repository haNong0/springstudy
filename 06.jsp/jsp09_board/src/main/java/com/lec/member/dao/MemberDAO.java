package com.lec.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import com.lec.db.JDBCUitility;
import com.lec.member.vo.MemberBean;

public class MemberDAO {
	
	 
		private MemberDAO() {}
		private static MemberDAO memberDAO;
		public static MemberDAO getInstance() {
			if(memberDAO == null) memberDAO = new MemberDAO();
			return memberDAO;
		}

		Connection conn = null;
		DataSource ds = null;

		// DB커넥션
		public void setConnection(Connection conn) {
			this.conn = conn;
		}

		// 회원가입기능
		public int insertMember(MemberBean member) {

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "insert into member(id, password, name, age, gender, email )"
					 + "values(?,?,?,?,?,?,now())";

			
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) 

				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getPassword());
				pstmt.setString(3, member.getName());
				pstmt.setString(4, member.getGender());
				pstmt.setString(4, member.getEmail());
				
				
				 return pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("회원가입 실패!!! : " + e.getMessage());
			} finally {
				JDBCUitility.close(null, pstmt, rs);
			}
			return 0;

	
		}
}
