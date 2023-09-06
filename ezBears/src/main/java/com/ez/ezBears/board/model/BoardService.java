package com.ez.ezBears.board.model;

import java.util.List;
import java.util.Map;

import com.ez.ezBears.common.MyBoardSearchVo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.temNotice.model.TeamNoticeVO;

public interface BoardService {
	List<Map<String, Object>> selectAllBoard(MyBoardSearchVo searchVo);
	int selectTotalCount(SearchVO serarchVo);
	int insertBoard(BoardVO boardVo);
	int randomNum(int randomNo);
	List<Map<String, Object>> boardAll();
	int checkExistingRandomId(String randomId);
	int insertFileBoard(List<Map<String, Object>> files, int boardNo);
	int updateDowncount(int boardFileNo);
	List<Map<String, Object>> nextPage(int boardNo);
	Map<String, Object> selectDetail(int boardNo);
	List<Map<String, Object>> selectBoardList(int boardNo);
	List<Map<String, Object>> selectBoardFile(int boardNo);
	void deleteBoardFile(int boardNo);
	int deleteBoard(int boardNo);
	List<Map<String, Object>> selectboardFileByNo(int boardNo);
	int updateboard(BoardVO boardVo);
	
	int Reply(BoardVO boardVo);
	List<Map<String, Object>> selectReply(MyBoardSearchVo searchVo);
	int selectReplyTotalCount(int groupNo);
	
	List<Map<String, Object>> boardWriteAll();
	int checkExistingWriteId(String randomWrite);
	
	BoardVO selectReplyBoardNo(int boardNo);
	int updeteReply(BoardVO boardVo);
	
	int deleteReply(int boardNo);
	
	int ReReply(BoardVO boardVo);
	
}
