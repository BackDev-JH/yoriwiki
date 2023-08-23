<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8" />
	    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />  
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	<script>
	        function downloadExcel() {
	            window.location.href = "/admin/excel.do";
	        }
	    </script>    
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/list.css" />
	    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/bootstrap_20211222.css" />
	    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/font_20221221.css" />
	    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css" />
	    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/ez_recipe_20220322.css" />   
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="/board/list">요리위키</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                class="fas fa-bars"></i></button>

    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Core</div>
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/admin">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            이력관리
                        </a>
                        
                        <a class="nav-link" href="/uploadFile/">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            파일업로드관리                            
                        </a>                        
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    Start Bootstrap
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">관리자페이지</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">이력관리</li>
                    </ol>
                    <div class="col-auto">
                    	<button onclick="downloadExcel()">
                        <a class="btn app-btn-secondary" id="csv"  style="display: inline-block">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-download me-1"
                                fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                    d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z" />
                                <path fill-rule="evenodd"
                                    d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z" />
                            </svg>
                            엑셀 다운로드
                        </a>
                        </button>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            게시물 삭제리스트
                        </div>

                        <div class="brand_cont mag_t_10">
<!-- 	    <p style="text-align:center; font-size:13px; padding:8px 0 5px;">검색어 입력</p> -->
    <span class="input-group info_srarch" style="margin-top:10px;">

    </span>
	<ul class="cont_list st3" style="text-align:center; padding-left: 15%; padding-right:15%; padding-top:30px">
    	<p></p>
    	<c:forEach items="${list}" var="board" >
    		<li>
            <a href="${pageContext.servletContext.contextPath}/board/admin?boardNum=${board.boardNum}" class="thumbnail">
                <img src="${pageContext.servletContext.contextPath}/upload/${board.path}"
                    style="width:200px; height:130px;">
                <div class="caption">
                    <h4>${board.title}</h4>
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
    <nav class="text-center">
    	<ul class="pagination">
			<div class="col row  justify-content-center">
        	  	<div class="dataTables_paginate poging_simple_numbers" ><!-- id="dataTable_pageinate -->
            	  	<ul class="pagination">
              		<c:choose>
	                	<c:when test="${pageMaker.cri.pageNum == 1 }">
		              		<li class = "paginate button page-item start ${pageScope.start}" >
		                		<a href="${pageContext.servletContext.contextPath}/admin/?pageNum=1"
		                			aria-controls="dataTable"
		                			data-dt-idx="0"
		                			tabindex="0"
		                			class="page-link"
		                			onclick = "return false;">처음 페이지</a>
		                	</li><%-- ${pageMaker.startPage} --%>
                		</c:when>
                	<c:otherwise>
	                	<li class = "paginate button page-item start ${pageScope.start}" >
	                		<a href="${pageContext.servletContext.contextPath}/admin/?pageNum=1"
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
	                		<a href="${pageContext.servletContext.contextPath}/admin/?pageNum=${pageMaker.cri.pageNum-1}"
	                			aria-controls="dataTable"
	                			data-dt-idx="0"
	                			tabindex="0"
	                			class="page-link"
	                			onclick = "return false">이전</a>
	                	</li>
	                </c:when>
	            	<c:otherwise>
	            		 <li class = "paginate button page-item previous ${pageScope.prev}" >
	                		<a href="${pageContext.servletContext.contextPath}/admin/?pageNum=${pageMaker.cri.pageNum-1}"
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
                		<a href="${pageContext.servletContext.contextPath}/admin/?pageNum=${status.index}"
                		aria-controls="dataTable" 
                		data-dt-idx="0" 
                		tabindex="0" 
                		class="page-link" 
                		onclick="return false;">${status.index}</a>
                		</li>
               		</c:when>
               		<c:otherwise>
	    		       	<li class = "paginate button page-item ${pageScope.active}" >
	                		<a href="${pageContext.servletContext.contextPath}/admin/?pageNum=${status.index}" aria-controls="dataTable" 
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
		                		<a href="${pageContext.servletContext.contextPath}/admin/?pageNum=${pageMaker.cri.pageNum+1}"
		                		aria-controls="dataTable"
		                		data-dt-idx="0"
		                		tabindex="0"
		                		class="page-link"
		                		onclick="return false">다음</a>
		                	</li>
	                	</c:when>
	                	<c:otherwise>
	                		<li class = "paginate button page-item next ${pageScope.next}" id="dataTable_next">
		                		<a href="${pageContext.servletContext.contextPath}/admin/?pageNum=${pageMaker.cri.pageNum+1}"
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
	                		<a href="${pageContext.servletContext.contextPath}/admin/?pageNum=${pageMaker.realEndPage}"
	                		aria-controls="dataTable"
	                		data-dt-idx="0"
	                		tabindex="0"
	                		class="page-link"
	                		onclick="return false">마지막 페이지</a>
                	</li>
	                	</c:when>
	                	<c:otherwise>
	                		<li class = "paginate button page-item end ${pageScope.realEndPage}" >
	                		<a href="${pageContext.servletContext.contextPath}/admin/?pageNum=${pageMaker.realEndPage}"
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
                    </div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Your Website 2023</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
        
</body>
</html>