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
        		<h2 class="mt-3 fw-semibold">Actor File 추가</h2>
        		
        		<!-- 첨부한 파일이 이미지파일이 아닐경우 에러메세지 출력 -->
        		<span class="mt-3 fw-semibold d-block text-danger">${msg }</span>
        		
        		<form action="${pageContext.request.contextPath }/on/addActorFile" method="post" 
        			id="formAddActorFile" enctype="multipart/form-data">
        			<table class="table table-bordered mt-3">
        				<tr>
        					<td>actorId</td>
        					<td>
        						<input type="text" name="actorId" value="${actorId}" readonly>
        					</td>
        				</tr>
        				<tr>
        					<td>file</td>
        					<td>
        						<div id="fileDiv">
		        					<button type="button" id="btnAddFile" class="btn btn-warning">파일추가</button>        					
		        					<button type="button" id="btnRemoveFile" class="btn btn-warning">파일삭제</button>        					
	        						<input type="file" name="actorFile" class="upload-input actorFile mt-3 d-block">
	        					</div>
        					</td>
        				</tr>
        			</table>
        			<button id="btnAddActorFile" type="button" class="btn btn-warning">추가</button>
        		</form>
        	</div>
        </div>
    </body>
    <script type="text/javascript">
    	$('#btnAddActorFile').click(function() {
    		if($('.actorFile').length == 0) {
    			alert('첨부한 파일이 없습니다.');
    		} else if($('.actorFile').last().val() == '') {
				alert('첨부되지 않은 파일이 있습니다.');
			} else {
				$('#formAddActorFile').submit();
			}
    	});
    
		 // 파일 버튼 
		$('#btnAddFile').click(function() {
			if($('.actorFile').last().val() == '') {
				alert('첨부되지 않은 파일이 있습니다.');
			} else {
				let html = '<input type="file" name="actorFile" class="upload-input actorFile mt-3 d-block">';
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