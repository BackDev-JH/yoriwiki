package com.yoriwiki.spring.controller;

import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yoriwiki.spring.domain.KakaoUserInfo;
import com.yoriwiki.spring.domain.UserVO;
import com.yoriwiki.spring.service.KakaoService;
import com.yoriwiki.spring.service.LoginService;
import com.yoriwiki.spring.service.SignUpService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	@Autowired
	private SignUpService service1;
	
	@Autowired
	private KakaoService kakaoService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private PasswordEncoder pwEncoder;
	
	
	@GetMapping("")
	public String login(UserVO vo) {
		
        return "login";
        
	}
	
	@PostMapping("/login.do")
    public String login(Model model, UserVO vo, RedirectAttributes redirectAttributes,HttpSession session) {
        
        
        String rawPw = "";
        String encodePw = "";
        log.info(vo);
        
        UserVO user = service.logincount(vo);
        
        if (user != null) {
        	rawPw = vo.getUser_login_password();
        	encodePw = user.getUserPassword();
        	System.out.println("로그인한 비밀번호 : " + rawPw);
        	System.out.println("db에 있는 비밀번호 : " + encodePw);
        	if(true == pwEncoder.matches(rawPw, encodePw)) {
        		user.setUserPassword("");    // 인코딩된 비밀번호 정보 지움
                session.setAttribute("user", user);    // session에 사용자 정보 저장
            	System.out.println("여기 드러옴!~");
            	System.out.println("세션에실린 :" +user);
                return "redirect:/board/list";
        	}else{
        		model.addAttribute("message", "비밀번호를 확인하세요");
                System.out.println("여기 드러옴 비밀번호 fail!~");
                return "login";        		
        	}
        }
//            session.setAttribute("user", user);
//            System.out.println("user =" + user);
//            return "redirect:/admin";
	        else{
	        	model.addAttribute("message", "아이디를 확인하세요");
	            System.out.println("여기 드러옴 아이디 fail!~");
	            return "login";
	        }
        
        
        
    }
        
    
    @GetMapping("kakao")
    public String kakaoLogin(@RequestParam("code") String code, HttpSession session, RedirectAttributes redirectAttributes) {
        try {
            // 인가코드를 사용하여 액세스 토큰 발급 받기
        	System.out.println("===========================");
        	System.out.println(code);
            String accessToken = kakaoService.getAccessToken(code);            
            if (accessToken == null) {
            	System.out.println("=================1==========");
                redirectAttributes.addFlashAttribute("loginFailed", true);
                return "redirect:/login";
            }
            
            // 액세스 토큰을 사용하여 사용자 정보 받아오기
            KakaoUserInfo userInfo = kakaoService.getUserInfo(accessToken);
            if (userInfo == null) {
            	System.out.println("==============2=============");
                redirectAttributes.addFlashAttribute("loginFailed", true);
                return "redirect:/login";
            }
            
            // 카카오 로그인으로 인증된 사용자의 이메일이 이미 등록되어 있는 경우 로그인 처리
            System.out.println("여기1");
            UserVO user = service.getUserByEmail(userInfo.getEmail());
            if (user != null) {
            	System.out.println("===========3================");
                session.setAttribute("user", user);
                System.out.println("user : " + user);
                log.info(user);
                return "redirect:/board/list";
            }
            
            // 카카오 로그인으로 인증된 사용자가 처음 가입하는 경우 자동으로 회원가입 처리 
                        
            System.out.println("여기!!");
            String email = userInfo.getEmail().toString();
            
            //비밀번호 시큐리티
            String rawPw = "1234";
            String encodePw = pwEncoder.encode(rawPw); 
            
            UserVO newUser = new UserVO();       
            String userId = email.split("@")[0];     
        	
            newUser.setUserEmail(userInfo.getEmail());            
            System.out.println("==================4=========");
            newUser.setUserId(userId);
            newUser.setUserPassword(encodePw); // 비밀번호는 임의로 지정
            newUser.setPlatfomtype("kakao");
            newUser.setUserName(userInfo.getNickname());
            service1.signupcount(newUser);
            
            // 자동 회원가입 후 로그인 처리
            user = service.getUserByEmail(userInfo.getEmail());
            if (user != null) {
            	System.out.println("===============5============");
                session.setAttribute("user", user);
                System.out.println(user);
                System.out.println("user =" + user);
                return "redirect:/board/list";
            }
            
            redirectAttributes.addFlashAttribute("loginFailed", true);
            return "redirect:/login";
        } catch (Exception e) {
            // 예외 처리
            redirectAttributes.addFlashAttribute("loginFailed", true);
            System.out.println("=============123213==============");
            return "redirect:/login";
        }
    }


    @GetMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/login"; // 로그인 페이지로 리다이렉트
    }
    
    @GetMapping("signup")
    public String signup1(Model model) {
		return "signup";
    }
    
    @PostMapping("signup")
    public String signup(Model model, UserVO vo, @RequestParam("input_code") int input_code) {
    	
    	String rawPw = vo.getUserPassword();
        String encodePw = pwEncoder.encode(rawPw);   	
    	
    	String email = vo.getUserEmail().toString();
    	String userId = email.split("@")[0];
    	
    	vo.getUserEmail();
        vo.setUserPassword(encodePw);
        vo.getUserName();
        vo.setUserId(userId);
        vo.setPlatfomtype("web");
        vo.setAdminYn("N");
               
        // 이메일 중복 체크
        UserVO emailCheck = service1.findByEmail(vo);
        if (emailCheck != null) {
            model.addAttribute("message", "이미 사용 중인 이메일입니다.");
            return "signup";
        }    
        
        
        System.out.println("인증번호는 : " + num);
        if (num != input_code) {
        	System.out.println("드러왓엉");
            model.addAttribute("message", "인증 번호가 틀렸습니다");
            return "signup";
        }
        
       int success = service1.signupcount(vo);
       if(success == 1) {
    	   return "login";
       }else {
    	   return "signup";
       }
    	
       
    }	  
    
    @GetMapping("findAccount")
    public String findId1(Model model) {
		return "findAccount";          	
    	
    }
    
   
    
//    @PostMapping("findAccount")
//    public String findAccount(Model model, UserVO vo, @RequestParam("findType") String findType) {
//    	System.out.println("==============");
//    	
//        vo.getUser_email();        
//        vo.getUser_name();
//        
//	        if (findType.equals("back")) {
//	            return "redirect:/login/";
//	        }   		    
//		    
//		    if (findType.equals("password")) {
//		    	String userPassword = service.findpassword(vo);
//		    	System.out.println(vo);
//		    if (userPassword != null) {
//		    	model.addAttribute("message", "찾은 비밀번호는 " + userPassword + " 입니다.");
//		    } else {
//		    	model.addAttribute("message", "해당 정보와 일치하는 비밀번호가 없습니다.");
//		    }    
//		 }
//		    System.out.println("=======123=======");
//		 return "findAccount";
//    }
    
  
    //이메일 인증
    private int num;
    
  	@GetMapping("mailCheck")
  	@ResponseBody
  	public String mailCheck(String email, Model model) {
  		
  		
  		UserVO vo = service.getUserByEmail(email);  		
  		
  		if(vo == null) {
  			Random r = new Random();
  			num = r.nextInt(999999); // 랜덤난수설정  			

  				String setfrom = "tpzjajs1@naver.com"; // naver 
  				String tomail = email; //받는사람
  				String title = "[요리위키] 회원가입 인증 이메일 입니다"; 
  				String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
  						+ "요리위키 회원가입 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 
  				
  				
  				System.out.println("이메일 인증 요청이 들어옴!");
  		  		System.out.println("이메일 인증 이메일 : " + email);
  				System.out.println("인증번호는 : "+num);

  				try {
  					MimeMessage message = mailSender.createMimeMessage();
  					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

  					messageHelper.setFrom(setfrom); 
  					messageHelper.setTo(tomail); 
  					messageHelper.setSubject(title);
  					messageHelper.setText(content); 

  					mailSender.send(message);
  				} catch (Exception e) {
  					System.out.println(e.getMessage());
  				}
  				model.addAttribute("num", num);
  				return Integer.toString(num);
  			}
		return "fail";  		
		
  	}
    
    
    @PostMapping("findAccount")
	public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestParam("findType") String findType) throws IOException {
		String email = (String)request.getParameter("userEmail");
		String name = (String)request.getParameter("userName");

		UserVO vo = service.getUserByEmail(email);
		
		if (findType.equals("back")) {
			return new ModelAndView("redirect:/login/");
        }
			
		if(vo != null) {
		Random r = new Random();
		int num = r.nextInt(999999); // 랜덤난수설정
		
		if (vo.getUserName().equals(name)) {
			session.setAttribute("email", vo.getUserEmail());

			String setfrom = "tpzjajs1@naver.com"; // naver 
			String tomail = email; //받는사람
			String title = "[요리위키] 비밀번호변경 인증 이메일 입니다"; 
			String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
					+ "요리위키 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); 
				messageHelper.setSubject(title);
				messageHelper.setText(content); 

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			ModelAndView mv = new ModelAndView();
			mv.setViewName("pw_auth");
			mv.addObject("num", num);
			return mv;
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("findAccount");
			return mv;
		}
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("findAccount");
			return mv;
		}
		
    }
    
    @PostMapping("pw_set.me")
    public String pw_set(@RequestParam(value="email_injeung") String email_injeung,
    			@RequestParam(value = "num") String num, @RequestParam("findType") String findType) throws IOException{
    		
    		System.out.println("여기 인증번호:");
    		System.out.println("보낸인증번호 : "+ num);
    		System.out.println("입력한인증번호 : " + email_injeung);
    		
    		if (findType.equals("back")) {
                return "redirect:/login";
            }
    		
    		if(email_injeung.equals(num)) {
    			return "pw_new";
    		}
    		else {
    			return "findAccount";
    		}
    } //이메일 인증번호 확인
    
    @PostMapping("pw_new")
	public String pw_new(UserVO vo, HttpSession session, @RequestParam("findType") String findType) throws IOException{
    	System.out.println("여기 유저정보 : "+ vo);
    	
    	if (findType.equals("back")) {
            return "redirect:/login";
        }
    	String rawPw = vo.getUserPassword();
        String encodePw = pwEncoder.encode(rawPw);
        String email = vo.getUserEmail();
        
        UserVO cp = new UserVO();
        cp.setUserEmail(email);
        cp.setUserPassword(encodePw);
    	
		int result = service.PwUpdate(cp);
		
		if(result == 1) {
			return "redirect:/login";
		}
		else {
			System.out.println("pw_update"+ result);
			return "findAccount";
		}
    }
    
  

//    @PostMapping("saveUserInfo")
//    
//    public String saveUserInfo(UserVO userVO, HttpSession session) {
//    	
//    	System.out.println("=============================================");    	
//        UserVO loginUser = (UserVO)session.getAttribute("user");
//        userVO.setUSER_NO(loginUser.getUSER_NO());
//        service.saveUserInfo(userVO);
//        System.out.println("=============213123================================");
//        System.out.println("=================1231231============================");
//		
//        
//        return "done";
//		
//    }

}
