package board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.service.BoardService;
import board.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;

	@RequestMapping("/board.do")
	public String board(@RequestParam("index") int index, @RequestParam("order") String order, @RequestParam("time") int time,
			HttpServletRequest request) {
	    
		List<BoardVO> list = boardService.getBoardList(index, order, time);
		request.setAttribute("list", list);
	    
		if (index == 0)
			return "board";
		else
			return "boardAdd";
	}
}
