window.onload = function() {
	if(document.getElementById('Type').value == 'name') {
		document.getElementById('keyword').value = '';
		document.getElementById('tagDiv').style.display = '';
		document.getElementById("keyword").readOnly = true;
	} else {
		document.getElementById('tagDiv').style.display = 'none';
		document.getElementById("keyword").readOnly = '';
	};
	
	 document.getElementById("Type").onchange = function() {
/*		var searchType = document.getElementById("name").value;
        var searchKeyword = document.getElementById("keyword").value;*/
        
		if(document.getElementById("Type").value != 'name') {//태그 분류 선택시 해시태그
			document.getElementById("tagDiv").style.display = "none";
			document.getElementById("keyword").readOnly = '';
		} else {
			document.getElementById("tagDiv").style.display = "";
			document.getElementById("keyword").readOnly = true;
		}
	};
		
    document.getElementById("search_name").onclick = function() {
        var searchType = document.getElementById("Type").value;
        var searchKeyword = document.getElementById("keyword").value;

		if(searchType != 'name'){
	        if (!searchType || !searchKeyword) {
				if (!searchKeyword) {
	            	alert("검색어를 입력해주세요");
	            	return false;
	            	
	        	}else if(!searchType) {
	            	alert("검색어 분류를 선택해주세요");
	            	return false;
	        	}
	        }
			else if(!searchType && !searchKeyword){
				alert("검색어를 입력해주세요");
	        }
	    }
	}
	
	var children = document.querySelector('.tagit.ui-widget.ui-widget-content.ui-corner-all').children;
	
	if(children.length > 1) {
		for(var i =0; i < children.length; i++) {
			if(children[i].class != 'tagit-new') {
				   children[i].querySelector('.tagit-close').addEventListener('click', function(e) {
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
			}
		}
	}
}