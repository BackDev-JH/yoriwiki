<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Upload Options</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/myprofile.css" />
</head>
<body class="sb-nav-fixed">
	
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="index.html">요리위키</a>
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
                        <a class="nav-link" href="/admin">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            이력관리
                        </a>
                        <a class="nav-link" href="/uploadFile/uploadoptions">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            파일업로드 설정
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
                        <li class="breadcrumb-item active">파일업로드 관리</li>
                    </ol>
                   
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            파일업로드 관리
                        </div>

                        <%-- <p>
				            <label for="id">id:</label>
				            <input type="text" name="id" value="${uploadOption.id}" />
				        </p> --%>
				        <form method="post" action="/uploadFile/uploadoptions">
				        <div class="flex-container">
			                <div class="form-container">
			                    <div class="py-4">
			                        <div class="section-title-container">
			                        <h5 style="margin-bottom: 8px"><b>사진 업로드 설정</b></h5>
				                        <div class="data" style="display:none">				                            
				                            <input type="text" name="id" value="picture" />
				                        </div>
			                        </div>
			                        <!-- <div class="data">
			                            <label>id</label>
			                            <input type="text" name="id" value="picture" />
			                        </div> -->
			                        <div class="data">
			                            <label>확장자</label>
			                            <input type="text" name="allowed_extensions" value="${pictureOption.allowedExtensions}" />
			                        </div>
			                        <div class="data">
			                            <label>최대 업로드 용량</label>
			                            <input type="text" name="max_size" value="${pictureOption.maxSize}"/>
			                        </div>
			                        <div class="data">
			                            <label>최대 업로드 개수</label>
			                            <input type="text" name="max_upload_count" value="${pictureOption.maxUploadCount}" />
			                            <!-- <b id="userEmailArea"></b> -->
			                        </div>
			                                       
	                					<button class="btn-normal" type="submit">저장하기</button>	                		
	            					
			                    </div>
	                    	</div>
                		</div>
	                	</form>
	            		<form method="post" action="/uploadFile/uploadoptions2">
				        <div class="flex-container">
			                <div class="form-container">
			                    <div class="py-4">
			                        <div class="section-title-container">
			                        <h5 style="margin-bottom: 8px"><b>동영상 업로드 설정</b></h5>
				                        <div class="data" style="display:none">				                            
				                            <input type="text" name="id" value="video" />
				                        </div>
			                        </div>
			                        <!-- <div class="data">
			                            <label>id</label>
			                            <input type="text" name="id" value="picture" />
			                        </div> -->
			                        <div class="data">
			                            <label>확장자</label>
			                            <input type="text" name="allowed_extensions" value="${videoOption.allowedExtensions}" />
			                        </div>
			                        <div class="data">
			                            <label>최대 업로드 용량</label>
			                            <input type="text" name="max_size" value="${videoOption.maxSize}"/>
			                        </div>
			                        <div class="data">
			                            <label>최대 업로드 개수</label>
			                            <input type="text" name="max_upload_count" value="${videoOption.maxUploadCount}" />
			                            <!-- <b id="userEmailArea"></b> -->
			                        </div>
			                                        
	                					<button class="btn-normal" type="submit">저장하기</button>	                		
	            					
			                    </div>
	                    	</div>
                		</div>
	                	</form>
	            		
                    </div>                    
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Your Website 2023</div>
                        <div>
                            
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