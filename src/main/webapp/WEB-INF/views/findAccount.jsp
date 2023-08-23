<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/myprofile.css" />
</head>
<body>
<form action="${pageContext.servletContext.contextPath}/login/findAccount" method="post">
	<script>
	 // 서버에서 보낸 메시지를 alert로 띄움
    var message = /*[[]]*/ '${message}';
    if (message) {
        alert(message);
    }
	</script>

	<div class="wrapper">	        
	
	        <div class="container">
	
	            <div class="flex-container">
	                <div class="form-container">
	                    <div class="py-4">
	                        <div class="section-title-container">
	                            <h5 style="margin-bottom: 8px"><b>비밀번호 찾기</b></h5>
	                        </div>
	                        <div class="data">
	                            <label>이메일</label>
	                            <input id="find_user_email" name="userEmail" type="email" />	                            
	                        </div>
	                        <div class="data">
	                            <label>이름</label>
	                            <input type="text" id="find_user_phone" name="userName" />
	                        </div>	                        
	                    </div>
	
	                </div>
	            </div>	
	
	            <div class="flex-container p-5">
	                <button class="btn-normal" type="submit" name="findType" value="password">찾기</button>
	                <button class="btn-normal" name="findType" value="back" >돌아가기</button>
	            </div>
	        </div>
	    </div>
	 </form>
	    
</body>
</html>