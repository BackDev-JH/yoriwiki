package com.yoriwiki.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.yoriwiki.spring.domain.BoardLikeVO;
import com.yoriwiki.spring.domain.BoardMediaVO;
import com.yoriwiki.spring.domain.BoardVO;
import com.yoriwiki.spring.domain.CoCommentVO;
import com.yoriwiki.spring.domain.CommentsVO;
import com.yoriwiki.spring.domain.HashTagVO;
import com.yoriwiki.spring.domain.RecipeVO;
import com.yoriwiki.spring.domain.UserVO;
import com.yoriwiki.spring.service.BoardService;
import com.yoriwiki.spring.util.Criteria;
import com.yoriwiki.spring.util.PageMaker;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/board/*")
@RequiredArgsConstructor
public class BoardController {
	private final BoardService service;

	@Autowired
	ResourceLoader resourceLoader;
	String path = "C:/sts4/workspace/yoriwiki/src/main/resources/static/upload/";

	@PostMapping("remove")
	public String removePost(int boardNum, String adminYn) {
		service.removeBoard(boardNum, adminYn);
		return "redirect:/board/list";
	}

	@GetMapping("modify_redirect")
	public String modifyGetPost(int boardNum, RedirectAttributes rttr) {
		rttr.addFlashAttribute("boardNum", boardNum);
		return "redirect:/board/modify";
	}

	@GetMapping("modify")
	public String modifyPost(Model model, HttpServletRequest request) {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);

		if (flashMap != null) {
			int boardNum = (int) flashMap.get("boardNum");
			BoardVO bVo = service.getBoard(boardNum);
			List<HashTagVO> lhtVo = service.getHashTag(boardNum);
			List<BoardMediaVO> lbmVo_work = service.getBoardMediaVO(boardNum, 0);
			List<BoardMediaVO> lbmVo_step = service.getBoardMediaVO(boardNum, 1);
			List<BoardMediaVO> lbmVo_video = service.getBoardMediaVO(boardNum, 2);
			String tagStr = service.getHashTagArr(boardNum);

			model.addAttribute("bVo", bVo);
			model.addAttribute("lhtVo", lhtVo);
			model.addAttribute("lbmVo_work", lbmVo_work);
			model.addAttribute("lbmVo_step", lbmVo_step);
			model.addAttribute("lbmVo_video", lbmVo_video);
			model.addAttribute("tagStr", tagStr);
			model.addAttribute("picture", service.getUploadOP("picture"));
			model.addAttribute("video", service.getUploadOP("video"));
			return "board/modify";
		}

		return "error";
	}

	@PostMapping("modify")
	public String modifyPost(BoardVO bVo, HttpServletRequest request, Model model) {
		List<BoardMediaVO> lbmVo = new ArrayList<>();
		List<HashTagVO> lhtVo = new ArrayList<>();

		RecipeVO rVo = new RecipeVO();
		rVo.setBoardVo(bVo);
		rVo.setListBoardMediaVo(lbmVo);
		rVo.setListHashTagVo(lhtVo);
		MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;
		Map<String, List<MultipartFile>> map = mrequest.getMultiFileMap();

		// 지운 Step 삭제
		String sdStr = request.getParameter("del_step_photo_list");

		if (sdStr != null && sdStr.trim() != "" && sdStr.length() != 0) {
			sdStr = sdStr.substring(0, sdStr.length() - 1);
			String[] sdList = sdStr.split(",");
			for (int i = 0; i < sdList.length; i++) {
				service.removeBoardMedia(Integer.parseInt(sdList[i]));
			}
		}

		// 경로 가져오기
		int i = 1; // step 파일 저장
		// step
		while (true) {
			BoardMediaVO bmVo = new BoardMediaVO();
			bmVo.setContent(request.getParameterValues("step_text[]")[i - 1]);
			bmVo.setStep(i);
			bmVo.setOrderNo(0);
			bmVo.setPath(path);

			String str = "q_step_file_" + i;
			if (!map.containsKey(str))
				break;

			MultipartFile file = ((MultipartHttpServletRequest) request).getFile(str);
			String mediaNum = request.getParameterValues("step_no[]")[i - 1];
			String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
			bmVo.setFileName(fileName);

			// 수정

			// 파일 저장하기 (레시피 부분)
			if (file != null && !file.isEmpty()) {
				if (mediaNum != null && mediaNum != "" && mediaNum.length() != 0) {
					bmVo.setMediaNum(Integer.parseInt(mediaNum));
					service.modifyBoardMedia(bmVo);
				} else {

					if (mediaNum.length() == 0 || mediaNum == "" || mediaNum == null) {
						lbmVo.add(bmVo);
					}
				}
				try { //
					file.transferTo(new File(path + fileName));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			i++;
		}

		String[] wdArr = request.getParameterValues("del_work_photo[]");
		String[] wNumArr = request.getParameterValues("work_photo[]");

		// 삭제 누른 친구들 삭제
		for (int index = 0; index < wdArr.length; index++) {
			if (wdArr[index] != null && wdArr[index] != "" && wdArr[index].length() != 0 && wNumArr[index] != null
					&& wNumArr[index] != "" && wNumArr[index].length() != 0)
				service.removeBoardMedia(Integer.parseInt(wNumArr[index]));
		}

		// 삭제 안누르고 수정 누른 친구들 삭제
		for (int index = 1; index <= wNumArr.length; index++) {
			String str = "q_work_file_" + index;
			MultipartFile file = ((MultipartHttpServletRequest) request).getFile(str);

			if (file != null && !file.isEmpty()) {
				if (wNumArr[index - 1] != "" && wNumArr[index - 1].length() != 0) {
					service.removeBoardMedia(Integer.parseInt(wNumArr[index - 1]));
				}
			}
		}

		// q_work_file_ (완료) 파일 저장 (완료 사진)
		for (int index = 1; index < 5; index++) {
			String str = "q_work_file_" + index;
			MultipartFile file = ((MultipartHttpServletRequest) request).getFile(str);

			// 파일 저장하기
			if (file != null && !file.isEmpty()) {
				try { // 파일 저장 로직 작성 //

					// 키를 가져옴
					String numstr = "work_photo_" + index;
					numstr = request.getParameter(numstr);
					BoardMediaVO bmVo = new BoardMediaVO();
					String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
					file.transferTo(new File(path + fileName));
					bmVo.setFileName(fileName);
					bmVo.setStep(0);
					bmVo.setOrderNo(index);
					bmVo.setContent("");
					bmVo.setPath(path);

					if (numstr != null && numstr != "" && numstr.length() != 0 && !numstr.equals("0")) {
						bmVo.setBoardNum(Integer.parseInt(numstr));
						service.modifyBoardMedia(bmVo);
					} else
						lbmVo.add(bmVo);

				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		// 동영상 처리
		String mediaNum = request.getParameter("video_photo");
		String new_Video = request.getParameter("new_video_photo");
		String videoSrc = request.getParameter("cok_video_url");
		String delete_Video = request.getParameter("del_video_photo");

		if (delete_Video != null && delete_Video != "" && delete_Video.length() != 0) {
			if (mediaNum != null && mediaNum != "" && mediaNum.length() != 0) {
				service.removeBoardMedia(Integer.parseInt(mediaNum));
			}
		}

		if (videoSrc != "" && videoSrc != null) {
			bVo.setSrc(videoSrc);
		}
		if (new_Video != null || new_Video != "") {
			MultipartFile video = ((MultipartHttpServletRequest) request).getFile("q_video_file"); // 파일 저장하기
			if (video != null && !video.isEmpty()) {
				try { // 파일 저장 로직 작성 //
					String fullName = UUID.randomUUID().toString() + "_" + video.getOriginalFilename();
					video.transferTo(new File(path + fullName));

					BoardMediaVO bmVo = new BoardMediaVO();
					bmVo.setFileName(fullName);
					bmVo.setPath(path);
					bmVo.setStep(-1);
					bmVo.setOrderNo(0);
					bmVo.setContent("");
					lbmVo.add(bmVo);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		// 삭제 해시태그
		service.removeBoardHashTag(bVo.getBoardNum());

		// HASH_TAG 파일 저장
		while (true) {
			String str = request.getParameter("name");
			if (str == null)
				break;
			String[] arr = str.split(",");

			for (String temp : arr) {
				HashTagVO hvo = new HashTagVO();
				hvo.setName(temp);
				lhtVo.add(hvo);
			}
			break;
		}
		service.modifyBoard(rVo);
		return "redirect:/board/board?boardNum=" + rVo.getBoardVo().getBoardNum();
	}

	@GetMapping("register")
	public String getRegiserBoardPage(Model model) {
		model.addAttribute("picture", service.getUploadOP("picture"));
		model.addAttribute("video", service.getUploadOP("video"));
		return "board/register";
	}

	@PostMapping("register")
	public String regiserBoard(BoardVO bVo, HttpServletRequest request) throws IOException {
		List<BoardMediaVO> lbmVo = new ArrayList<>();
		List<HashTagVO> lhtVo = new ArrayList<>();

		RecipeVO rVo = new RecipeVO();
		rVo.setBoardVo(bVo);
		rVo.setListBoardMediaVo(lbmVo);
		rVo.setListHashTagVo(lhtVo);
		UserVO uVo = (UserVO) request.getSession().getAttribute("user");
		bVo.setUserNum(uVo.getUserNum());

		// 경로 가져오기
//		Resource resource = resourceLoader.getResource("classpath:/static/upload/");
//		String path = resource.getURL().getPath(); // 바이너리 데이터 가져오기
		int i = 1; // step 파일 저장
		while (true) {
			String str = "q_step_file_" + i;
			MultipartFile file = ((MultipartHttpServletRequest) request).getFile(str);

			// 파일 저장하기
			if (file != null && !file.isEmpty()) {
				try { //
					String fullName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
					file.transferTo(new File(path + fullName));

					BoardMediaVO bmVo = new BoardMediaVO();
					bmVo.setContent(request.getParameterValues("step_text[]")[i - 1]);
					bmVo.setFileName(fullName);
					bmVo.setPath(path);
					bmVo.setStep(i);
					bmVo.setOrderNo(0);
					lbmVo.add(bmVo);
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				break;
			}
			i++;
		}

		// q_work_file_ (완료) 파일 저장
		for (int index = 1; index < 5; index++) {
			String str = "q_work_file_" + index;
			MultipartFile file = ((MultipartHttpServletRequest) request).getFile(str);

			// 파일 저장하기
			if (file != null && !file.isEmpty()) {
				try { // 파일 저장 로직 작성 //
					String fullName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
					file.transferTo(new File(path + fullName));

					BoardMediaVO bmVo = new BoardMediaVO();
					bmVo.setFileName(fullName);
					bmVo.setPath(path);
					bmVo.setStep(0);
					bmVo.setOrderNo(index);
					bmVo.setContent("");
					lbmVo.add(bmVo);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		// 동영상 처리
		MultipartFile video = ((MultipartHttpServletRequest) request).getFile("q_video_file"); // 파일 저장하기
		if (video != null && !video.isEmpty()) {
			try { // 파일 저장 로직 작성 //
				String fullName = UUID.randomUUID().toString() + "_" + video.getOriginalFilename();
				video.transferTo(new File(path + fullName));

				BoardMediaVO bmVo = new BoardMediaVO();
				bmVo.setFileName(fullName);
				bmVo.setPath(path);
				bmVo.setStep(-1);
				bmVo.setOrderNo(0);
				bmVo.setContent("");
				lbmVo.add(bmVo);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// HASH_TAG 파일 저장
		while (true) {
			String str = request.getParameter("name");
			if (str == null)
				break;
			String[] arr = str.split(",");

			for (String temp : arr) {
				HashTagVO hvo = new HashTagVO();
				hvo.setName(temp);
				lhtVo.add(hvo);
			}
			break;
		}
		service.addBoard(rVo);
		return "redirect:/board/board?boardNum=" + rVo.getBoardVo().getBoardNum();
	}

	@GetMapping("read")
	public String getReadBoardPage(int boardNum) {
		return "board/read";
	}

	//////////////////////////
	/////////// 준혁///////////
	//////////////////////////
	@GetMapping("board")
	public String showBoard(int boardNum, Model model, HttpSession session) {
		BoardVO boardVO = service.getBoard(boardNum);
		List<BoardMediaVO> boardImg = service.getBoardMedia(boardNum, 0);
		List<BoardMediaVO> step = service.getBoardMedia(boardNum, 1);
		List<BoardMediaVO> boardVideo = service.getBoardMedia(boardNum, 2);
		BoardLikeVO boardLike = new BoardLikeVO();

		UserVO uVo = (UserVO) session.getAttribute("user");
		if (uVo == null) {
			uVo = new UserVO();
			uVo.setUserNum(0);
			session.setAttribute("user", uVo);
		}

		boardLike.setBoardNum(boardNum);
		boardLike.setUserNum(uVo.getUserNum());

		if (boardVO.getSrc() != null) {
			String url = boardVO.getSrc().replace("watch?v=", "embed/");
			boardVO.setSrc(url);
		}

		List<CommentsVO> commentsVO = service.getBoardComments(boardNum);
		List<HashTagVO> hashTagVO = service.getHashTag(boardNum);
		List<CoCommentVO> cocoVO = service.getCoComment(boardNum);
		int boardLikeCount = service.getBoardLikeCount(boardNum);
		int userLikeYn = service.getUserBoardLikeYn(boardLike);

		model.addAttribute("boardImg", boardImg);
		model.addAttribute("step", step);
		model.addAttribute("boardVideo", boardVideo);
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("commentsVO", commentsVO);
		model.addAttribute("hashTagVO", hashTagVO);
		model.addAttribute("cocoVO", cocoVO);
		model.addAttribute("boardLikeCount", boardLikeCount);
		model.addAttribute("userLikeYn", userLikeYn);

		return "board/board";
	}

	@GetMapping("admin")
	public String showAdminBoard(int boardNum, Model model, HttpSession session) {
		BoardVO boardVO = service.getAdminBoard(boardNum);

		List<BoardMediaVO> boardImg = service.getBoardMedia(boardNum, 0);
		List<BoardMediaVO> step = service.getBoardMedia(boardNum, 1);
		List<BoardMediaVO> boardVideo = service.getBoardMedia(boardNum, 2);
		BoardLikeVO boardLike = new BoardLikeVO();
		UserVO uVo = (UserVO) session.getAttribute("user");
		boardLike.setBoardNum(boardNum);
		boardLike.setUserNum(uVo.getUserNum());

		if (boardVO.getSrc() != null) {
			String url = boardVO.getSrc().replace("watch?v=", "embed/");
			boardVO.setSrc(url);
		}

		List<CommentsVO> commentsVO = service.getBoardComments(boardNum);
		List<HashTagVO> hashTagVO = service.getHashTag(boardNum);
		List<CoCommentVO> cocoVO = service.getCoComment(boardNum);
		int boardLikeCount = service.getBoardLikeCount(boardNum);
		int userLikeYn = service.getUserBoardLikeYn(boardLike);

		model.addAttribute("boardImg", boardImg);
		model.addAttribute("step", step);
		model.addAttribute("boardVideo", boardVideo);
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("commentsVO", commentsVO);
		model.addAttribute("hashTagVO", hashTagVO);
		model.addAttribute("cocoVO", cocoVO);
		model.addAttribute("boardLikeCount", boardLikeCount);
		model.addAttribute("userLikeYn", userLikeYn);
		model.addAttribute("admin", "Yes");

		return "board/board";
	}

	@PostMapping("comment/register")
	public String registerComments(CommentsVO comments) {

		service.registerComment(comments);

		return "redirect:/board/board?boardNum=" + comments.getBoardNum();
	}

	@PostMapping("cocomment/register")
	public String registerCoComment(CoCommentVO cocomment, int boardNum) {

		service.registerCoComment(cocomment);

		return "redirect:/board/board?boardNum=" + boardNum;
	}

	@PostMapping("comment/modify")
	public String modifyComment(CommentsVO comments) {

		service.modifyComment(comments);

		return "redirect:/board/board?boardNum=" + comments.getBoardNum();

	}

	@PostMapping("comment/remove")
	public String removeComment(CommentsVO comments) {

		service.removeComment(comments);
		return "redirect:/board/board?boardNum=" + comments.getBoardNum();
	}

	@PostMapping("cocomment/modify")
	public String modifyCoComment(CoCommentVO cocomment, int boardNum) {

		service.modifyCoComment(cocomment);
		return "redirect:/board/board?boardNum=" + boardNum;
	}

	@PostMapping("cocomment/remove")
	public String removeCoComment(CoCommentVO cocomment, int boardNum) {

		service.removeCoComment(cocomment);
		return "redirect:/board/board?boardNum=" + boardNum;
	}

	@PostMapping("board/like")
	@ResponseBody
	public int boardLike(@RequestParam("like") int like, @RequestParam("userNum") int userNum,
			@RequestParam("boardNum") int boardNum) {
		BoardLikeVO boardLike = new BoardLikeVO();
		boardLike.setUserNum(userNum);
		boardLike.setBoardNum(boardNum);

		if (like == 0) {
			service.boardLikeY(boardLike);
		} else {
			service.boardLikeN(boardLike);
		}
		int likeCount = service.getBoardLikeCount(boardNum);

		return likeCount;
	}

	////////////////////////////////////////////////
	////////////////////// 수경///////////////////////
	////////////////////////////////////////////////
	@GetMapping("list")
	public String GetList(Criteria cri, Model model, BoardVO dto, UserVO udto, HttpServletRequest request) {
		int totalCount = service.getSearchTotalCount(cri);
		PageMaker pageMaker = new PageMaker(cri, totalCount);

		log.info("카테고리 출력:" + request.getAttribute("category"));

		model.addAttribute("cri", cri);
		model.addAttribute("list", service.searchListByPaging(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("startPage", pageMaker.getStartPage());
		model.addAttribute("endPage", pageMaker.getEndPage());
		return "board/list";
	}

	@GetMapping("list/search")
	public String GetList1(Criteria cri, Model model, BoardVO dto, UserVO udto) {
		log.info("list - " + cri);
		log.info("키워드: " + cri.getKeyword() + "    타입: " + cri.getType());

		if (cri.getType().equals("name")) {
			cri.setKeyword(cri.getName());
		}

		int totalCount = service.getSearchTotalCount(cri);
		PageMaker pageMaker = new PageMaker(cri, totalCount);

		log.info("pageMaker" + pageMaker);
		log.info("totalCount" + totalCount);

		cri.setPageNum(1);
		model.addAttribute("cri", cri);
		model.addAttribute("list", service.searchListByPaging(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("startPage", pageMaker.getStartPage());
		model.addAttribute("endPage", pageMaker.getEndPage());

		if (cri.getType().equals("name")) {
			cri.setKeyword("");
		}

		/* List<BoardVO> boardList = service.selectList(dto); */
		/* model.addAttribute("list",boardList); */

		return "board/list";
	}

}
