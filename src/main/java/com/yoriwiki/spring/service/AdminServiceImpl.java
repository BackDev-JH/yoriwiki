package com.yoriwiki.spring.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoriwiki.spring.domain.BoardVO;
import com.yoriwiki.spring.persistence.AdminMapper;
import com.yoriwiki.spring.util.Criteria;



@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper mapper;

	private void setHeaderCS(CellStyle cs, Font font, Cell cell) {
		  cs.setAlignment(CellStyle.ALIGN_CENTER);
		  cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		  cs.setBorderTop(CellStyle.BORDER_THIN);
		  cs.setBorderBottom(CellStyle.BORDER_THIN);
		  cs.setBorderLeft(CellStyle.BORDER_THIN);
		  cs.setBorderRight(CellStyle.BORDER_THIN);
		  cs.setFillForegroundColor(HSSFColor.GREY_80_PERCENT.index);
		  cs.setFillPattern(CellStyle.SOLID_FOREGROUND);
		  setHeaderFont(font, cell);
		  cs.setFont(font);
		  cell.setCellStyle(cs);
		}
		 
		private void setHeaderFont(Font font, Cell cell) {
		  font.setBoldweight((short) 700);
		  font.setColor(HSSFColor.WHITE.index);
		}
		 
		private void setCmmnCS2(CellStyle cs, Cell cell) {
		  cs.setAlignment(CellStyle.ALIGN_LEFT);
		  cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		  cs.setBorderTop(CellStyle.BORDER_THIN);
		  cs.setBorderBottom(CellStyle.BORDER_THIN);
		  cs.setBorderLeft(CellStyle.BORDER_THIN);
		  cs.setBorderRight(CellStyle.BORDER_THIN);
		  cell.setCellStyle(cs);
		}
		 
		 
		@Override
		public void getReserveExcel(BoardVO searchVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<BoardVO> list = getReserveExcel(searchVO);
		  
		 SXSSFWorkbook wb = new SXSSFWorkbook();
		  Sheet sheet = wb.createSheet();
		  sheet.setColumnWidth((short) 0, (short) 3000);
		  sheet.setColumnWidth((short) 1, (short) 2000);
		  sheet.setColumnWidth((short) 2, (short) 2000);
		  sheet.setColumnWidth((short) 3, (short) 3000);
		  sheet.setColumnWidth((short) 4, (short) 8000);
		  sheet.setColumnWidth((short) 5, (short) 4000);
		  sheet.setColumnWidth((short) 6, (short) 3000);
		  sheet.setColumnWidth((short) 7, (short) 5000);
		  sheet.setColumnWidth((short) 8, (short) 5000);
		  sheet.setColumnWidth((short) 9, (short) 5000);
		  sheet.setColumnWidth((short) 10, (short) 12000);
		  sheet.setColumnWidth((short) 11, (short) 2000);
		  sheet.setColumnWidth((short) 12, (short) 3000);
		  sheet.setColumnWidth((short) 13, (short) 5000);
		  sheet.setColumnWidth((short) 14, (short) 5000);
		  
		  Row row = sheet.createRow(0);
		  Cell cell = null;
		  CellStyle cs = wb.createCellStyle();
		  Font font = wb.createFont();
		  cell = row.createCell(0);
		  cell.setCellValue("이력 관리 - 삭제게시물 리스트");
		  setHeaderCS(cs, font, cell);
		  sheet.addMergedRegion(new CellRangeAddress(row.getRowNum(), row.getRowNum(), 0, 14));
		  
		  row = sheet.createRow(1);
		  cell = null;
		  cs = wb.createCellStyle();
		  font = wb.createFont(); 		  
		 
		  cell = row.createCell(0);
		  cell.setCellValue("게시물 번호");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(1);
		  cell.setCellValue("유저 번호");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(2);
		  cell.setCellValue("카테고리");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(3);
		  cell.setCellValue("게시글 제목");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(4);
		  cell.setCellValue("요리 소개");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(5);
		  cell.setCellValue("요리 시간");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(6);
		  cell.setCellValue("요리 난이도");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(7);
		  cell.setCellValue("소스");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(8);
		  cell.setCellValue("재료");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(9);
		  cell.setCellValue("선택 재료");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(10);
		  cell.setCellValue("경로");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(11);
		  cell.setCellValue("조회수");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(12);
		  cell.setCellValue("삭제여부");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(13);
		  cell.setCellValue("게시글 등록일");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(14);
		  cell.setCellValue("게시글 수정일");
		  setHeaderCS(cs, font, cell);	    
		 
		  int i = 2;
		  int ii = list.size();
		  for (BoardVO vo : list) {
		      
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//String cretDate = sdf.format(vo.get());
		 
		  row = sheet.createRow(i);
		  cell = null;
		  cs = wb.createCellStyle();
		  font = wb.createFont(); 
		  		  
		  cell = row.createCell(0);
		  cell.setCellValue(vo.getBoardNum());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(1);
		  cell.setCellValue(vo.getUserNum());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(2);
		  cell.setCellValue(vo.getCategory());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(3);
		  cell.setCellValue(vo.getTitle());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(4);
		  cell.setCellValue(vo.getIntroduce());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(5);
		  cell.setCellValue(vo.getTime());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(6);
		  cell.setCellValue(vo.getDiff());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(7);
		  cell.setCellValue(vo.getSource());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(8);
		  cell.setCellValue(vo.getIngre());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(9);
		  cell.setCellValue(vo.getChoiceIngre());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(10);
		  cell.setCellValue(vo.getSrc());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(11);
		  cell.setCellValue(vo.getHit());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(12);
		  cell.setCellValue(vo.getYna());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(13);
		  cell.setCellValue(vo.getRegDt());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(14);
		  cell.setCellValue(vo.getModDt());
		  setCmmnCS2(cs, cell);
		  
		  i++;
		  ii--;
		}
		  
		  response.setHeader("Set-Cookie", "fileDownload=true; path=/");
		  response.setHeader("Content-Disposition", String.format("attachment; filename=\"YoriWikiDelete.xlsx\""));
		  wb.write(response.getOutputStream());
		 
		}

		@Override
		public List<BoardVO> getReserveExcel(BoardVO searchVO) {
			
			return mapper.getReserveExcel(searchVO);
		}

		@Override
		public List<BoardVO> selectList(BoardVO dto) {
			return mapper.selectlist(dto);
		}		

		@Override
		public int getSearchTotalCount(Criteria cri) {
			return mapper.searchTotalCount(cri);
		}


		@Override
		public List<BoardVO> searchListByPaging(Criteria cri) {
			return mapper.searchListByPaging(cri);
		}

		@Override
		public List<BoardVO> getListByPaging(Criteria cri) {
			return mapper.getListByPaging(cri);
		}

		@Override
		public boolean removePost(int boardNum) {
			return mapper.deletePost(boardNum) > 0;
		}
		
		@Override
		public boolean modifyPost(int boardNum) {
			return mapper.updatePost(boardNum) > 0;
		}
}
