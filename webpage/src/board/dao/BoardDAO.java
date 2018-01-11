package board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import board.vo.BoardVO;

public interface BoardDAO {
	public List<BoardVO> getBoardList(@Param("index") int index, @Param("order") String order, @Param("time") int time);
}
