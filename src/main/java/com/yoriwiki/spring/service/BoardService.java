package com.yoriwiki.spring.service;

import java.util.List;

import com.yoriwiki.spring.domain.BoardLikeVO;
import com.yoriwiki.spring.domain.BoardMediaVO;
import com.yoriwiki.spring.domain.BoardVO;
import com.yoriwiki.spring.domain.CoCommentVO;
import com.yoriwiki.spring.domain.CommentsVO;
import com.yoriwiki.spring.domain.HashTagVO;
import com.yoriwiki.spring.domain.RecipeVO;
import com.yoriwiki.spring.domain.UploadVO;
import com.yoriwiki.spring.util.Criteria;

public interface BoardService {
	public List<BoardVO> getBoardList();
	public boolean addBoard(RecipeVO rVo);
	public boolean addBoard(BoardVO bVo);
	public boolean addBoardMedia(List<BoardMediaVO> lbmVo);
	public boolean addHashTag(List<HashTagVO> lhtVo);
	public boolean addBoardMedia(BoardMediaVO bmVo);
	public boolean addHashTag(HashTagVO htVo);
	public boolean removeBoard(int boardNum, String adminYn);
	public List<BoardMediaVO> getBoardMediaVO(int boardNum, int gubun);
	public String getHashTagArr(int boardNum);
	public UploadVO getUploadOP(String type);
	
	// 수정 관련
	public boolean modifyBoard(BoardVO bVo);
	public boolean modifyBoardMedia(BoardMediaVO bmVo);
	public boolean removeBoardMedia(int mediaNum);
	public boolean removeBoardHashTag(int boardNum);
	public boolean modifyBoard(RecipeVO rVo);
	
	// 준혁
	public BoardVO getBoard(int boardNum);
	public BoardVO getAdminBoard(int boardNum);
	public List<BoardMediaVO> getBoardMedia(int boardNum, int gubun);
	public List<CommentsVO> getBoardComments(int boardNum);
	public void registerComment(CommentsVO comment);
	public List<HashTagVO> getHashTag(int boardNum);
	public List<CoCommentVO> getCoComment(int boardNum);
	public void registerCoComment(CoCommentVO cocomment);
	public void modifyComment(CommentsVO comment);
	public void removeComment(CommentsVO comment);
	public void modifyCoComment(CoCommentVO cocomment);
	public void removeCoComment(CoCommentVO cocomment);
	public int getBoardLikeCount(int boardNum);
	public int getUserBoardLikeYn(BoardLikeVO boardLike);
	public void boardLikeY(BoardLikeVO boardLike);
	public void boardLikeN(BoardLikeVO boardLike);
	
	
	//수경님
	public List<BoardVO> selectList(BoardVO dto);
	public List<BoardVO> getListByPaging(Criteria cri);
	public int getTotalCount();
	public int getSearchTotalCount(Criteria cri);
	public List<BoardVO> searchListByPaging(Criteria cri);
	
	
}
