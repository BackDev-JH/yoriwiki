package com.yoriwiki.spring.controller;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yoriwiki.spring.domain.UserVO;
import com.yoriwiki.spring.service.KakaoService;
import com.yoriwiki.spring.service.LoginService;
import com.yoriwiki.spring.service.SignUpService;


@RestController
@RequestMapping("/login/")
public class UserController {

    @Autowired
    private LoginService service;
    
    @Autowired
	private KakaoService kakaoService;
    
    @Autowired
	private SignUpService service1;

    @PostMapping("saveUserInfo")
    public int saveUserInfo(@RequestBody Map<String, String> data, HttpSession session) {
        UserVO loginUser = (UserVO)session.getAttribute("user");

        UserVO userVO = new UserVO();
        userVO.setUserNum(loginUser.getUserNum());
        userVO.setUserName(data.get("userNickName"));
        userVO.setUserEmail(data.get("userEmail"));  
        userVO.setUserPassword(data.get("userPwd"));

        int result = service.saveUserInfo(userVO);
        
        
        return result;
        
    }
    
    @PostMapping("deleteUser")
    public int deleteUser(@RequestBody Map<String, String> data, HttpSession session) {
        UserVO loginUser = (UserVO) session.getAttribute("user");
        
        if (loginUser == null) {
            return -1; // 로그인 되어있지 않은 경우
        } else {
            if (!loginUser.getUserPassword().equals(data.get("userPwd"))) {
                return 0; // 비밀번호가 일치하지 않는 경우
            } else {
                int result = service.deleteUser(loginUser.getUserNum());
                if (result == 1) {
                    session.invalidate();
                }
                
                return result;
            }
        }
    }
    
   




}

