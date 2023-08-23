<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" class="">



<head>

<title>${boardVO.title }</title>
<link rel="canonical" href="https://www.10000recipe.com/recipe/6896826">

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
<link
	href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon.png"
	rel="apple-touch-icon">
<link
	href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-76x76.png"
	rel="apple-touch-icon" sizes="76x76">
<link
	href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-120x120.png"
	rel="apple-touch-icon" sizes="120x120">
<link
	href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-152x152.png"
	rel="apple-touch-icon" sizes="152x152">
<link
	href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-180x180.png"
	rel="apple-touch-icon" sizes="180x180">
<link href="https://recipe1.ezmember.co.kr/img/icons/icon-hires.png"
	rel="icon" sizes="192x192">
<link href="https://recipe1.ezmember.co.kr/img/icons/icon-normal.png"
	rel="icon" sizes="128x128">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
</head>

<script type="text/javascript">
function removePost(gb) {
	if(gb == 'N') {
		if(!confirm('게시글을 삭제 하시겠습니까?')) {
			return;
		}
	    let f = document.createElement('form');
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'boardNum');
	    obj.setAttribute('value', '${boardVO.boardNum}');
	    
	    let obj2;
	    obj2 = document.createElement('input');
	    obj2.setAttribute('type', 'hidden');
	    obj2.setAttribute('name', 'adminYn');
	    obj2.setAttribute('value', '${user.adminYn}');
	    
	    
	    f.appendChild(obj);
	    f.appendChild(obj2);
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', ${pageContext.request.contextPath}'/board/remove');
	    
	    document.body.appendChild(f);
	    f.submit();
	} else if (gb == 'Y'){
		if(!confirm('게시글을 삭제 하시겠습니까?')) {
			return;
		}
		
	    let f = document.createElement('form');
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'boardNum');
	    obj.setAttribute('value', '${boardVO.boardNum}');
	    f.appendChild(obj);
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', ${pageContext.request.contextPath}'/admin/remove');
	    document.body.appendChild(f);
	    f.submit();
	} else if(gb == 'M') {
		if(!confirm('게시글을 복원 하시겠습니까?')) {
			return;
		}
		
	    let f = document.createElement('form');
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'boardNum');
	    obj.setAttribute('value', '${boardVO.boardNum}');
	    f.appendChild(obj);
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', ${pageContext.request.contextPath}'/admin/modify');
	    document.body.appendChild(f);
	    f.submit();
	}
}

function doCommentReply(num) {
    var reply = $('#reply'+num);
    if(reply.css('display') == 'none') {
    	reply.css('display', 'block');
    } else {
    	reply.css('display', 'none');
    }
}

function doCommentModify(num) {
	  var comment = $('#comment' + num);

	  if (comment.prop('tagName') == 'SPAN') {
	    var input = $('<input>', {
	      type: 'textarea',
	      class: 'form-control2',
	      name: 'content',
	      value: comment.html()
	    });

	    var boardNumInput = $('<input>', {
	      type: 'hidden',
	      name: 'boardNum',
	      value: '${boardVO.boardNum}'
	    });

	    var commentNumInput = $('<input>', {
	      type: 'hidden',
	      name: 'commentNum',
	      value: num
	    });

	    var commentForm = $('<form>', {
	      action: '/board/comment/modify',
	      method: 'POST',
	      html: input,
	      id: 'commentForm',
	      append: [
	        input,
	        boardNumInput,
	        input,
	        commentNumInput,
	        $('<button>', {
	          type: 'submit',
	          text: '수정',
	          class: 'btn btn-default'
	        }),
	        $('<button>', {
	          type: 'button',
	          text: '취소',
	          class: 'btn btn-default',
	          click: function () {
	            commentForm.replaceWith(comment);
	          }
	        })
	      ]
	    });

	    comment.replaceWith(commentForm);
	  }
	}
	
function doCoCommentModify(num) {
	  var cocomment = $('#cocomment' + num);

	  if (cocomment.prop('tagName') == 'SPAN') {
	    var input = $('<input>', {
	      type: 'textarea',
	      class: 'form-control2',
	      name: 'content',
	      value: cocomment.html()
	    });

	    var boardNumInput = $('<input>', {
	      type: 'hidden',
	      name: 'boardNum',
	      value: '${boardVO.boardNum}'
	    });

	    var cocommentNumInput = $('<input>', {
	      type: 'hidden',
	      name: 'cocommentNum',
	      value: num
	    });

	    var cocommentForm = $('<form>', {
	      action: '/board/cocomment/modify',
	      method: 'POST',
	      html: input,
	      id: 'cocommentForm',
	      append: [
	        input,
	        boardNumInput,
	        input,
	        cocommentNumInput,
	        $('<button>', {
	          type: 'submit',
	          text: '수정',
	          class: 'btn btn-default'
	        }),
	        $('<button>', {
	          type: 'button',
	          text: '취소',
	          class: 'btn btn-default',
	          click: function () {
	            cocommentForm.replaceWith(cocomment);
	          }
	        })
	      ]
	    });

	    cocomment.replaceWith(cocommentForm);
	  }
	}


function userSubmit() {
	var userGB = ${user.userNum}
	
	if(userGB == 0) {
		alert("비회원은 댓글을 작성하실 수 없습니다.")
		return false;
	} else {
		return true;
	}
}


window.onload = function() {
	if(${user.userNum} == 0) {
		document.getElementById('like-btn').disabled = 'disabled';
	}	
}

</script>


<body aria-hidden="false">

	<link rel="stylesheet" type="text/css"
		href="https://recipe1.ezmember.co.kr/static/css/jquery-ui-1.11.4_201507011.css">



	<style>
@media ( max-width :1400px) {
	.partners_banner {
		display: none;
	}
}
</style>



	<link rel="stylesheet" type="text/css"
		href="https://recipe1.ezmember.co.kr/static/css/swiper.min.css">

	<link rel="stylesheet" type="text/css"
		href="https://recipe1.ezmember.co.kr/static/css/store_20220422.css">


	<style type="text/css">
.form-control2 {
	padding: 6.5px 12px;
	font-size: 14px;
	color: #555;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
}

#oldContArea img {
	max-width: 100%;
	height: auto;
}

.view_step_cont .none {
	display: none;
}

.view_step_cont .carousel.slide {
	border: none;
	box-shadow: none;
	margin: 0;
	padding: 0;
}

.view_step_cont .media-right .carousel.slide {
	width: 300px;
}

.view_step_cont .media-right {
	width: 300px;
}

.view_step_cont .carousel-control {
	padding: 0;
}

.view_step_cont .carousel-indicators {
	bottom: -36px;
}

.view_step_cont .carousel-indicators li {
	width: 10px;
	height: 10px;
}

.centeredcrop {
	position: relative;
	width: 100%;
	overflow: hidden;
	height: 400px;
}

.centeredcrop img {
	position: absolute;
	left: 50%;
	top: 50%;
	width: 100%;
	height: auto;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

.centeredcrop img.portrait {
	width: auto;
	height: 100%;
}

.modal-body .btn_list {
	text-align: center;
	padding: 12px 0 0 0;
}

.modal-body .btn_list a {
	text-align: center;
	font-size: 11px;
	color: #444;
	width: 23%;
	display: inline-block;
}

.modal-body .btn_list a img {
	border-radius: 50%;
	width: 69px;
	height: 69px;
}

.centeredcrop2 {
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;
	align-items: flex-start;
	width: 100%;
	height: 400px;
}

.centeredcrop2 img {
	object-fit: cover;
	width: 600px;
	height: 400px;
}

.centeredcrop2 img.portrait {
	width: auto;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.view2_box .swiper-substance span {
	position: absolute;
	font-size: 12px;
	color: #fff;
	text-shadow: 0.1em 0.1em 0.15em #333;
	margin-left: 2px;
	z-index: 100;
}

.view2_box .swiper-substance img {
	max-width: 150px;
}

.sp_pdt_wrap .swiper-substance span {
	text-shadow: none
}

.media-body {
	min-width: 600px;
	max-width: 600px;
	 
}

</style>
	<jsp:include page="../include/header.jsp" flush="false"/>

	<form id="translateFrm">
		<input type="hidden" name="q_mode" value="setRecipeTranslate">
		<input type="hidden" name="sq_board" value="6896826"> <input
			type="hidden" id="trans_titles" name="trans_title" value="">
		<input type="hidden" id="trans_targets" name="lang" value="">
		<input type="hidden" id="trans_intro" name="trans_intro" value="">
		<input type="hidden" id="trans_material" name="trans_material"
			value="">
	</form>
	<div class="container recipe_regi">
		<div id="regi_center" class="regi_center">
			<div class="view2_pic">
				<div class="view_cate st2" style="z-index: 10;">
					<div class="view_cate_num">
						<span class="hit font_num">${boardVO.hit }</span>
					</div>
				</div>
				<div class="view_tag">
					<c:forEach var="hashTagVO" items="${ hashTagVO }">
						<a href="">#${hashTagVO.name }</a>
					</c:forEach>
				</div>
				<div class="centeredcrop">
					<img id="main_thumbs"
						src="${pageContext.request.contextPath}/upload/${boardImg[0].fileName }"
						alt="사진 없음" class="">
				</div>
				<%-- <div class="user_info2">
					<a class="app_block_link_remove user_info2_pic"
						href="/profile/index.html?uid=syoung619"><img
						src="http://xn--9t4b29c1yncyf.com/data/item/test2/7YWM7Iqk7Yq4.jpg"></a>
					<span class="user_info2_name">${boardVO.userName } </span>
				</div> --%>
				<c:choose>
					<c:when test="${userLikeYn eq 0 }">
						<button id="like-btn" class="btn"
							style="width: 100px; height: 50px" value="0">
							<i id="like-icon" class="far fa-heart"></i>&nbsp Like <span
								id="like-count"> ${boardLikeCount}</span>
						</button>
					</c:when>
					<c:when test="${userLikeYn eq 1 }">
						<button id="like-btn" class="btn"
							style="width: 100px; height: 50px" value="1">
							<i id="like-icon" class="fas fa-heart" style="color: pink;"></i>&nbsp Like
							<span id="like-count"> ${boardLikeCount}</span>
						</button>
					</c:when>
				</c:choose>

			</div>
			<!-- <script type="text/javascript">
			$(document).ready(function() {
				  $('#like-btn').click(function() {
				    $('#like-icon').toggleClass('fas fa-heart');
				    $('#like-icon').toggleClass('far fa-heart');

				    if ($('#like-icon').hasClass('fas fa-heart')) {
				      $('#like-icon').css('color', 'pink');
				    } else {
				      $('#like-icon').css('color', '');
				    }
				  });
				});
			</script> -->

			<script type="text/javascript">
			$(document).ready(function() {
				$('#like-btn').click(function() {
					var like = $(this).val();
					
					$.ajax({
						url: '/board/like',
						method: 'POST',
						data: {
						    like: like,
						    userNum: ${user.userNum},
						    boardNum: ${boardVO.boardNum}
						},

						success: function(data) {
								var count = parseInt($('#like-count').text());
								if (like == '1') {
									count--;
									$('#like-icon').removeClass('fas fa-heart').addClass('far fa-heart');
									$('#like-btn').val('0');
								} else {
									count++;
									$('#like-icon').removeClass('far fa-heart').addClass('fas fa-heart').css('color', 'pink');
									$('#like-btn').val('1');
								}
								$('#like-count').text(count);
						},
						error: function() {
							alert('서버와 통신에 실패하였습니다.');
						}
					});
				});
			});
			</script>



			<div class="view2_summary st3">
				<h3>${boardVO.title }</h3>
				<div class="view2_summary_in" id="recipeIntro">
					${boardVO.introduce }</div>
				<div class="view2_summary_info">
				<c:choose>
				<c:when test="${boardVO.time eq 5}">
					<span class="view2_summary_info2">5분이내</span>				
				</c:when>
				<c:when test="${boardVO.time eq 10}">
					<span class="view2_summary_info2">10분이내</span>				
				</c:when>
				<c:when test="${boardVO.time eq 15}">
					<span class="view2_summary_info2">15분이내</span>				
				</c:when>
				<c:when test="${boardVO.time eq 20}">
					<span class="view2_summary_info2">20분이내</span>				
				</c:when>
				<c:when test="${boardVO.time eq 30}">
					<span class="view2_summary_info2">30분이내</span>				
				</c:when>
				<c:when test="${boardVO.time eq 60}">
					<span class="view2_summary_info2">60분이내</span>				
				</c:when>
				<c:when test="${boardVO.time eq 90}">
					<span class="view2_summary_info2">90분이내</span>				
				</c:when>
				<c:when test="${boardVO.time eq 120}">
					<span class="view2_summary_info2">2시간이내</span>				
				</c:when>
				<c:when test="${boardVO.time eq 999}">
					<span class="view2_summary_info2">2시간이상</span>				
				</c:when>
				</c:choose>
				
				<c:choose>
					<c:when test="${boardVO.diff eq 1 }">
					<span class="view2_summary_info3">아무나</span>				
					</c:when>
					<c:when test="${boardVO.diff eq 2 }">
					<span class="view2_summary_info3">초급</span>				
					</c:when>
					<c:when test="${boardVO.diff eq 3 }">
					<span class="view2_summary_info3">중급</span>				
					</c:when>
					<c:when test="${boardVO.diff eq 4 }">
					<span class="view2_summary_info3">고급</span>				
					</c:when>
					<c:when test="${boardVO.diff eq 5 }">
					<span class="view2_summary_info3">신의경지</span>				
					</c:when>
				</c:choose>
				</div>

			</div>

			<div class="blank_bottom"></div>

			<div class="cont_ingre2">
				<div class="best_tit">
					<b>재료</b><span>Ingredients</span>
				</div>
				<div class="ready_ingre3" id="divConfirmedMaterialArea">
					<ul>
						<b class="ready_ingre3_tt">[필수재료]</b>
						<li>${boardVO.ingre }</li>
					</ul>
					<ul>
						<b class="ready_ingre3_tt">[양념]</b>
						<li>${boardVO.source }</li>
					</ul>
					<ul>
						<b class="ready_ingre3_tt">[선택재료]</b>
						<li>${boardVO.choiceIngre }</li>
					</ul>
				</div>
			</div>

			<c:if test="${!empty boardVO.src && empty boardVideo[0].fileName}">
				<div class="view_movie">
					<h3>동영상</h3>
					<div class="movie_area">
						<div class="iframe_wrap">
							<iframe id="RecipeVideo" src="${boardVO.src}" frameborder="0"
								style="width: 700px; height: 422px;"> </iframe>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${empty boardVO.src && !empty boardVideo[0].fileName}">
				<div class="view_movie">
					<h3>동영상</h3>
					<div class="movie_area">
						<div class="iframe_wrap">
							<iframe id="RecipeVideo" src="${pageContext.request.contextPath}/upload/${boardVideo[0].fileName}" frameborder="0"
								style="width: 700px; height: 422px;"> </iframe>
						</div>
					</div>
				</div>
			</c:if>
			


			<div class="view_step">
				<div class="best_tit">
					<b>조리순서</b><span>Steps</span>
				</div>
				<c:forEach var="step" items="${step }" varStatus="status">
					<div id="stepDiv1" style="width: 1000px; margin-left: 5%"
						class="view_step_cont media step${status.count }">
						<div id="stepdescr1" class="media-body" style="width: 45%">${ step.content }</div>
						<div id="stepimg1" class="media-right">
							<img style="float: right;"
								src="${pageContext.request.contextPath}/upload/${step.fileName }">
						</div>
					</div>
				</c:forEach>

 				<div id=wrap>
					<div class=imgBox style="width:50%; height: 550px; padding: 50px 80px;">
						<img class="img on" style="width: 40%;"
							src="${pageContext.request.contextPath}/upload/${boardImg[0].fileName }"
							alt="">
						<c:forEach items="${boardImg }" var="boardImg" begin="1">
							<img class="img" style="width: 40%;"
								src="${pageContext.request.contextPath}/upload/${boardImg.fileName}"
								alt="">
						</c:forEach>
					</div>
					<div style="margin-left: 525px;">
						<button class="prev btn">이전</button>
						<button class="next btn">다음</button>
					</div>
				</div>

<%-- 				<div id=wrap>
					<div class=imgBox style="width:100%; height: 550px; padding: 50px 50px;">
						<img style="width: 99%; height: 99%;" src="${pageContext.request.contextPath}/upload/${boardImg[0].fileName }" alt="">
						<c:forEach items="${boardImg }" var="boardImg" begin="1">
							<img class="img" style="width: 40%;" src="${pageContext.request.contextPath}/upload/${boardImg.fileName}" alt="">
						</c:forEach>
					</div>
					<div style="margin-left: 525px;">
						<button class="prev btn">이전</button>
						<button class="next btn">다음</button>
					</div>
				</div> --%>

				<script type="text/javascript">
				 $(".prev").on("click", function (e) {
				      e.preventDefault();

				      // 이미지 현재의 위치
				      var imgOn = $(".imgBox").find(".on").index();
				      // 이미지 총 개수 
				      var imgLen = $(".imgBox .img").length;
				      
				      // imgBox안의 img 중 imgOn 번째의 on 클래스 삭제 
				      $(".imgBox .img").eq(imgOn).removeClass("on");
				      // imgBox안의 img 중 imgOn 번째 숨기기 
				      $(".imgBox .img").eq(imgOn).css("opacity", 0);
				      
				      //  이전의 위치로 돌아가야함으로
				      imgOn = imgOn -1;

				      if( imgOn < 0 ){
				        // 돌아가 위치가 -1일 경우 
				        // 이미지의 마지막으로 돌아간다
				        $(".imgBox .img").eq(imgLen -1).css("opacity", 1);
				        $(".imgBox .img").eq(imgLen -1).addClass("on");
				      }else{
				        // 돌아갈 위치가 -1이 아닌 경우
				        $(".imgBox .img").eq(imgOn).css("opacity", 1);
				        $(".imgBox .img").eq(imgOn).addClass("on");
				      }

				    });

				    $(".next").on("click", function (e) {
				      e.preventDefault();
				      // 위에 동일 
				      var imgOn = $(".imgBox").find(".on").index();
				      var imgLen = $(".imgBox .img").length;

				      // 위에 동일
				      $(".imgBox .img").eq(imgOn).removeClass("on");
				      $(".imgBox .img").eq(imgOn).css("opacity", 0);
				      
				      // 다음의 위치로 알아야 되기 때문에 
				      imgOn = imgOn + 1;
				      
				      if( imgOn === imgLen ){
				        // 다음의 위치가 총 개수보다 클 경우
				        // 처음의 위치로 돌아간다
				        $(".imgBox .img").eq(0).css("opacity", 1);
				        $(".imgBox .img").eq(0).addClass("on");
				      }else{
				        // 다음 위치가 있는 경우 
				        $(".imgBox .img").eq(imgOn).css("opacity", 1);
				        $(".imgBox .img").eq(imgOn).addClass("on");
				      }
				    });
				</script>

			</div>






			<!--/view_step -->

			<div class="view_step">
				<div class="best_tit">
					<b>레시피 작성자</b><span>About the writer</span>
				</div>
				<div class="view_profile">
					<div class="profile_pic"></div>
					<div class="profile_cont">
						<p class="cont_name">${boardVO.userName }</p>
					</div>
					<div style="float: right">
					
					<c:if test="${admin == 'Yes'}">
						<a href="${pageContext.request.contextPath}/admin">
						<button class="btn-lg btn-primary">목록</button>
						</a>
						<a href="javascript:removePost('M')">
						<button class="btn-lg btn-primary" style="background-color: #23527c; border:#23527c;">복원</button>
						</a>
					</c:if>
						<c:if test="${admin != 'Yes' }">
						<a href="${pageContext.request.contextPath}/board/list">
						<button class="btn-lg btn-primary">목록</button>
					</a>
					</c:if>
					<c:if test="${admin != 'Yes' and user.userNum == boardVO.userNum}">
							<a href="${pageContext.request.contextPath}/board/modify_redirect?boardNum=${boardVO.boardNum}">
							<button class="btn-lg btn-primary" style="background-color: #23527c; border:#23527c;">수정</button>
							</a>
					</c:if>
					<c:if test="${admin == 'Yes'}">
							<a href="javascript:removePost('Y')">
							<button class="btn-lg btn-default" style="background-color: gray; color: white;">삭제</button>
							</a>
					</c:if>
					
					<c:if test="${admin != 'Yes' && (user.adminYn == 'Y' || user.userNum == boardVO.userNum)}">
							<a href="javascript:removePost('N')">
							<button class="btn-lg btn-default" style="background-color: gray; color: white;">삭제</button>
							</a>
					</c:if>
					</div>
				</div>
			</div>


			<a name="commentLists"></a>
			<div class="view_reply">
				<div class="reply_tit">
					댓글 <span id="recipeCommentListCount">${boardVO.commentCnt }</span>
				</div>
				<div id="recipeCommentList_1">
					<c:forEach var="comment" items="${commentsVO}">
						<!-- 여기 -->
						<div class="media reply_list">
							<div class="media-left"></div>
							<div class="media-body">
								<div class="media-heading">
									<b class="info_name_m">${comment.userName}</b>${comment.regDt}<span>|
									</span> <a href="javascript:void(0);"
										onclick="doCommentReply(${comment.commentNum})">답글</a>

									<c:if test="${user.userNum == comment.userNum }">
										<span> |</span>
										<a href="javascript:void(0);"
											onclick="doCommentModify(${comment.commentNum})">수정</a>
										<span> |</span>
										<form action="comment/remove" style="display: inline;" method="post"
											onsubmit="return confirm('댓글을 삭제 하시겠습니까?')">
											<input type="hidden" name="boardNum"
												value="${boardVO.boardNum }"> <input type="hidden"
												name="commentNum" value="${comment.commentNum }">
											<button type="submit"
												style="border: none; background-color: white;">삭제</button>
											<span> |</span>
										</form>
									</c:if>
									<!-- 여기 -->
								</div>
								<span id="comment${ comment.commentNum }">${comment.content}</span>
							</div>

							<div id="reply${comment.commentNum}"
								style="padding-left: 50px; display: none;">
								<div id="re_reply_div">
									<div class="reply_write">
										<form action="cocomment/register" method="post" name="commentForm" id="commentForm">
											<div class="input-group" style="float: left; width: 640px;">
												<textarea name="content" class="form-control"
													placeholder="답글을 남겨주세요"
													style="height: 100px; width: 100%; resize: none;"></textarea>
												<input type="hidden" value="${boardVO.boardNum }"
													name="boardNum"> <input type="hidden"
													value="${comment.commentNum }" name="commentNum"> <input
													type="hidden" value="${user.userNum }" name="userNum">
												<span class="input-group-btn">
												
 													<button class="btn btn-default" type="submit"
														style="height: 100px; width: 100px;">등록</button> 
												</span>
											</div>
										</form>
									</div>
								</div>
							</div>

							<c:forEach var="coco" items="${cocoVO}">
								<c:if test="${comment.commentNum == coco.commentNum}">
									<div class="media reply_list"
										style="padding-left: 50px; border-bottom: 0px">
										<div class="media-left"></div>
										<div class="media-body">
											<div class="media-heading">
												<b class="info_name_f">${coco.userName}</b>${coco.regDt}

												<c:if test="${user.userNum == coco.userNum }">
													<span>| </span>
													<a href="javascript:void(0);"
														onclick="doCoCommentModify(${coco.cocommentNum})">수정</a>
													<span> |</span>
													<form action="cocomment/remove" style="display: inline;"
														method="post" onsubmit="return confirm('답글을 삭제 하시겠습니까?')">
														<input type="hidden" name="boardNum"
															value="${boardVO.boardNum }"> <input
															type="hidden" name="cocommentNum"
															value="${coco.cocommentNum }">
														<button type="submit"
															style="border: none; background-color: white;">삭제</button>
													</form>
													<span> |</span>
												</c:if>

											</div>
											<b>${comment.userName}</b> <span
												id="cocomment${coco.cocommentNum }">${coco.content}</span>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="reply_write">
				<form action="comment/register" id="reply_confirm" method="post" onsubmit="return userSubmit();">
					<input type="hidden" value="${user.userNum }" id="userNum"
						name="userNum"> <input type="hidden"
						value="${boardVO.boardNum}" id="boardNum" name="boardNum">

					<button class="btn btn-default" type="submit"
						style="margin-right: 50px; height: 100px; width: 100px; float: right;">등록</button>
					<!-- <button class="btn btn-default" type="submit" onclick="return userSubmit();"
						style="margin-right: 50px; height: 100px; width: 100px; float: right;">등록</button> -->
					<textarea id="content" name="content" class="form-control"
						placeholder="무엇이 궁금하신가요? 댓글을 남겨주세요."
						style="margin-left: 50px; height: 100px; width: 80%; resize: none;"></textarea>
				</form>
			</div>
		</div>
	</div>

</body>
</html>