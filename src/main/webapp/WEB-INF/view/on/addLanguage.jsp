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
        		<h2 class="mt-3 fw-semibold">언어 추가</h2>
        		<form action="${pageContext.request.contextPath}/on/addLanguage" method="post" id="formAddLanguage">
        			<table class="table table-bordered mt-3">
        				<tr>
        					<td class="fw-semibold">Language</td>
        					<td>
        						<input type="text" name="name" id="name">
        					</td>
        				</tr>
        			</table>
        			<button type="button" id="btnAddLanguage" class="btn btn-warning mt-3">추가</button>
        		</form>
        	</div>
        </div>
    </body>
    <script type="text/javascript">
    	$('#btnAddLanguage').click(function() {
    		if($('#name') == null || $('#name').val() == '') {
    			alert('언어를 입력해주세요');
    		}
    		$('#formAddLanguage').submit();
    	})
    </script>
</html>