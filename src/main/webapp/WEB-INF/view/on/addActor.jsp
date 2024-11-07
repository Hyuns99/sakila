<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <!-- bootstrap CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

		<!-- bootstrap JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        
        <!-- menu.css -->
        <link href="${pageContext.request.contextPath}/css/leftMenu.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    </head>
    <body class="container-flud">
        <div class="row w-100">
        	<div class="col-sm-2 bg-light">
        		<!-- leftMenu -->
        		<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
        	</div>
        	<div class="col-sm-10">
        		<!-- Main -->
        		<h2 class="mt-3 fw-semibold">Actor 추가</h2>
        		<span class="mt-3 fw-semibold d-block text-danger">${msg }</span>
        		<!-- 파일업로드을 위해서는 form에서 method가 post가 돼야되고 enctype="multipart/form-data"를 추가해야된다 -->
        		<form id="formActor" action="${pageContext.request.contextPath}/on/addActor" method="post" enctype="multipart/form-data">
	        		<table class="table table-bordered mt-3">
	        			<tr>
	        				<td>firstName</td>
	        				<td>
	        					<input type="text" name="firstName" id="firstName">
	        				</td>
	        			</tr>
	        			<tr>
	        				<td>lastName</td>
	        				<td>
	        					<input type="text" name="lastName" id="lastName">
	        				</td>
	        			</tr>
	        			<tr>
	        				<td>file</td>
	        				<td>
	        					<div id="fileDiv">
		        					<button type="button" id="btnAddFile" class="btn btn-warning">파일추가</button>        					
		        					<button type="button" id="btnRemoveFile" class="btn btn-warning">파일삭제</button>        					
	        					</div>
	        				</td>
	        			</tr>
	        		</table>
	        		<button type="button" id="btnAddActor" class="btn btn-warning mt-3">추가</button>        		
        		</form>
        	</div>
        </div>
    </body>
    <script type="text/javascript">
    	// 추가 버튼
    	$('#btnAddActor').click(function(){
			if($('#firstName').val() == '' || $('#lastName').val() == '') {
				alert('이름을 입력하세요.');
			} else if($('.actorFile').length > 0 && $('.actorFile').last().val() == '') {
				alert('첨부되지 않은 파일이 있습니다.');
			} else {
				$('#formActor').submit();
			}
		});
    
    	// 파일 버튼 
    	$('#btnAddFile').click(function() {
    		if($('.actorFile').last().val() == '') {
    			alert('첨부되지 않은 파일이 있습니다.');
    		} else {
    			let html = '<input type="file" name="actorFile" class="actorFile mt-3 d-block">';
	    		$('#fileDiv').append(html);
    		}
	   		 /* 자바스크립트 API
	    		let arr = $('.actorFile');
	    		arr.forEach(function(item) {
	    			
	    		});
	    	*/
   		});
    	$('#btnRemoveFile').click(function() {
    		// 마지막 <input type="file" name="actorFile" class="actorFile mt-3">태그 삭제
    		if(('actorFile').length == 0) {
    			alert('삭제할 파일이 존재하지않습니다');
    		} else {    			
	    		$('.actorFile').last().remove();
    		}
    	});
    </script>
</html>