package com.lec.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.lec.ex04_connector.JDBCConnector;








public class BoardList {
	
	public  ArrayList<Board> getBoardList() {
		
		Connection conn =  JDBCConnector.getConnection();
		
		ArrayList<Board> boards = new ArrayList<>();
	
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement("select * from board order by bno desc");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBno(rs.getInt("bno"));
				board.setSubject(rs.getString("subject"));
				board.setWriter(rs.getString("writer"));
				board.setContent(rs.getString("content"));
				board.setReadcnt(rs.getInt("readcnt"));
				board.setCrtdate(rs.getString("crtdate"));
				boards.add(board);
			}
		} catch (Exception e) {
			System.out.println("SQL실행 실패");
			e.printStackTrace();
		}
		
		return boards;
		
	}
}
