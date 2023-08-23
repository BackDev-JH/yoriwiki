<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/login.css" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
      <form action="${pageContext.servletContext.contextPath}/login/login.do" method="post">
      <script>
		 // 서버에서 보낸 메시지를 alert로 띄움
	    var message = /*[[]]*/ '${message}';
	    if (message) {
	        alert(message);
	    }
	  </script>
        <div class="container">
		    <div class="left">
		        <div class="text">환영합니다</div>
		        <div class="small-text">손쉬운 요리 레시피 - 요리위키</div>
		        <div class="form-container">
		            <div class="data">
		                <label>아이디</label>                
		                <input type="text" id="myroLoginId" name="userId" required />                
		            </div>
		            <div class="data">
		                <label>비밀번호</label>
		                <input type="password" id="myroLoginPwd" name="user_login_password" onKeypress="javascript:if(event.keyCode==13) {myroLogin()}"
		                    required />
		            </div>
		            <div class="forgot-pass">
		                <a href="/login/findAccount">계정을 잊으셨나요?</a>
		            </div>
		            <div class="btn">
		                <div class="inner"></div>
		                <button type="submit" id="myroLoginBtn">로그인</button>
		            </div>		            
		            <a href="https://kauth.kakao.com/oauth/authorize?client_id=4fa8b442b89754a29008580b23ee48fe&redirect_uri=http://172.20.10.53:8890/login/kakao&response_type=code&scope=account_email">
  						<img src="${pageContext.servletContext.contextPath}/img/kakao.png" style="padding-bottom: 20px;"/>
					</a>
		            <div class="signup-link">회원이 아니세요? <a href="${pageContext.servletContext.contextPath}/login/signup">회원가입하기</a></div>
		            <div class="login-failed">
                        <!-- loginFailed attribute가 전달된 경우 -->
                        <c:if test="${loginFailed}">
                            아이디 또는 비밀번호가 틀렸습니다.
                        </c:if>
                    </div>
		        </div>
		    </div>
		
		    <div class="right">
	            <video muted autoplay loop style="height: 100vh
	            ; " id="mainVideo">
	                <source src="${pageContext.servletContext.contextPath}/video/YoriWikiVideo.mp4" type="video/mp4">
	            </video>
        	</div>
		
		</div>	
		
		  
     </form>
</body>
</html>