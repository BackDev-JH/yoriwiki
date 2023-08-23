<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> --%>        

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>


<link rel="stylesheet" type="text/css"
   href="https://recipe1.ezmember.co.kr/static/css/bootstrap_20211222.css">
<link rel="stylesheet" type="text/css"
   href="https://recipe1.ezmember.co.kr/static/css/font_20221221.css">
<link rel="stylesheet" type="text/css"
   href="https://recipe1.ezmember.co.kr/static/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
   href="https://recipe1.ezmember.co.kr/static/css/ez_recipe_20220322.css">
<link href="https://www.10000recipe.com/favicon.ico" rel="shortcut icon"
   type="image/x-icon">
<link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon.png" rel="apple-touch-icon">
<link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-76x76.png" rel="apple-touch-icon" sizes="76x76">
<link href="https://recipe1.ezmember.co.kr/img/icons/icon-hires.png" rel="icon" sizes="192x192">
<link href="https://recipe1.ezmember.co.kr/img/icons/icon-normal.png" rel="icon" sizes="128x128">
<link rel="stylesheet" type="text/css" href="https://recipe1.ezmember.co.kr/static/css/jquery.tagit.css">
    
       <link rel="stylesheet" type="text/css" href="https://recipe1.ezmember.co.kr/static/css/jquery-ui-1.11.4_201507011.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/list.css" />
	<!-- 
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/bootstrap_20211222.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/font_20221221.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/ez_recipe_20220322.css" />
      -->
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
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript">
	
    function registerNewTagEvent(tagitNew) {
        $(tagitNew).keydown(function(e) {
          if (e.keyCode == 13 || e.keyCode == 9) {
            $(this).trigger($.Event('keydown', { keyCode: 188 }));
            e.preventDefault();
          }
        });
      }
    
	$(document).ready(function() {
		registerNewTagEvent($('.tagit-new'));
		
		$('.tagit.ui-widget.ui-widget-content.ui-corner-all').on('keydown', '.tagit-new', 
		         function(e) {
		            if(e.keyCode != 188) {
		               return;
		            }
		            
		            var len = $('.ui-widget-content .ui-autocomplete-input').val().length;
		            
		            if(len == 0) {
		               e.preventDefault();
		               return;
		            }
		            
		            var templi = document.getElementsByClassName('tagit-new')[0].cloneNode(true);
		            var str2 = $('#mySingleFieldTags').val();
		            var str =  $('.ui-widget-content .ui-autocomplete-input').val();
		            if(str2 != '')
		               str2 += '|';
		            
		            $('#mySingleFieldTags').val(str2 + str);
		            
		            var sp = document.createElement('span');
		            sp.setAttribute('class', 'tagit-label');
		            sp.innerText = str;
		            
		            var at = document.createElement('a');
		            at.setAttribute('class', 'tagit-close');
		            
		            
		            at.addEventListener('click', function(e) {
		               var parent = this.parentNode;
		               var tempStr = parent.children[0].innerText;
		               var arr = document.getElementById('mySingleFieldTags').value.split('|');
		               
		                for(var i = 0; i < parent.parentNode.childNodes.length; i++) {
		                if (parent.parentNode.childNodes[i] === parent) {
		                   arr.splice(arr.indexOf(tempStr), 1);
		                   parent.remove();
		                   break;
		                   }
		                };
		                
		                document.getElementById('mySingleFieldTags').value = arr.join('|');
		            });
		            
		            var sp1 = document.createElement('span');
		            var sp2 = document.createElement('span');
		            sp1.setAttribute('class', 'text-icon');
		            sp2.setAttribute('class', 'ui-icon ui-icon-close');
		            sp1.innerText = 'x';
		            
		            at.appendChild(sp1);
		            at.appendChild(sp2);
		            
		            templi.setAttribute('class', 'test');
		            
		            $('.tagit-new').empty();
		            $('.tagit-new').append(sp);
		            $('.tagit-new').append(at);
		            $('.tagit-new').css('width', '');
		            $('.tagit-new').attr('class', 'tagit-choice ui-widget-content ui-state-default ui-corner-all tagit-choice-editable');
		            
		            templi.setAttribute('class', 'tagit-new');
		            templi.children[0].setAttribute('class', 'ui-widget-content ui-autocomplete-input ui-autocomplete-loading');
		            templi.children[0].value = '';
		            
		            $('.tagit.ui-widget.ui-widget-content.ui-corner-all').append(templi);
		            $('.ui-widget-content.ui-autocomplete-input.ui-autocomplete-loading').focus();
		            registerNewTagEvent($('.tagit-new'));
		            e.preventDefault();
		      });
	});
	</script>
	<style>
	.ui-widget-content{
		background : #fff;
	}
	.pad_1_60{
	    padding-left: 0px !important;
	}
	
	*{margin:0; padding:0;}
	ul{list-style:none;}
	a{text-decoration:none; color:inherit;}
	.box{max-width:460px; width:100%; height:800px; border:1px solid #ccc; margin:0 auto;}
	#tab ul{white-space:nowrap; 
	    overflow-x: auto; text-align:center}
	#tab ul li{display:inline-block; padding: 10px 20px; background: #ccc; margin-right:10px;}
	#tab ul li.on{
	  background : gold;
	}
		
	
	</style>
</head>
<body>
  	<jsp:include page="../include/header.jsp" flush="false"/>
	<%-- <c:if test="${empty sessionScope.user}">
	    <div class="UserInfo">
	        <div class="mainfont">
	            <div style="text-align:right; padding-right: 30px;">
	                <a class="btn btn-primary" href="${pageContext.servletContext.contextPath}/login/" id="logBtn" style="margin-right: 10%;">로그인</a>
	                &nbsp;&nbsp;
	                <a class="btn btn-primary" href="${pageContext.servletContext.contextPath}/userinfo/join"
	                    id="logBtn">회원가입</a>
	            </div>
	        </div>
	    </div>
	</c:if>
	<c:if test="${not empty user}">
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
	</c:if> --%>
	
	<!-- 검색 -->
 	<form action="/board/list" method="GET" id="searchForm">
	<div class="brand_cont mag_t_10">
	    <span class="input-group info_srarch" style="margin-top:10px display:flex;">
	    	<div id="sort">
				<select id="Type" name="type" style="display:flex" value="${pageMaker.cri.type}">
				    <option value=""> 검색어 분류 </option>
				    <option value="userName" id="userName" ${pageMaker.cri.type eq 'userName' ? 'selected' : ''}>작성자</option>
				    <option value="introduce" id="introduce" ${pageMaker.cri.type eq 'introduce' ? 'selected' : ''}>본문내용</option>
				    <option value="title" id="title" ${pageMaker.cri.type eq 'title' ? 'selected' : ''}>제목</option>
				    <option value="name" id="name" ${pageMaker.cri.type eq 'name' ? 'selected' : ''}>태그</option>
				</select>
			</div>
			
		<span class="input-group info_srarch p" style="margin-top:10px;">
			<input type="hidden" name="name" value="${pageMaker.cri.name}" id="mySingleFieldTags" style="width: 100%" class="tagit-hidden-field">
	        <input type="text" name="keyword" id="keyword" class="form-control" placeholder="검색어 입력" value="${pageMaker.cri.keyword}"/>
	        
	        <!-- 검색어 버튼 -->
	        <span class="input-group-btn">
	            <button class="btn btn-default" type="submit" id="search_name" formaction="/board/list/search">
	            <img src="https://recipe1.ezmember.co.kr/img/mobile/icon_search4.png"></button>
	        </span>
	        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	        <input type="hidden" name="category" value="${pageMaker.cri.category }" id="category" style="width: 100%" class="tagit-hidden-field">
        </span>
        
        <div id="tagDiv" class="cont_box pad_l_60" style="display: none; padding:0px 0px 0px 0px; !important;">
        <ul class="tagit ui-widget ui-widget-content ui-corner-all">
            <c:set var="nameTagList" value="${fn:split(pageMaker.cri.name,'|')}"></c:set>
        	<c:forEach items="${nameTagList}" var="nameTag" >
        	<c:if test="${nameTag !=  ''}">
        	<li class="tagit-choice ui-widget-content ui-state-default ui-corner-all tagit-choice-editable" style="">
				<span class="tagit-label">${nameTag}</span>
				<a class="tagit-close">
				<span class="text-icon">x</span>
				<span class="ui-icon ui-icon-close"></span>
				</a>
			</li>	
        	</c:if>
        	</c:forEach>
			<li class="tagit-new" style="width: 85%;">
			<input type="text" class="ui-widget-content ui-autocomplete-input" autocomplete="off" style="width: 100%;" placeholder="검색어 입력"></li>
        </ul>
		</div>
				
        &nbsp;
        <!-- 정렬(작성자, 제목, 생성일자)-->
        	<button class="btn btn-default" type="submit" id="search_name" value="title" name="order" style="width:110px; height:35px; background-color:#c0c797;">제목순</button>
			<button class="btn btn-default" type="submit" id="search_name" value="userName" name="order" style="width:110px; height:35px; background-color:#c0c797;">작성자순</button>
			<button class="btn btn-default" type="submit" id="search_name" value="reg_dt" name="order" style="width:110px; height:35px; background-color:#c0c797;">작성일자순</button>
    </span>
    	<!-- 카테고리 -->
	    	<div class="cont_tit4" style="width: 800px; height: 100px; margin:-6px auto 30px;">
	    	<ul name="categoryList" id="categoryList" style="list-style :none;">
	     		<li class="btn btn-default" value="" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?pageNum=${pageMaker.cri.pageNum}&amount=10'"/>전체
	     		<li class="btn btn-default" value="63" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=63&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>밑반찬
	    		<li class="btn btn-default" value="56" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=56&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>메인반찬
	    		<li class="btn btn-default" value="54" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=54&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>국/탕
	    		<li class="btn btn-default" value="55" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=55&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>찌개
	    		<li class="btn btn-default" value="60" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=60&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>디저트
	    		<li class="btn btn-default" value="53" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=53&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>면/만두
	 			<li class="btn btn-default" value="52" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=52&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>밥/죽/떡
		   		<li class="btn btn-default" value="61" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=61&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>퓨전 </a>
		   		<li class="btn btn-default" value="57" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=57&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>김치/젓갈/장류
		   		<li class="btn btn-default" value="58" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=58&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>양념/소스/잼
	 		   	<li class="btn btn-default" value="65" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=65&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>양식
	 		   	<li class="btn btn-default" value="64" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=64&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>샐러드
	 		   	<li class="btn btn-default" value="68" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=68&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>스프
			   	<li class="btn btn-default" value="66" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=66&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>빵
			   	<li class="btn btn-default" value="69" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=69&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>과자
			   	<li class="btn btn-default" value="59" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=59&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>차/음료/술
			   	<li class="btn btn-default" value="62" style="float:left; margin:0px;" onclick="location.href='${pageContext.servletContext.contextPath}/board/list?category=62&pageNum=${pageMaker.cri.pageNum}&amount=10'"/>기타
	    	</ul>
	    	</div>
  
    	
    	<br>
	</form>
    <ul class="cont_list st3" style="text-align:center; padding-left: 15%; padding-right:15%; padding-top:30px">
    	<p></p>
    	<c:forEach items="${list}" var="board" >
    		<li>
            <a href="${pageContext.servletContext.contextPath}/board/board?boardNum=${board.boardNum}" class="thumbnail" style="height: 290px;">
                <img src="${pageContext.servletContext.contextPath}/upload/${board.path}"
                    style="width:200px; height:130px;">
                <div class="caption">
                    <h4>${board.title}</h4>
                    <h6>작성자 : ${board.userName}</h6>
                    <h6>조회수 : ${board.hit}</h6>
                    <h6>등록일 : ${board.regDt}</h6>
                      <h6> 태그 - ${board.name} </h6>
                    <%-- <p class="jq_elips">${board}</p> --%>
                    
                </div>
            </a>
        	</li>
        	</c:forEach>
        	
    	<!-- 글 작성 버튼 -->
    	<div>
		   	<span style="text-align: left;">
		   		<c:if test="${not empty sessionScope.user.userName}">
		    		<div id="btn" style="text-align:right;">
		    			<a class="btn btn-primary" href="${pageContext.servletContext.contextPath}/board/register" id="logBtn" style="margin-right: 10%;">글 작성</a>
		    		</div>
		    	</c:if>
	    	</span>
    	<p></p>
    	<!-- 관리자 페이지 버튼 -->
	   	<c:if test="${user.adminYn == 'Y'}">
    		<div id="btn" style="text-align:right;">
    			<a class="btn btn-primary" href="${pageContext.servletContext.contextPath}/admin" id="logBtn" style="margin-right: 10%;">관리자 페이지</a>
    		</div>
    	</c:if>
    	</div>
    </ul>
    </div>
    
	<!-- pagination -->
    <nav class="text-center">
    	<ul class="pagination">
			<div class="col row  justify-content-center">
        	  	<div class="dataTables_paginate poging_simple_numbers" ><!-- id="dataTable_pageinate -->
            	  	<ul class="pagination">
              		<c:choose>
	                	<c:when test="${pageMaker.cri.pageNum == 1 }">
		              		<li class = "paginate button page-item start ${pageScope.start}" >
		                		<a href="${pageContext.servletContext.contextPath}/board/list?pageNum=1"
		                			aria-controls="dataTable"
		                			data-dt-idx="0"
		                			tabindex="0"
		                			class="page-link"
		                			onclick = "return false;">처음 페이지</a>
		                	</li><%-- ${pageMaker.startPage} --%>
                		</c:when>
                	<c:otherwise>
	                	<li class = "paginate button page-item start ${pageScope.start}" >
	                		<a href="${pageContext.servletContext.contextPath}/board/list?pageNum=1"
	                			aria-controls="dataTable"
	                			data-dt-idx="0"
	                			tabindex="0"
	                			class="page-link">처음 페이지</a>
	                	</li>
                	</c:otherwise>
                </c:choose>
                
                <c:choose>
                	<c:when test="${pageMaker.cri.pageNum == 1 }">
	                	<li class = "paginate button page-item previous ${pageScope.prev}" >
	                		<a href="${pageContext.servletContext.contextPath}/board/list?pageNum=${pageMaker.cri.pageNum-1}"
	                			aria-controls="dataTable"
	                			data-dt-idx="0"
	                			tabindex="0"
	                			class="page-link"
	                			onclick = "return false">이전</a>
	                	</li>
	                </c:when>
	            	<c:otherwise>
	            		 <li class = "paginate button page-item previous ${pageScope.prev}" >
	                		<a href="${pageContext.servletContext.contextPath}/board/list?pageNum=${pageMaker.cri.pageNum-1}"
	                			aria-controls="dataTable"
	                			data-dt-idx="0"
	                			tabindex="0"
	                			class="page-link">이전</a>
	                	 </li>
	               	</c:otherwise>
	             </c:choose>
	             
               	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" varStatus = "status">
                	
                <c:choose>
                		<c:when test="${pageMaker.cri.pageNum == status.index }">
                			<c:set value="active" var="active" scope="page"></c:set>
                		</c:when>
                		<c:otherwise>
                			<c:set value="" var="active" scope="page"></c:set>
                		</c:otherwise>
                	</c:choose>
                	
                	
   	            <c:choose>
               		<c:when test="${status.index == pageMaker.cri.pageNum }">
                		<li class = " ${pageScope.active}" >
                		<a href="${pageContext.servletContext.contextPath}/board/list?type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}&pageNum=${status.index}&amount=10"
                		aria-controls="dataTable" 
                		data-dt-idx="0" 
                		tabindex="0" 
                		class="page-link" 
                		onclick="return false;">${status.index}</a>
                		</li>
               		</c:when>
               		<c:otherwise>
	    		       	<li class = "paginate button page-item ${pageScope.active}" >
	                		<a href="${pageContext.servletContext.contextPath}/board/list?type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}&pageNum=${status.index}&amount=10" aria-controls="dataTable" 
	                		data-dt-idx="0" 
	                		tabindex="0" 
	                		class="page-link">${status.index}</a>
	                	</li>
               		</c:otherwise>
                </c:choose>
                </c:forEach>
                
                	<c:choose>
                		<c:when test="${pageMaker.cri.pageNum == pageMaker.realEndPage}">
		                	<li class = "paginate button page-item next ${pageScope.next}" id="dataTable_next">
		                		<a href="${pageContext.servletContext.contextPath}/board/list?pageNum=${pageMaker.cri.pageNum+1}"
		                		aria-controls="dataTable"
		                		data-dt-idx="0"
		                		tabindex="0"
		                		class="page-link"
		                		onclick="return false">다음</a>
		                	</li>
	                	</c:when>
	                	<c:otherwise>
	                		<li class = "paginate button page-item next ${pageScope.next}" id="dataTable_next">
		                		<a href="${pageContext.servletContext.contextPath}/board/list?pageNum=${pageMaker.cri.pageNum+1}"
		                		aria-controls="dataTable"
		                		data-dt-idx="0"
		                		tabindex="0"
		                		class="page-link">다음</a>
		                	</li>
	                	</c:otherwise>
	                </c:choose>
	                	
	                <c:choose>
                		<c:when test="${pageMaker.cri.pageNum == pageMaker.realEndPage}">
		                	<li class = "paginate button page-item end ${pageScope.end}" >
	                		<a href="${pageContext.servletContext.contextPath}/board/list?pageNum=${pageMaker.realEndPage}"
	                		aria-controls="dataTable"
	                		data-dt-idx="0"
	                		tabindex="0"
	                		class="page-link"
	                		onclick="return false">마지막 페이지</a>
                	</li>
	                	</c:when>
	                	<c:otherwise>
	                		<li class = "paginate button page-item end ${pageScope.realEndPage}" >
	                		<a href="${pageContext.servletContext.contextPath}/board/list?pageNum=${pageMaker.realEndPage}"
	                		aria-controls="dataTable"
	                		data-dt-idx="0"
	                		tabindex="0"
	                		class="page-link">마지막 페이지</a>
                	</li>
	                	</c:otherwise>
	                </c:choose>
                	
                </ul>
            </div>
     </div>
     </ul>
    </nav>
</body>
</html>