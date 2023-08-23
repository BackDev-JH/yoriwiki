<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" class="">
<head>
<title>요리를 즐겁게~ 요리위키</title>
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

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
	function doSubmit(q_mode) {
		    if (q_mode == 'save') {
		    	var frm = document.insFrm;
		    	var check = false;
		    	if(frm.title.value == '' || frm.introduce.value == '' || frm.category.value == '' ||
		    	frm.time.value == '' || frm.diff.value == '' || frm.ingre.value == '' || frm.source.value == '' || frm.choiceIngre.value == '') {
		    		check = true;
		    	}
		    	
/* 		    	if(frm.cok_video_url.value == '' && document.getElementById('video').src == '' && (document.getElementById('divMainPhotoHolder').src == 'https://recipe1.ezmember.co.kr/img/pic_none4.gif' || document.getElementById('divMainPhotoHolder').src == 'https://img.youtube.com/vi/undefined/0.jpg')) {
		    		check = true;
		    	} */
		    	
		    	var children = document.getElementById('divStepArea').children;
		    	
		    	for(var i = 1; i <= children.length; i++) {
		    		if(document.getElementById("step_text_" + i).value.trim() == '') {
		    			check = true;
		    			break;
		    		}
		    		
		    		if(document.getElementById('q_step_file_' + i).value == '') {
		    			check = true;
		    			break;
		    		}
		    	}
		    	
		    	if(document.querySelector('#workPhotoHolder_1').src == 'https://recipe1.ezmember.co.kr/img/pic_none3.gif') {
		    		check = true;
		    	}
		    	
		    	
		    	if(document.querySelector('.tagit.ui-widget.ui-widget-content.ui-corner-all').childElementCount == 1) {
		    		check = true;
		    	}
		    	
		    	if(check) {
		    		alert('빈 칸이 존재합니다.')
		    		return;
		    	}
		    	
		        if (confirm("저장하시겠습니까?")) {
		            isSubmit = true;
		            $("#insFrm").submit();
		        }
		        else {
		            isSubmit = false;
		        }
		    } else if (q_mode == 'save_preview') {
		        if (confirm("미리보기를 하려면 저장하셔야 합니다. 저장하시겠습니까?")) {
		            isSubmit = true;
		            $("#insFrm").submit();
		        }
		        else {
		            isSubmit = false;
		        }
		    } 
	};
	
	
	function uploadCheck(obj, gb) {
		var file = obj.files[0];
		if (file == "") 
		{
			return; 
		}
		
		if(gb == 'picture') {
		  var fileName = file.name;
	      var fileExt = fileName.substring(fileName.lastIndexOf(".") + 1);
	      var reg = '${picture.allowedExtensions}'; // 업로드 가능 확장자.
	      reg = reg.split(',');
	      
	      for(var i = 0; i < reg.length; i++) {
	    	  reg[i] = reg[i].substring(reg[i].indexOf(".")+1, reg[i].length);
	      }
	      
          reg = reg.join('|');
          var temp = reg;
          reg = new RegExp(reg, 'i');
          
	      if (reg.test(fileExt) == false) {
	          alert("첨부파일은 " + temp + " 로 된 이미지만 가능합니다.");
	          obj.value = '';
	          return;
	      }
	      
	      var maxSize = ${picture.maxSize};
	      
	      if(file.size > maxSize) {
	    	  alert(maxSize + "byte 이하의 파일만 업로드 가능합니다. \n현재 파일크기: " + file.size + 'byte' );
	    	  obj.value = '';
		      return;
	      }
	      
		} else if(gb == 'video') {
			  var fileName = file.name;
		      var fileExt = fileName.substring(fileName.lastIndexOf(".") + 1);
		      var reg = '${video.allowedExtensions}'; // 업로드 가능 확장자.
		      reg = reg.split(',');
		      
		      for(var i = 0; i < reg.length; i++) {
		    	  reg[i] = reg[i].toString().substring(reg[i].toString().indexOf(".")+1, reg[i].length);
		      }
		      
	          reg = reg.join('|');
	          var temp = reg;
	          reg = new RegExp(reg, 'i');
		      
		      if (reg.test(fileExt) == false) {
		    	  alert("첨부파일은 " + temp + " 로 된 동영상만 가능합니다.");
		          obj.value = '';
		          return;
		      }
		      
		      var maxSize = ${video.maxSize};
		      if(file.size > maxSize) {
		    	  alert(maxSize + "byte 이하의 파일만 업로드 가능합니다. \n현재 파일크기: " + file.size + 'byte' );
		    	  obj.value = '';
			      return;
		      }
		}
	}
	
	function delWorkPhoto(step) {
		 if(step == 1) {
			 $("#divMainPhotoHolder").attr("src", "https://recipe1.ezmember.co.kr/img/pic_none3.gif");
		 }
		 
		 $("#q_work_file_" + step).val('');
		 $("#work_photo_" + step).val('');
         $("#new_work_photo_" + step).val('');
         $("#del_work_photo_" + step).val('1');
         $("#workPhotoHolder_" + step).attr("src", "https://recipe1.ezmember.co.kr/img/pic_none3.gif"); 
         
	}
	
	function deleteVideoFile() {
		document.getElementById('videoPhotoHolder').src ='https://recipe1.ezmember.co.kr/img/pic_none5.gif';
		document.getElementById('videoPhotoHolder').readOnly = false;
		document.getElementById('cok_video_url').readOnly = false;
		document.getElementById('cok_video_url').value = '';
		document.getElementById('cok_video_url').setAttribute('prev_url', '');
		document.getElementById('video').src = "";
		document.getElementById('videoBtn').disabled = '';
		
		if($('#q_video_file')[0].files.length != 0) {
			document.getElementById('videoPhotoHolder').style.display = "";
			$('#video')[0].style.display = 'none';
			document.getElementById('q_video_file').value = '';
		} 
	};

    function delStep(step) {
    	if(step === 1)
    		return;
    	removeEvent();
        $("#divStepArea [id=divStepItem_" + step + "]").fadeOut(200, function () {
            $("#divStepArea [id=divStepItem_" + step + "]").remove();
            remakeStepNumber();
        });
    }
	
    function browseStepFile(step) {
    	$("#divStepArea [id=q_step_file_" + step + "]").click();
    };
    
    function browseWorkFile(num) {
    	$('#q_work_file_' + num).click();
    };
    
    function addStep() {
    	var step = document.querySelector('#divStepArea');
    	var stepCnt = step.childElementCount + 1;
    	
    	if(stepCnt > ${picture.maxUploadCount}) {
    		alert('업로드 허용 개수를 초과하였습니다. \n (최대 값: ' + (stepCnt-1) + ')');
    		return;
    	}
    	
    	var stepElement = document.getElementById('divStepItem_1').cloneNode(true);
    	
    	stepElement.id = 'divStepItem_' + stepCnt;
    	stepElement.querySelector('#step_text_1').value = '';
    	stepElement.querySelector('#stepPhotoHolder_1').src = 'https://recipe1.ezmember.co.kr/img/pic_none2.gif';
    	stepElement.querySelector('#q_step_file_1').value = '';
    	stepElement.querySelector("textarea[name='step_text[]']").textContent = '';
    	
    	var children = stepElement.children;
    	for (var i = 0; i < children.length; i++) {
    		if(children[i].id != '') {
        		var idStr = children[i].id.split('_')[0];
        		idStr += '_' + stepCnt;
        		children[i].id = idStr;    			
    		}
    	};
    	
    	stepElement.querySelector('#step_text_1').id = 'step_text_' + stepCnt;
    	children = stepElement.querySelectorAll('#divStepUpload_' + stepCnt + ' > *');
    	
    	for (var i = 0; i < children.length; i++) {
    		if(children[i].id == 'divStepPhotoBox_1') {
    			children[i].id = 'divStepPhotoBox_' + stepCnt;
    			children[i].querySelector('#stepPhotoHolder_1').removeAttribute("onclick");
    			children[i].querySelector('#stepPhotoHolder_1').setAttribute("onclick", "browseStepFile(" + stepCnt + ")");
    			children[i].querySelector('#stepPhotoHolder_1').id = 'stepPhotoHolder_' + stepCnt;
    		}
    		else if(children[i].id != '') {
        		var idStr = children[i].id.split('o_')[0];
        		idStr += 'o_' + stepCnt;
        		children[i].id = idStr;
    		}
    	};
    	
    	stepElement.querySelector('#q_step_file_1').name = 'q_step_file_' + stepCnt;
    	stepElement.querySelector('#q_step_file_1').id = 'q_step_file_' + stepCnt;
    	stepElement.querySelector('#divStepNum_' + stepCnt).innerText = 'Step' + stepCnt;
    	
    	document.getElementById('divStepItem_' + (stepCnt - 1)).after(stepElement);
    	
    	$('#q_step_file_' + stepCnt).change((e) => {
			 var input = $('#q_step_file_' + stepCnt)[0];
			 var fileReader = new FileReader();
			 uploadCheck(input, 'picture');
			 
			 fileReader.onload = function (e) {
				$('#stepPhotoHolder_'+ stepCnt)[0].src = e.target.result;
			 };
			 
			 if(input.files && input.files[0]) {
			 	fileReader.readAsDataURL(input.files[0]);
			 }
		});
    	
  	  $("#divStepArea [id=divStepItem_" + stepCnt + "]")
  	     .mouseover( function () {
        	  $(this).find('.step_btn').show();
      	} )
      	 .mouseout( function () {
      	    $(this).find('.step_btn').hide();
      } );
  	  
  	  
  	  $("#divStepItem_" + stepCnt+ " [id=divStepBtn_" + stepCnt + "]").children().each(function() {
  		  if($(this).attr('href') != 'javascript:void(0)') {
  			$(this).attr('href', $(this).attr('href').split('(')[0] + '(' + stepCnt + ')');
  		  }
  	  	} 
  	  );
    }
    
	 // 키 맵핑
    function registerNewTagEvent(tagitNew) {
      $(tagitNew).keydown(function(e) {
        if (e.keyCode == 13 || e.keyCode == 9) {
          $(this).trigger($.Event('keydown', { keyCode: 188 }));
          e.preventDefault();
        }
      });
    }
	 
	function removeEvent() {
		 $("#divStepArea [id^=divStepItem_]").each(function (idx, obj) {
	    		$('#q_step_file_' + (idx + 1)).unbind('change');
		 });
	 } 
	
	function addEvent() {
		$("#divStepArea [id^=divStepItem_]").each(function (idx, obj) {
			$('#q_step_file_' + (idx+1)).change(() => {
		  			 var input = $('#q_step_file_'+(idx+1))[0]; 
		  			 var fileReader = new FileReader();
		  			uploadCheck(input, 'picture');
		  			 
		  			 fileReader.onload = function (e) {
		  				$('#stepPhotoHolder_' + (idx+1))[0].src = e.target.result;
		  			 };
		  			 
		  			 if(input.files && input.files[0]) {
		  			 	fileReader.readAsDataURL(input.files[0]);
		  			 }
			});	
		});
	}
	
    function remakeStepNumber() {
        $("#divStepArea [id^=divStepItem_]").each(function (idx, obj) {
            var step = $(this).prop('id').replace('divStepItem_', '');
            $("#divStepArea [id=divStepNum_" + step + "]").html('Step' + (idx + 1));
            
            
        	$("#divStepItem_" + (idx + 1)+ " [id=divStepBtn_" + step + "]").children().each(function() {
           		if($(this).attr('href') != 'javascript:void(0)') {
           			$(this).attr('href', $(this).attr('href').split('(')[0] + '(' + (idx + 1) + ')');
           			}
           		} 
        	);
           			
            var children = $(this).children()[3].children;
            
            for(var i = 0; i < children.length; i++) {
       		  	if(children[i].getAttribute('href') != 'javascript:void(0)') {
       			   children[i].setAttribute('href',children[i].getAttribute('href').split('(')[0] + '(' + (idx + 1) + ')');
       		  	}
            };
          			
            
			children = $(this).children()[2].children;
			
            children[4].querySelector('#q_step_file_' + step).name = 'q_step_file_' + (idx + 1);
            children[4].querySelector('#q_step_file_' + step).id = 'q_step_file_' + (idx + 1);
            
          	for (var i = 0; i < children.length; i++) {
        		if(children[i].id == ('divStepPhotoBox_' + step)) {
        			children[i].id = 'divStepPhotoBox_' + (idx + 1);
        			children[i].querySelector('#stepPhotoHolder_' + step).removeAttribute("onclick");
        			children[i].querySelector('#stepPhotoHolder_' + step).setAttribute("onclick", "browseStepFile(" + (idx + 1) + ")");
        			children[i].querySelector('#stepPhotoHolder_' + step).id = 'stepPhotoHolder_' + (idx + 1);
        		}
        		else if(children[i].id != '') {
            		var idStr = children[i].id.split('o_')[0];
            		idStr += 'o_' + (idx + 1);
            		children[i].id = idStr;
        		}
        	};
        	
        	$(this).children()[1].querySelector('#step_text_' + step).id = 'step_text_' + (idx + 1);
        	$(this).children()[0].id = 'divStepNum_' + (idx + 1);
        });
       			 
        $("#divStepArea").children().each(function (idx, obj) {
        	$(this)[0].id = $(this)[0].id.split('_')[0] + '_' + (idx + 1);
        	for(var i = 0; i < $(this)[0].children.length; i++) {
        		$(this)[0].children[i].id = $(this)[0].children[i].id.split('_')[0] + '_' + (idx+ 1);
        	};
        });
        
        addEvent();
    }
	
    
    
	$(document).ready(function() {
		registerNewTagEvent($('.tagit-new'));
		
		$("#divStepArea [id=divStepItem_1]").mouseover(function () {
	             $(this).find('.step_btn').show();
	         }).mouseout(function () {
	             $(this).find('.step_btn').hide();
	         });
		
		$("#divWorkArea [id^=divWorkUpload_]").each( function() {
			$(this).mouseover(function () {
	            $(this).find('.pic_del').show(); 
	            }
			).mouseout(function () {
	            $(this).find('.pic_del').hide();
			})
		});
		
	    $("#divStepArea [id=divStepItem_" + 1 + "] .moveUp").click(function () {
	           if ($(this).parents('.step').prevAll('.step').length !== 0) {
	               $(this).parents('.step').insertBefore($(this).parents('.step').prev());
	               remakeStepNumber();
	           }
	       });
	    
	    $("#divStepArea [id=divStepItem_" + 1 + "] .moveDown").click(function () {
	            if ($(this).parents('.step').nextAll('.step').length !== 0) {
	                $(this).parents('.step').insertAfter($(this).parents('.step').next());
	                remakeStepNumber();
	            }
	        });
			
		$('#q_step_file_1').change(() => {
			 var input = $('#q_step_file_1')[0]; 
			 var fileReader = new FileReader();
			 uploadCheck(input, 'picture');
			 
			 fileReader.onload = function (e) {
				$('#stepPhotoHolder_1')[0].src = e.target.result;
			 };
			 
			 if(input.files && input.files[0]) {
			 	fileReader.readAsDataURL(input.files[0]);
			 }
		});
		
		$('#q_video_file').change( () => {
			var inputFile = $('#q_video_file')[0]; 
			var video = $('#video')[0];
			uploadCheck(inputFile, 'video');
			
			if(inputFile.files.length != 0) {
			    var videourl = URL.createObjectURL(inputFile.files[0]);
			    $('#videoPhotoHolder')[0].style.display = 'none';
			    document.getElementById('cok_video_url').readOnly = 'true';
			    document.getElementById('videoBtn').disabled = 'disabled';
			    video.style.display = "";
			    video.setAttribute("src", videourl);
			    video.play();
			}
		});
			
		$('#cok_video_url').blur(function() {
			var area = document.getElementById('cok_video_url');
			if(area.value != '' && area.value != area.getAttribute('prev_url')) {
				var id = area.value.split('v=');
				id = id[1];
				var url = 'https://img.youtube.com/vi/' + id + '/0.jpg';
				document.getElementById('videoPhotoHolder').src = url;
				area.setAttribute('prev_url', area.value);	
				document.getElementById('src').value = area.value;
				
				if(document.getElementById('videoPhotoHolder').src == "https://img.youtube.com/vi/undefined/0.jpg") {
					document.getElementById('videoBtn').disabled = '';
					alert("유효하지 않는 주소입니다.");
					
				} else {
					document.getElementById('videoBtn').disabled = 'disabled';
				}
			}
			
			if(area.value == '') {
				document.getElementById('videoPhotoHolder').src = "https://recipe1.ezmember.co.kr/img/pic_none5.gif";
				area.setAttribute('prev_url', '');	
			}
		});
		
		$('#q_work_file_1').change( () => {
			 var input = $('#q_work_file_1')[0]; 
			 var fileReader = new FileReader();
			 uploadCheck(input, 'picture');
			 
			 fileReader.onload = function (e) {
				$('#workPhotoHolder_1')[0].src = e.target.result;
				$('#divMainPhotoHolder')[0].src = e.target.result;
			 };
			 
			 if(input.files && input.files[0]) {
			 	fileReader.readAsDataURL(input.files[0]);
			 }
		});
		
		$('#q_work_file_2').change( () => {
			 var input = $('#q_work_file_2')[0]; 
			 var fileReader = new FileReader();
			 uploadCheck(input, 'picture');
			 
			 fileReader.onload = function (e) {
				$('#workPhotoHolder_2')[0].src = e.target.result;
			 };
			 
			 if(input.files && input.files[0]) {
			 	fileReader.readAsDataURL(input.files[0]);
			 }
		});
		
		$('#q_work_file_3').change( () => {
			 var input = $('#q_work_file_3')[0]; 
			 var fileReader = new FileReader();
			 uploadCheck(input, 'picture');
			 
			 fileReader.onload = function (e) {
				$('#workPhotoHolder_3')[0].src = e.target.result;
			 };
			 
			 if(input.files && input.files[0]) {
			 	fileReader.readAsDataURL(input.files[0]);
			 }
		});
		
		$('#q_work_file_4').change( () => {
			 var input = $('#q_work_file_4')[0]; 
			 var fileReader = new FileReader();
			 uploadCheck(input, 'picture');
			 
			 fileReader.onload = function (e) {
				$('#workPhotoHolder_4')[0].src = e.target.result;
			 };
			 
			 if(input.files && input.files[0]) {
			 	fileReader.readAsDataURL(input.files[0]);
			 }
		});

		
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
					str2 += ',';
				
				$('#mySingleFieldTags').val(str2 + str);
				
				var sp = document.createElement('span');
				sp.setAttribute('class', 'tagit-label');
				sp.innerText = str;
				
				var at = document.createElement('a');
				at.setAttribute('class', 'tagit-close');
				
				
				at.addEventListener('click', function(e) {
					var parent = this.parentNode;
					var tempStr = parent.children[0].innerText;
					var arr = document.getElementById('mySingleFieldTags').value.split(',');
					
				    for(var i = 0; i < parent.parentNode.childNodes.length; i++) {
				    if (parent.parentNode.childNodes[i] === parent) {
				    	arr.splice(arr.indexOf(tempStr), 1);
				    	parent.remove();
				    	break;
				    	}
				    };
				    
				    document.getElementById('mySingleFieldTags').value = arr.join(',');
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
	<jsp:include page="../include/header.jsp" flush="false"/>
</head>

<body>
	<link rel="stylesheet" type="text/css"
		href="https://recipe1.ezmember.co.kr/static/css/jquery-ui-1.11.4_201507011.css">

	<a href="#" id="btnGogoTop" class="rmenu_top" style="display: none;">
		<span class="glyphicon glyphicon-menu-up"></span>
	</a>
	<style>
@media ( max-width :1400px) {
	.partners_banner {
		display: none;
	}
}
</style>

	<%-- <div class="nav_etc" style="margin-bottom: 30px;">
		<a href="/index.html"> <img
			src="${pageContext.request.contextPath}/img/yoriwiki.png"
			style="max-width: 10%; height: 100% !important;">
		</a>
	</div> --%>

	<link rel="stylesheet" type="text/css"
		href="https://recipe1.ezmember.co.kr/static/css/jquery-ui-1.11.4_201507011.css">
	<style>
.tagit {
	margin: 0 0 0 0 !important;
	padding: 5px 8px !important;
	border-radius: 0 !important;
}
</style>
	<form name="insFrm" id="insFrm" method="post"
		action="${pageContext.request.contextPath}/board/register"
		enctype="multipart/form-data">
		<input type="hidden" name="q_mode" id="q_mode" value="save"> <input
			type="hidden" name="cok_sq_board" id="cok_sq_board" value="">
		<input type="hidden" name="newUploadFiles" value=""> <input
			type="hidden" name="cok_reg_id" id="cok_reg_id" value="37761413">
		<input type="hidden" name="cok_reg_type" id="cok_reg_type"
			value="input">
		<link rel="stylesheet" type="text/css"
			href="https://recipe1.ezmember.co.kr/static/css/jquery.tagit.css">
		<style>
.note-editor .note-dropzone {
	opacity: 0 !important;
}

ul.tagit {
	width: 620px;
	vertical-align: middle;
}

ul.tagit input[type="text"] {
	width: 100%;
	height: 30px;
}
</style>
		<div class="container recipe_regi">
			<div class="regi_center">
				<div class="regi_title">레시피 등록</div>
				<div class="cont_box pad_l_60">
					<div id="divMainPhotoUpload" class="cont_pic2">
						<input type="hidden" name="main_photo" id="main_photo" value="">
						<input type="hidden" name="new_main_photo" id="new_main_photo"
							value=""> <input type="hidden" name="del_main_photo"
							id="del_main_photo" value="">
						<div style="position: absolute; left: -3000px">

							<!--  메인 파일 저장 input 태그 -->
							<input type="file" name="q_main_file" id="q_main_file"
								file_gubun="main" accept="jpeg,png,gif"
								style="width: 0px; height: 0px; font-size: 0px;">

						</div>

						<div id="divMainPhotoBox" is_over="0">
							<a id="btnDelMainPhoto" href="javascript:delWorkPhoto(1)"
								class="pic_del" style="display: none;"></a> <img
								id="divMainPhotoHolder" onclick="browseWorkFile(1)"
								src="https://recipe1.ezmember.co.kr/img/pic_none4.gif"
								style="width: 250px; height: 250px; cursor: pointer">
						</div>
					</div>
					<div class="cont_line">
						<p class="cont_tit4">레시피 제목</p>
						<input type="text" name="title" id="title" value=""
							class="form-control" placeholder="예) 소고기 미역국 끓이기"
							style="width: 610px;">
					</div>
					<div class="cont_line pad_b_25">
						<p class="cont_tit4">요리소개</p>
						<textarea name="introduce" id="introduce"
							class="form-control step_cont"
							placeholder="이 레시피의 탄생배경을 적어주세요. 예) 남편의 생일을 맞아 소고기 미역국을 끓여봤어요. 어머니로부터 배운 미역국 레시피를 남편의 입맛에 맞게 고안했습니다."
							style="height: 100px; width: 610px; resize: none;"></textarea>
					</div>

					<div class="cont_line pad_b_25">
						<p class="cont_tit4">동영상</p>

						<input type="hidden" name="video_photo" id="video_photo" value="">
						<input type="hidden" name="new_video_photo" id="new_video_photo"
							value=""> <input type="hidden" name="del_video_photo"
							id="del_video_photo" value=""> <input type="hidden"
							name="src" id="src" value="">

						<textarea name="cok_video_url" id="cok_video_url"
							class="form-control step_cont" prev_url=""
							placeholder="동영상이 있으면 주소를 입력하세요.(Youtube,네이버tvcast,다음tvpot 만 가능) 예)http://youtu.be/lA0Bxo3IZmM"
							style="height: 100px; width: 380px; resize: none;"></textarea>

						<div style="position: absolute; left: -3000px">
							<input type="file" name="q_video_file" id="q_video_file"
								file_gubun="video" accept="${video.allowedExtensions }"
								style="width: 0px; height: 0px; font-size: 0px;" text="">
						</div>
						<div id="divVideoPhotoBox" is_over="0" class="thumb_m">
							<video id="video"
								style="display: none; width: 177px; height: 100px; vertical-align: middle;"></video>
							<img id="videoPhotoHolder"
								src="https://recipe1.ezmember.co.kr/img/pic_none5.gif"
								style="width: 177px; height: 100px;">
						</div>
						<div style="text-align: center">
							<button type="button" id="videoBtn"
								onclick="$('#q_video_file').click();">업로드</button>
							<button id="videoDeleteBtn" onclick="deleteVideoFile(this);"
								type="button">삭제</button>
						</div>

					</div>

					<div class="cont_line">
						<p class="cont_tit4">카테고리</p>
						<select name="category" id="category" text="종류별">
							<option value="">종류별</option>
							<option value="63">밑반찬</option>
							<option value="56">메인반찬</option>
							<option value="54">국/탕</option>
							<option value="55">찌개</option>
							<option value="60">디저트</option>
							<option value="53">면/만두</option>
							<option value="52">밥/죽/떡</option>
							<option value="61">퓨전</option>
							<option value="57">김치/젓갈/장류</option>
							<option value="58">양념/소스/잼</option>
							<option value="65">양식</option>
							<option value="64">샐러드</option>
							<option value="68">스프</option>
							<option value="66">빵</option>
							<option value="69">과자</option>
							<option value="59">차/음료/술</option>
							<option value="62">기타</option>
						</select> <span class="guide" style="margin: -22px 0 0 146px;">분류를
							바르게 설정해주시면, 이용자들이 쉽게 레시피를 검색할 수 있어요.</span>
					</div>
					<div class="cont_line">
						<p class="cont_tit4">요리정보</p>
						시간 <select name="time" id="time" text="요리시간">
							<option value="">시간</option>
							<option value="5">5분이내</option>
							<option value="10">10분이내</option>
							<option value="15">15분이내</option>
							<option value="20">20분이내</option>
							<option value="30">30분이내</option>
							<option value="60">60분이내</option>
							<option value="90">90분이내</option>
							<option value="120">2시간이내</option>
							<option value="999">2시간이상</option>
						</select> <span class="pad_l_30">난이도 </span> <select name="diff" id="diff"
							text="난이도">
							<option value="">난이도</option>
							<option value="1">아무나</option>
							<option value="2">초급</option>
							<option value="3">중급</option>
							<option value="4">고급</option>
							<option value="5">신의경지</option>
						</select>
					</div>
				</div>
				<!--/cont_box-->
				<div class="cont_box pad_l_60">
					<span class="guide mag_b_15" style="width: 100%;">재료가 남거나
						부족하지 않도록 정확한 계량정보를 적어주세요.</span>
					<div class="mag_b_25 ui-sortable" id="divMaterialGroupArea">
						<input type="text" name="ingre" placeholder="필수 재료" />
					</div>
					<div class="mag_b_25 ui-sortable" id="divMaterialGroupArea">
						<input type="text" name="source" placeholder="양념" />
					</div>
					<div class="mag_b_25 ui-sortable" id="divMaterialGroupArea">
						<input type="text" name="choiceIngre" placeholder="선택 재료" />
					</div>

				</div>

				<div class="cont_box pad_l_60">

					<!-- step 파일 박스 -->
					<input type="file" name="file" id="multifile_1" file_gubun="step"
						style="display: none;" multiple="">

					<p class="cont_tit3">
						요리순서
						<!-- 						<button type="button" onclick="document.getElementById('multifile_1').click();" class="btn-sm btn-default">
							<span class="glyphicon glyphicon-plus"></span> 순서사진 한번에 넣기
						</button> -->
					</p>

					<span class="guide mag_b_15"><b>요리의 맛이 좌우될 수 있는 중요한 부분은
							빠짐없이 적어주세요.</b><br> 예) 10분간 익혀주세요 ▷ 10분간 약한불로 익혀주세요.<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마늘편은 익혀주세요 ▷ 마늘편을 충분히 익혀주셔야 매운
						맛이 사라집니다.<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;꿀을 조금 넣어주세요
						▷ 꿀이 없는 경우, 설탕 1스푼으로 대체 가능합니다. </span>

					<div id="divStepArea" class="ui-sortable">
						<div id="divStepItem_1" class="step">
							<p id="divStepNum_1" class="cont_tit2_1 ui-sortable-handle"
								style="cursor: pointer" data-original-title="" title="">Step1</p>
							<div id="divStepText_1" style="display: inline-block">
								<textarea name="step_text[]" id="step_text_1"
									class="form-control step_cont"
									placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요."
									style="height: 160px; width: 430px; resize: none;"></textarea>
							</div>
							<div id="divStepUpload_1" style="display: inline-block">
								<input type="hidden" name="step_no[]" id="step_no_1" value="">
								<input type="hidden" name="step_photo[]" id="step_photo_1"
									value=""> <input type="hidden" name="new_step_photo[]"
									id="new_step_photo_1" value=""> <input type="hidden"
									name="del_step_photo[]" id="del_step_photo_1" value="">

								<div style="position: absolute; left: -3000px">
									<!-- <input type="file" name="q_step_file_1" id="q_step_file_1"
										file_gubun="step" accept="jpeg,png,gif"
										style="display:; width: 0px; height: 0px; font-size: 0px;"
										text=""> -->
									<input type="file" name="q_step_file_1" id="q_step_file_1"
										file_gubun="step" accept="${picture.allowedExtensions}"
										style="display:; width: 0px; height: 0px; font-size: 0px;"
										text="">
								</div>
								<div id="divStepPhotoBox_1" is_over="0">
									<img id="stepPhotoHolder_1" onclick="browseStepFile(1)"
										src="https://recipe1.ezmember.co.kr/img/pic_none2.gif"
										width="160" height="160" style="cursor: pointer">
								</div>
							</div>
							<div id="divStepBtn_1" class="step_btn" style="display: none;">
								<!-- 								
								<a href="javascript:void(0)">
								<span class="glyphicon glyphicon-chevron-up moveUp"></span>
								</a> 
								<a href="javascript:void(0)">
								<span class="glyphicon glyphicon-chevron-down moveDown">
								</span>
								</a> 
								<a href="javascript:adjustStep(1)">
								<b>맞춤</b>
								</a>  
								
-->
								<a href="javascript:addStep(1)"> <span
									class="glyphicon glyphicon-plus"></span>
								</a> <a href="javascript:delStep(1)"> <span
									class="glyphicon glyphicon-remove"></span></a>
							</div>
						</div>
					</div>


					<!-- step template -->
					<div id="divStepTemplate" style="display: none">
						<div id="divStepItem_STEP" class="step">
							<p id="divStepNum_STEP" class="cont_tit2_1"
								style="cursor: pointer">Step 1</p>
							<div id="divStepText_STEP" style="display: inline-block">
								<textarea name="step_text[]" id="step_text_STEP"
									class="form-control step_cont" placeholder=""
									style="height: 160px; width: 430px; resize: none;"></textarea>
							</div>
							<div id="divStepUpload_STEP" style="display: inline-block">
								<input type="hidden" name="step_no[]" id="step_no_STEP" value="">
								<input type="hidden" name="step_photo[]" id="step_photo_STEP"
									value=""> <input type="hidden" name="new_step_photo[]"
									id="new_step_photo_STEP" value=""> <input type="hidden"
									name="del_step_photo[]" id="del_step_photo_STEP" value="">
								<div style="position: absolute; left: -3000px">
									<input type="file" name="q_step_file_STEP"
										id="q_step_file_STEP" file_gubun="step" accept="jpeg,png,gif"
										style="display:; width: 0px; height: 0px; font-size: 0px;"
										text="">
								</div>
								<div id="divStepPhotoBox_STEP" is_over="0">
									<img id="stepPhotoHolder_STEP" onclick="browseStepFile(__STEP)"
										src="https://recipe1.ezmember.co.kr/img/pic_none2.gif"
										width="160" height="160" style="cursor: pointer">
								</div>
							</div>
							<div id="divStepBtn_STEP" class="step_btn" style="display: none">
								<a href="javascript:void(0)"><span
									class="glyphicon glyphicon-chevron-up moveUp"></span></a> <a
									href="javascript:void(0)"><span
									class="glyphicon glyphicon-chevron-down moveDown"></span></a> <a
									href="javascript:adjustStep(__STEP)"><b>맞춤</b></a> <a
									href="javascript:addStep(__STEP)"><span
									class="glyphicon glyphicon-plus"></span></a> <a
									href="javascript:delStep(__STEP)"><span
									class="glyphicon glyphicon-remove"></span></a>
							</div>
						</div>
					</div>
					<!--/step template-->

					<div class="btn_add mag_b_25"
						style="padding: 0 0 20px 180px; width: 820px;">
						<button type="button" onclick="addStep()" class="btn btn-default">
							<span class="glyphicon glyphicon-plus-sign"></span>순서추가
						</button>
					</div>


					<p class="cont_tit4">
						요리완성사진
						<!--  요리완성 사진 파일박스 -->
						<input type="file" name="file" id="multifile_2" file_gubun="work"
							style="display: none;" multiple=""> <br>
						<!-- <button type="button"
							onclick="document.getElementById('multifile_2').click();"
							class="btn-sm btn-default">
							<span class="glyphicon glyphicon-plus"></span> 사진 한번에 넣기
						</button> -->
					</p>

					<div id="divWorkArea" style="display: inline-block"
						class="ui-sortable">
						<div id="divWorkUpload_1" class="complete_pic">
							<input type="hidden" name="work_photo[]" id="work_photo_1"
								value=""> <input type="hidden" name="new_work_photo[]"
								id="new_work_photo_1" value=""> <input type="hidden"
								name="del_work_photo[]" id="del_work_photo_1" value="">
							<div style="position: absolute; left: -3000px">
								<input type="file" name="q_work_file_1" id="q_work_file_1"
									file_gubun="work" accept="${picture.allowedExtensions}"
									style="display:; width: 0px; height: 0px; font-size: 0px;"
									text="">
							</div>
							<div id="divWorkPhotoBox_1" is_over="0">
								<a href="javascript:delWorkPhoto(1)" class="pic_del"
									style="display: none"></a> <img id="workPhotoHolder_1"
									onclick="browseWorkFile(1)"
									src="https://recipe1.ezmember.co.kr/img/pic_none3.gif"
									alt="No Image"
									style="width: 140px; height: 140px; cursor: pointer">
							</div>
						</div>

						<div id="divWorkUpload_2" class="complete_pic">
							<input type="hidden" name="work_photo[]" id="work_photo_2"
								value=""> <input type="hidden" name="new_work_photo[]"
								id="new_work_photo_2" value=""> <input type="hidden"
								name="del_work_photo[]" id="del_work_photo_2" value="">
							<div style="position: absolute; left: -3000px">
								<input type="file" name="q_work_file_2" id="q_work_file_2"
									file_gubun="work" accept="${picture.allowedExtensions}"
									style="display:; width: 0px; height: 0px; font-size: 0px;"
									text="">
							</div>
							<div id="divWorkPhotoBox_2" is_over="0">
								<a href="javascript:delWorkPhoto(2)" class="pic_del"
									style="display: none"></a> <img id="workPhotoHolder_2"
									onclick="browseWorkFile(2)"
									src="https://recipe1.ezmember.co.kr/img/pic_none3.gif"
									alt="No Image"
									style="width: 140px; height: 140px; cursor: pointer">
							</div>
						</div>

						<div id="divWorkUpload_3" class="complete_pic">
							<input type="hidden" name="work_photo[]" id="work_photo_3"
								value=""> <input type="hidden" name="new_work_photo[]"
								id="new_work_photo_3" value=""> <input type="hidden"
								name="del_work_photo[]" id="del_work_photo_3" value="">
							<div style="position: absolute; left: -3000px">
								<input type="file" name="q_work_file_3" id="q_work_file_3"
									file_gubun="work" accept="${picture.allowedExtensions}"
									style="display:; width: 0px; height: 0px; font-size: 0px;"
									text="">
							</div>
							<div id="divWorkPhotoBox_3" is_over="0">
								<a href="javascript:delWorkPhoto(3)" class="pic_del"
									style="display: none"></a> <img id="workPhotoHolder_3"
									onclick="browseWorkFile(3)"
									src="https://recipe1.ezmember.co.kr/img/pic_none3.gif"
									alt="No Image"
									style="width: 140px; height: 140px; cursor: pointer">
							</div>
						</div>

						<div id="divWorkUpload_4" class="complete_pic">
							<input type="hidden" name="work_photo[]" id="work_photo_4"
								value=""> <input type="hidden" name="new_work_photo[]"
								id="new_work_photo_4" value=""> <input type="hidden"
								name="del_work_photo[]" id="del_work_photo_4" value="">
							<div style="position: absolute; left: -3000px">
								<input type="file" name="q_work_file_4" id="q_work_file_4" file_gubun="work" 
								accept="${picture.allowedExtensions}" style="display:; width: 0px; height: 0px; font-size: 0px;" text="">
							</div>
							<div id="divWorkPhotoBox_4" is_over="0">
								<a href="javascript:delWorkPhoto(4)" class="pic_del" style="display: none"></a> 
								<img id="workPhotoHolder_4" onclick="browseWorkFile(4)" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif"
									alt="No Image" style="width: 140px; height: 140px; cursor: pointer">
							</div>
						</div>
					</div>
				</div>

				<!--/cont_box-->
				<!-- <div class="cont_box pad_l_60">
					<p class="cont_tit4">요리팁</p>
					<textarea name="cok_tip" id="cok_tip"
						class="form-control step_cont"
						placeholder="예) 고기요리에는 소금보다 설탕을 먼저 넣어야 단맛이 겉돌지 않고 육질이 부드러워요."
						style="height: 120px; width: 620px; resize: none;"></textarea>
				</div> -->
				<!--/cont_box-->

				<div class="cont_box pad_l_60">
					<p class="cont_tit4">태그</p>
					<input type="hidden" name="name" value="" id="mySingleFieldTags"
						style="width: 100%" class="tagit-hidden-field">
					<ul class="tagit ui-widget ui-widget-content ui-corner-all">
						<li class="tagit-new" style="width: 99%;"><input type="text"
							class="ui-widget-content ui-autocomplete-input"
							autocomplete="off" style="width: 100%"></li>
					</ul>
					<span
						style="display: block; color: #666; margin-bottom: -8px; margin-left: 140px">주재료,
						목적, 효능, 대상 등을 태그로 남겨주세요.<em
						style="font-style: normal; color: #999; padding-left: 8px;">예)
							돼지고기, 다이어트, 비만, 칼슘, 감기예방, 이유식, 초간단</em>
					</span>
				</div>
				<!--/cont_box-->

			</div>
			<!--/regi_center-->
			<div class="regi_btm">
				<button type="button" onclick="doSubmit('save')"
					class="btn-lg btn-primary">저장</button>
				<button type="button" onclick="history.back();"
					class="btn-lg btn-default">취소</button>
			</div>
		</div>
		<!-- /container -->
	</form>


	<div id="divAutoMaterialModal" class="modal fade">
		<div class="modal-dialog" style="width: 700px">
			<div class="modal-content new_folder">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"><img
							src="https://recipe1.ezmember.co.kr/img/btn_close.gif" alt="닫기"></span>
					</button>
					<h4 class="modal-title text-left" id="auto_material_title">재료/양념
						한번에 넣기</h4>
				</div>
				<div class="modal-body" style="padding: 5px;">
					<dl class="blog_select">
						<dt
							style="padding: 10px 0 5px 0; font-size: 17px; text-align: center;">요리에
							들어갈 재료, 양념을 작성 또는 따로 작성된 것을 복사/붙여넣기 해주세요.</dt>
						<dd>
							<textarea id="q_auto_material" class="form-control step_cont"
								placeholder="<예시>
    [스테이크 재료] 돼지고기 500g, 양파 1/2개, 고추 1개, 간장
    [파절임] 대파 3개, 고춧가루 1숟가락, 매실엑기스 3숟가락, 식초 3숟가락
    [양념] 고춧가루 2T, 진간장 1T, 참치액 1T, 참기름 1T, 매실액 1T, 통깨 "
								style="height: 120px; width: 620px; resize: none;" group_idx=""></textarea>
							<p
								style="font-size: 15px; line-height: 1.8; padding: 15px 0 0 15px; margin: 0;">
								*재료가 남거나 부족하지 않도록 <strong>정확히</strong> 작성 <br> *각 식재료는 <strong>","쉼표로</strong>
								구분 <br> *한개, 반개, 한개반과 같은 표기는 1개, <strong>1/2개,
									1+1/2개(또는 1.5개)</strong>와 같이 작성 <br> *재료 및 양념, 소스 등을 구분할 경우 <strong>"[]"대괄호를
									사용</strong> <br> *입력란에 작성된 <strong>예시를 참고</strong>
							</p>
						</dd>
					</dl>
				</div>

				<div class="modal-footer">
					<button type="button" id="btnAutoMaterialConfirm"
						class="btn-lg btn-primary" rel="popover_blog" is_action="">확인</button>
					<button type="button" class="btn-lg btn-default"
						data-dismiss="modal">취소</button>
				</div>
				<p style="text-align: center; padding: 0 0 20px 0">
					<img src="https://recipe1.ezmember.co.kr/img/img_use.gif">
				</p>
			</div>
		</div>
	</div>

	<ul
		class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content"
		id="ui-id-1" tabindex="0" style="display: none; z-index: 10000;"></ul>
	<span role="status" aria-live="assertive" aria-relevant="additions"
		class="ui-helper-hidden-accessible"></span>
	<ul
		class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content tagit-autocomplete"
		id="ui-id-2" tabindex="0" style="display: none;"></ul>
	<span role="status" aria-live="assertive" aria-relevant="additions"
		class="ui-helper-hidden-accessible"></span>
</body>

</html>