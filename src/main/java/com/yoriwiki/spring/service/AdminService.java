package com.yoriwiki.spring.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yoriwiki.spring.domain.BoardVO;
import com.yoriwiki.spring.util.Criteria;

public interface AdminService {
	List<BoardVO> getReserveExcel(BoardVO searchVO);
	void getReserveExcel(BoardVO searchVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public List<BoardVO> selectList(BoardVO dto);	
	public List<BoardVO> getListByPaging(Criteria cri);
	public int getSearchTotalCount(Criteria cri);
	public List<BoardVO> searchListByPaging(Criteria cri);
	public boolean removePost(int boardNum);
	public boolean modifyPost(int boardNum);
	
}
