package board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.BoardDAO;
import board.vo.BoardVO;

@Service
public class BoardService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BoardVO> getBoardList(int index, String order, int time) {
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.getBoardList(index, order, time);
	}
}
