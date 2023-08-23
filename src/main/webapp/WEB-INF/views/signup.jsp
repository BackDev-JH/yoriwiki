<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/sign up.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>회원가입</title>

</head>
<body>
	<form action="${pageContext.servletContext.contextPath}/login/signup" method="post">
	
		<script>
		$(document).ready(function() {
			$('#mail-Check-Btn').click(function() {
				const eamil = $('#userEmail').val(); // 이메일 주소값 얻어오기!
				console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
				const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
				const $resultMsg = $('#mail-check-warn');
				
				$.ajax({
					type : 'get',
					url : '${pageContext.servletContext.contextPath}/login/mailCheck', // GET방식이라 Url 뒤에 email을 뭍힐수있다.
					data : { email : eamil },		
					success : function (data) {
						console.log("data : " +  data);
						checkInput.attr('disabled',false);
						code =data;
						alert('인증번호가 전송되었습니다.')
						
						if(code == "fail"){
							$resultMsg.html('이미 사용중인 이메일입니다.')
							$resultMsg.css('color','red');
							checkInput.css('display', true);
						}else{
							checkInput.show();
						}
						
					}			
				}); // end ajax
			 // end send eamil
			
			
				$('.mail-check-input').blur(function () {
					const inputCode = $(this).val();				
					
					if(inputCode === code){
						$resultMsg.html('인증번호가 일치합니다.');
						$resultMsg.css('color','green');			
						
					}else{
						$resultMsg.html('인증번호가 불일치 합니다.');
						$resultMsg.css('color','red');
					}			
				});
			});
		});
		</script>

		<div class="container">
        	<div class="left">
		        <div class="text">회원 가입</div>
		        <div class="small-text">손쉬운 요리 레시피 - 요리위키</div>		
		        <div class="form-container">
		            
		            <div class="data">
		                <label class="label-text">이메일</label>		                
		                <input class="uk-input" type="text" name = "userEmail" id= "userEmail" placeholder="" required/>		                
		           		<c:if test="${not empty message and message == '이미 사용 중인 이메일입니다.'}">
                    	<span class="error-message">${message}</span>
                		</c:if>
		            </div>
		            
		            <div class="data" style="margin-bottom: 100px;">
	                    <button class="myro-btn-back" type="button" id="mail-Check-Btn">이메일인증</button> 
	                    <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" name="input_code" value="${input_code}" style= "display: none;"/>
	                    <p id="mail-check-warn"/> 
	                    <c:if test="${not empty message and message == '인증 번호가 틀렸습니다'}">
                    	<span class="error-message">${message}</span>
                		</c:if>      
		            </div>     
											
		            <div class="data">
	                    <label class="label-text">비밀번호</label>			                
			            <input class="uk-input" type="password" name = "userPassword" id="signInPwd" placeholder="" required />         
		            </div>          		            
		            	            
		            <div class="data">
		                <label class="label-text">이름</label>		                
		                <input class="uk-input" type="text" name = "userName" id="signInNickname" placeholder="" required />		                
		            	<c:if test="${not empty message and message == '이미 사용 중인 닉네임입니다.'}">
                   		<span class="error-message">${message}</span>
               			</c:if>		            
		            </div>         
		            		            
		            <div class="data">
		                <button type="submit" class="myro-btn" id="completeSignInAndSendVerifyCode">회원가입</button>
		            </div>
		            
		            <div class="data">
		                <button class="myro-btn-back" id="backPage" onclick="location.href='${pageContext.servletContext.contextPath}/login/'">뒤로가기</button>
		            </div>
		         </div>
		    </div>	   
		
		    <div class="right">
	            <video muted autoplay loop style="height: 100vh
	            ; right: 100%;" id="mainVideo">
	                <source src="${pageContext.servletContext.contextPath}/video/jeju.mp4" type="video/mp4">
	            </video>
        	</div>
		</div>
	</form>

</body>
</html>