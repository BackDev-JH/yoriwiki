<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/list.css" />
<!-- header -->
  	${pageContext.servletContext.contextPath}
	<div class="nav_etc" style="margin-bottom: 30px;">
	    <!-- <a href="/index.html"> -->
	    <img src="${pageContext.servletContext.contextPath}/img/logo-removebg-preview.png" style="max-width: 10%; height: 100% !important;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list'">
	    <!-- </a> -->
	</div>
	
	<c:if test="${empty sessionScope.user || user.userNum == 0}">
	    <div class="UserInfo">
	        <div class="mainfont">
	            <div style="text-align:right; padding-right: 30px;">
	                <a class="btn btn-primary" href="${pageContext.servletContext.contextPath}/login/" id="logBtn" style="margin-right: 10%;">로그인</a>
	            </div>
	        </div>
	    </div>
	</c:if>
	<c:if test="${not empty user && user.userNum != 0}">
	    <span class="UserInfo">
	        <span class="mainfont">
	             <div>${sessionScope.user.userName} 님 반갑습니다 &nbsp;
	                <a href="${pageContext.servletContext.contextPath}/login/logout"
	                	style="margin-right: 10%;
	                	color: blue;
	                	focus: red;">로그아웃</a>
	            </div>
	        </span>
	    </span>
	</c:if>