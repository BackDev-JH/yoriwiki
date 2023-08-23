package com.yoriwiki.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yoriwiki.spring.domain.BoardLikeVO;
import com.yoriwiki.spring.domain.BoardMediaVO;
import com.yoriwiki.spring.domain.BoardVO;
import com.yoriwiki.spring.domain.CoCommentVO;
import com.yoriwiki.spring.domain.CommentsVO;
import com.yoriwiki.spring.domain.HashTagVO;
import com.yoriwiki.spring.domain.RecipeVO;
import com.yoriwiki.spring.domain.UploadVO;
import com.yoriwiki.spring.persistence.BoardListMapper;
import com.yoriwiki.spring.persistence.BoardMapper;
import com.yoriwiki.spring.util.Criteria;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	private final BoardMapper mapper;
	private final BoardListMapper mapper2;
	
	@Override
	public List<BoardVO> getBoardList() {
		return mapper.selectList();
	}

	@Override
	public boolean addBoard(RecipeVO rVo) {
		boolean check = true;

		check = mapper.insertBoard(rVo.getBoardVo()) > 0 ? true : false;

		int boardNum = rVo.getBoardVo().getBoardNum();
		for (int i = 0; i < rVo.getListBoardMediaVo().size(); i++) {
			rVo.getListBoardMediaVo().get(i).setBoardNum(boardNum);
		}

		for (int i = 0; i < rVo.getListHashTagVo().size(); i++) {
			rVo.getListHashTagVo().get(i).setBoardNum(boardNum);
		}

		check = addBoardMedia(rVo.getListBoardMediaVo());
		check = addHashTag(rVo.getListHashTagVo());

		return check;
	}
	
	@Override
	public boolean modifyBoard(RecipeVO rVo) {
		boolean check = true;

		check = mapper.updateBoard(rVo.getBoardVo()) > 0 ? true : false;

		int boardNum = rVo.getBoardVo().getBoardNum();
		for (int i = 0; i < rVo.getListBoardMediaVo().size(); i++) {
			rVo.getListBoardMediaVo().get(i).setBoardNum(boardNum);
		}

		for (int i = 0; i < rVo.getListHashTagVo().size(); i++) {
			rVo.getListHashTagVo().get(i).setBoardNum(boardNum);
		}

		check = addBoardMedia(rVo.getListBoardMediaVo());
		check = addHashTag(rVo.getListHashTagVo());
		return check;
	}

	@Override
	public boolean addBoard(BoardVO bVo) {
		return mapper.insertBoard(bVo) > 0;
	}

	@Override
	public boolean addBoardMedia(List<BoardMediaVO> lbmVo) {
		boolean check = true;

		for (BoardMediaVO bmVo : lbmVo)
			if (mapper.insertBoardMedia(bmVo) == 0) {
				check = false;
				break;
			}

		return check;
	}

	@Override
	public boolean addHashTag(List<HashTagVO> lhtVo) {
		boolean check = true;

		for (HashTagVO htVo : lhtVo) {
			if (mapper.insertHashTag(htVo) == 0) {
				check = false;
				break;
			}
		}
		return check;
	}

	@Override
	public boolean addBoardMedia(BoardMediaVO bmVo) {
		return mapper.insertBoardMedia(bmVo) > 0;
	}

	@Override
	public boolean addHashTag(HashTagVO htVo) {
		return mapper.insertHashTag(htVo) > 0;
	}

	@Override
	public boolean removeBoard(int boardNum, String adminYn) {
		return mapper.deleteBoard(boardNum, adminYn) > 0;
	}

	@Override
	public List<BoardMediaVO> getBoardMediaVO(int boardNum, int gubun) {
		BoardMediaVO bmVo = new BoardMediaVO();
		bmVo.setBoardNum(boardNum);
		bmVo.setGubun(gubun);
		return mapper.selectBoardFile(bmVo);
	}

	@Override
	public String getHashTagArr(int boardNum) {
		return mapper.selectBoardHashTag(boardNum);
	}

	////////////////////////////////////////////////
	//////////////////// 수정관련 //////////////////////
	////////////////////////////////////////////////
	@Override
	public boolean modifyBoard(BoardVO bVo) {
		return mapper.updateBoard(bVo) > 0;
	}

	@Override
	public boolean modifyBoardMedia(BoardMediaVO bmVo) {
		return mapper.updateBoardMedia(bmVo) > 0;
	}

	@Override
	public boolean removeBoardMedia(int mediaNum) {
		return mapper.deleteBoardMedia(mediaNum) > 0;
	}

	@Override
	public boolean removeBoardHashTag(int boardNum) {
		return mapper.deleteBoardHashTag(boardNum) > 0;
	}
	
	@Override
	public UploadVO getUploadOP(String type) {
		return mapper.selectUploadOP(type);
		
	}

	////////////////////////////////////////////////
	// 준혁 //
	////////////////////////////////////////////////
	@Override
	public BoardVO getBoard(int boardNum) {
		mapper2.updateHit(boardNum);
		return mapper.selectBoard(boardNum);
	}
	
	@Override
	public BoardVO getAdminBoard(int boardNum) {
		return mapper.selectBoard(boardNum);
	}

	@Override
	public List<BoardMediaVO> getBoardMedia(int boardNum, int gubun) {
		
		BoardMediaVO boardVO = new BoardMediaVO();
		boardVO.setBoardNum(boardNum);
		boardVO.setGubun(gubun);
		
		return mapper.selectBoardMedia(boardVO);
	}

	@Override
	public List<CommentsVO> getBoardComments(int boardNum) {
		
		return mapper.selectBoardComment(boardNum);
	}

	@Override
	public void registerComment(CommentsVO comment) {
		mapper.insertComment(comment);
	}

	@Override
	public List<HashTagVO> getHashTag(int boardNum) {
		return mapper.selectHashTag(boardNum);
	}

	@Override
	public List<CoCommentVO> getCoComment(int boardNum) {
		return mapper.selectCoComment(boardNum);
	}

	@Override
	public void registerCoComment(CoCommentVO cocomment) {
		mapper.insertCoComment(cocomment);
	}

	@Override
	public void modifyComment(CommentsVO comment) {

		mapper.modifyComment(comment);
	}

	@Override
	public void removeComment(CommentsVO comment) {

		mapper.removeComment(comment);
	}

	@Override
	public void modifyCoComment(CoCommentVO cocomment) {

		mapper.modifyCoComment(cocomment);
	}

	@Override
	public void removeCoComment(CoCommentVO cocomment) {

		mapper.removeCoComment(cocomment);
	}

	@Override
	public int getBoardLikeCount(int boardNum) {
		return mapper.selectBoardLikeCount(boardNum);
	}

	@Override
	public int getUserBoardLikeYn(BoardLikeVO boardLike) {
		return mapper.selectUserBoardLikeYn(boardLike);
	}

	@Override
	public void boardLikeY(BoardLikeVO boardLike) {
		mapper.boardLikeY(boardLike);
	}

	@Override
	public void boardLikeN(BoardLikeVO boardLike) {
		mapper.boardLikeN(boardLike);
	}
	
	//ㅅㄱ
	@Override
	public List<BoardVO> selectList(BoardVO dto) {
		return mapper2.selectlist(dto);
	}

	@Override
	public int getTotalCount() {
		return mapper2.selectTotalCount();
	}

	@Override
	public List<BoardVO> getListByPaging(Criteria cri) {
		return mapper2.getListByPaging(cri);
	}
	
	@Override
	public List<BoardVO> searchListByPaging(Criteria cri) {
		return mapper2.searchListByPaging(cri);
	}

	@Override
	public int getSearchTotalCount(Criteria cri) {
		return mapper2.searchTotalCount(cri);
	}
	
	

}
