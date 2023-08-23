package com.yoriwiki.spring.persistence;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yoriwiki.spring.domain.BoardVO;
import com.yoriwiki.spring.util.Criteria;


@Mapper
public interface AdminMapper {
	List<BoardVO> getReserveExcel(BoardVO searchVO);
	public int selectTotalCount();
	public List<BoardVO> getListByPaging(Criteria cri);
	public List<BoardVO> selectList();
	public List<BoardVO> selectlist(BoardVO dto);
	public List<BoardVO> searchListByPaging(Criteria cri);
	public int searchTotalCount(Criteria cri);
	public int deletePost(int boardNum);
	public int updatePost(int boardNum);
}
