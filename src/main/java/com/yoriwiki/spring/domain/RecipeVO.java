package com.yoriwiki.spring.domain;

import java.util.List;

import lombok.Data;

@Data
public class RecipeVO {
	private BoardVO boardVo;
	private List<BoardMediaVO> listBoardMediaVo;
	private List<HashTagVO> listHashTagVo;
}
