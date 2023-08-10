package com.lec.web.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.lec.web.dao.MessageDAO;
import com.lec.web.jdbc.ConnectionProvider;
import com.lec.web.jdbc.JDBCUtil;
import com.lec.web.model.Message;

public class GetMessageListService {
	
	// sigleton
	private GetMessageListService() {}
	private static GetMessageListService instance = new GetMessageListService();
	public static GetMessageListService getInstance() { return instance; }
	
	public List<Message> getMessageList() {
	
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			MessageDAO messageDAO = MessageDAO.getInstance();
			
			List<Message> messageList = null;
			messageList = messageDAO.selectList(conn, 0, 10);	
			
			
			
			
			return messageList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, null, null);
		}
		return null;
	}
	
}
