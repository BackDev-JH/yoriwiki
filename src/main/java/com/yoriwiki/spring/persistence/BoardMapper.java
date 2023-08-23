package com.yoriwiki.spring.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.yoriwiki.spring.domain.BoardLikeVO;
import com.yoriwiki.spring.domain.BoardMediaVO;
import com.yoriwiki.spring.domain.BoardVO;
import com.yoriwiki.spring.domain.CoCommentVO;
import com.yoriwiki.spring.domain.CommentsVO;
import com.yoriwiki.spring.domain.HashTagVO;
import com.yoriwiki.spring.domain.UploadVO;

@Mapper
public interface BoardMapper {
	// BoardVO 관련 Mapper
	public List<BoardVO> selectList();
	public int insertBoard(BoardVO bVo);
	//public int updateBoard(BoardMediaVO bVo);
	public int deleteBoard(@Param("boardNum") int boardNum, @Param("adminYn") String adminYn);

	// BoardMediaVO 관련 Mapper
	public int insertBoardMedia(BoardMediaVO bmVo);

	// HashTagVO 관련 Mapper
	public int insertHashTag(HashTagVO htVo);
	
	// 수정 관련 Mapper
	public List<BoardMediaVO> selectBoardFile(BoardMediaVO bmVo);
	public String selectBoardHashTag(int boardNum);
	public int updateBoard(BoardVO bVo);
	public int updateBoardMedia(BoardMediaVO bmVo);
	public int deleteBoardMedia(int mediaNum);
	public int deleteBoardHashTag(int boardNum);
	public UploadVO selectUploadOP(String type);
	
	
	// 준혁이꺼
	public BoardVO selectBoard(int boardNum);
	public List<BoardMediaVO> selectBoardMedia(BoardMediaVO boardVO);
	public List<CommentsVO> selectBoardComment(int boardNum);
	public void insertComment(CommentsVO comment);
	public List<HashTagVO> selectHashTag(int boardNum);
	public List<CoCommentVO> selectCoComment(int boardNum);
	public void insertCoComment(CoCommentVO cocomment);
	public void modifyComment(CommentsVO comment);
	public void removeComment(CommentsVO comment);
	public void modifyCoComment(CoCommentVO cocomment);
	public void removeCoComment(CoCommentVO cocomment);
	public int selectBoardLikeCount(int boardNum);
	public int selectUserBoardLikeYn(BoardLikeVO boardLike);
	public void boardLikeY(BoardLikeVO boardLike);
	public void boardLikeN(BoardLikeVO boardLike);
}
