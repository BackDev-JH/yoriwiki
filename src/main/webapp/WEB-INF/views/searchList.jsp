<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> --%>        

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/dataTables.bootstrap4.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/list.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/bootstrap_20211222.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/font_20221221.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/ez_recipe_20220322.css" />
    <link href="https://www.10000recipe.com/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon.png" rel="apple-touch-icon" />
    <link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-76x76.png" rel="apple-touch-icon"
        sizes="76x76" />
    <link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-120x120.png" rel="apple-touch-icon"
        sizes="120x120" />
    <link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-152x152.png" rel="apple-touch-icon"
        sizes="152x152" />
    <link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-180x180.png" rel="apple-touch-icon"
        sizes="180x180" />
    <link href="https://recipe1.ezmember.co.kr/img/icons/icon-hires.png" rel="icon" sizes="192x192" />
    <link href="https://recipe1.ezmember.co.kr/img/icons/icon-normal.png" rel="icon" sizes="128x128" />
    <!-- <script type="text/javascript" src="https://recipe1.ezmember.co.kr/static/js/jquery-1.11.2.min.js"
    charset="utf-8"></script>  -->
    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/publishertag.js"></script>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/search.js"></script>
</head>

<body>
  	<!-- header -->
	<div class="nav_etc" style="margin-bottom: 30px;">
	    <!-- <a href="/index.html"> -->
	    <img src="../img/logo-removebg-preview.png" style="max-width: 10%; height: 100% !important;">
	    <!-- </a> -->
	</div>
	
	<c:if test="${empty sessionScope.user_id}">
	    <div class="UserInfo">
	        <div class="mainfont">
	            <div style="text-align:right; padding-right: 30px;">
	                <a class="btn btn-primary" href="${pageContext.servletContext.contextPath}/login/" id="logBtn">로그인</a>
	                &nbsp;&nbsp;
	                <a class="btn btn-primary" href="${pageContext.servletContext.contextPath}/userinfo/join"
	                    id="logBtn">회원가입</a>
	            </div>
	        </div>
	    </div>
	</c:if>
	
	<c:if test="${not empty sessionScope.user_id}">
	    <span class="UserInfo">
	        <span class="mainfont">
	<%--             <div>${sessionScope.user_id} 님 반갑습니다 &nbsp;
	                <a href="${pageContext.servletContext.contextPath}/login/logout">로그아웃</a>
	            </div> --%>
	        </span>
	    </span>
	</c:if>
	
	<!-- 검색 -->
 	<form action="/mainss" method="GET" id="searchForm">
	<div class="brand_cont mag_t_10">
<!-- 	    <p style="text-align:center; font-size:13px; padding:8px 0 5px;">검색어 입력</p> -->
    <span class="input-group info_srarch" style="margin-top:10px;">
    	<div id="sort">
			<select name="type">
			    <option value="">검색어선택</option>
			    <option value="userName" id="userName">작성자</option>
			    <option value="introduce" id="introduce">본문내용</option>
			    <option value="title" id="title">제목</option>
			    <option value="tag" id="tag">태그</option>
			</select>
		</div>
		
		<span class="input-group info_srarch p" style="margin-top:10px;">
	        <input type="text" name="keyword" id="keyword" class="form-control" placeholder="검색어 입력" value=${pageMaker.cri.keyword} >
	        <span class="input-group-btn">
	            <button class="btn btn-default" type="button" id="search_name">
	            <img src="https://recipe1.ezmember.co.kr/img/mobile/icon_search4.png"></button>
	        </span>
        </span>
    </span>
</form>
    <ul class="cont_list st3">
    	<c:forEach items="${list}" var="board" >
    		<li>
            <a href="#" class="thumbnail">
                <img src="${board.path}"
                    style="width:200px; height:130px;">
                <div class="caption">
                    <h4>${board.title}</h4>
                    <h6>파일 : ${board.path}</h6>
                    <h6>작성자 : ${board.userName}</h6>
                    <h6>조회수 : ${board.hit}</h6>
                    <%-- <p class="jq_elips">${board}</p> --%>
                </div>
            </a>
        	</li>
    	</c:forEach>
    </ul>
    </div>
    <nav class="text-center">
        <ul class="pagination">

        <!-- pagination -->
           <c:choose>
		<c:when test="${pageMaker.prev}">
			<c:set value="" var="prev" scope="page"></c:set>
		</c:when>
		<c:otherwise>
			<c:set value="disabled" var="prev" scope="page"></c:set>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${pageMaker.next}">
			<c:set value="" var="next" scope="page"></c:set>
		</c:when>
		<c:otherwise>
			<c:set value="disabled" var="next" scope="page"></c:set>
		</c:otherwise>
	</c:choose>
		
	<c:choose>
		<c:when test="${pageMaker.start}">
			<c:set value="" var="start" scope="page"></c:set>
		</c:when>
		<c:otherwise>
			<c:set value="disabled" var="start" scope="page"></c:set>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${pageMaker.end}">
			<c:set value="" var="end" scope="page"></c:set>
		</c:when>
		<c:otherwise>
			<c:set value="disabled" var="end" scope="page"></c:set>
		</c:otherwise>
	</c:choose>
	
	<!-- pagination -->
	<div class="col row  justify-content-center">
          	<div class="dataTables_paginate poging_simple_numbers" ><!-- id="dataTable_pageinate -->
              	<ul class="pagination">
              		<li class = "paginate button page-item start ${pageScope.start}" >
                		<a href="${pageContext.servletContext.contextPath}/board/list?pageNum=${pageMaker.startPage}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Start</a>
                	</li>
                	<li class = "paginate button page-item previous ${pageScope.prev}" >
                		<a href="${pageContext.servletContext.contextPath}/board/list?pageNum=${pageMaker.cri.pageNum-1}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                	</li>
                	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" varStatus = "status">
                	
                	<c:choose>
                		<c:when test="${pageMaker.cri.pageNum == status.index }">
                			<c:set value="active" var="active" scope="page"></c:set>
                		</c:when>
                		<c:otherwise>
                			<c:set value="" var="active" scope="page"></c:set>
                		</c:otherwise>
                	</c:choose>
                	
                	<li class = "paginate button page-item ${pageScope.active}" >
                		<a href="${pageContext.servletContext.contextPath}/board/list?pageNum=${status.index}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">${status.index}</a>
                	</li>
                	</c:forEach>
                	
                	<li class = "paginate button page-item next ${pageScope.next}" id="dataTable_next">
                		<a href="${pageContext.servletContext.contextPath}/board/list?pageNum=${pageMaker.cri.pageNum+1}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Next</a>
                	</li>
                	<li class = "paginate button page-item end ${pageScope.end}" >
                		<a href="${pageContext.servletContext.contextPath}/board/list?pageNum=${pageMaker.realEndPage}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">End</a>
                	</li>
                </ul>
            </div>
     </div>
     </ul>
    </nav>
</body>
</html>