package com.lec.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.action.Action;
import com.lec.board.action.BoardDeleteAction;
import com.lec.board.action.BoardDeleteFormAction;
import com.lec.board.action.BoardDetailAction;
import com.lec.board.action.BoardListAction;
import com.lec.board.action.BoardModifyAction;
import com.lec.board.action.BoardModifyFormAction;
import com.lec.board.action.BoardReplyAction;
import com.lec.board.action.BoardReplyFormAction;
import com.lec.board.action.BoardModifyAction;
import com.lec.board.action.BoardWriteAction;
import com.lec.board.vo.ActionForward;

@WebServlet("*.bo")
public class BoardController extends HttpServlet {

	Action action = null;
	ActionForward forward = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		process(req, res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		process(req, res);
	}

	public void process(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String p = req.getParameter("p");
		String f = req.getParameter("f");
		String q = req.getParameter("q");
		String fn = req.getParameter("fn");
		
		// http://localhost:8088/jsp09_board/boardWriteForm.bo
		String requestURI = req.getRequestURI();   // /jsp09_board/boardWriteForm.bo
		String contextPath = req.getContextPath(); // /jsp09_board
		String command = requestURI.substring(contextPath.length()); // /boardWriteForm.bo
		// System.out.println(requestURI + "\n" + contextPath + "\n" + command);
		
		// 글목록, 글삭제, 글수정, 댓글,....
		if(command.equalsIgnoreCase("/boardWriteForm.bo")) {
			forward = new ActionForward();
			forward.setPath("/board/board_write.jsp");
		} else if(command.equalsIgnoreCase("/boardWrite.bo")) {
			action = new BoardWriteAction();
			forward = action.execute(req, res);
		} else if(command.equalsIgnoreCase("/boardList.bo")) {
			action = new BoardListAction();
			forward = action.execute(req, res);
		} else if(command.equalsIgnoreCase("/boardDetail.bo")) {
			 action = new BoardDetailAction();
			 forward = action.execute(req, res);
		} else if(command.equalsIgnoreCase("/boardModifyForm.bo")) {
			 action = new BoardModifyFormAction();
			 forward = action.execute(req, res);
		} else if(command.equalsIgnoreCase("/boardModify.bo")) {
			action = new BoardModifyAction();
			forward = action.execute(req, res);
		} else if(command.equalsIgnoreCase("/boardDeleteForm.bo")) {
			action = new BoardDeleteFormAction();
			forward = action.execute(req, res);
		} else if(command.equalsIgnoreCase("/boardDelete.bo")) {
			action = new BoardDeleteAction();
			forward = action.execute(req, res);
		} else if(command.equals("/boardReplyForm.bo")) {
			action = new BoardReplyFormAction();
			forward = action.execute(req, res);
		} else if(command.equals("/boardReply.bo")) {
			action = new BoardReplyAction();
			forward = action.execute(req, res);
		} else if(command.equals("/download.bo")) {
			forward = new ActionForward();
			forward.setPath("/board/board_download.jsp?p=" + p);
		}
		
// 		 회원 등록,수정,삭제...
		
		if(command.equalsIgnoreCase("/memberregisterForm.bo")) {
			forward = new ActionForward();
			forward.setPath("/board/board_write.jsp");
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				res.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, res);							
			}
		}
	}
}

















