<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <!-- bootstrap CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

		<!-- bootstrap JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <style type="text/css">
	        body {
				height: 100vh;
			}
			.card {
			    width: 30%;
				box-shadow: 12px 12px 2px 1px rgba(0, 0, 255, .2);
			}
	    </style>
        
    </head>
    <body class="container d-flex justify-content-center align-items-center">
    	<div class="card">
    		<div class="card-header">
		        <h2 class="fw-semibold">Staff</h2>
    		</div>
    		<div class="card-body">
		        <form id="form" action="${pageContext.request.contextPath }/off/login" method="post">
				    <div class="mb-3 mt-3">
				        <label for="staffId" class="form-label fw-semibold">StaffId</label>
				        <input type="text" class="form-control" id="staffId" name="staffId">
				    </div>
				    <div class="mb-3">
				        <label for="password" class="form-label fw-semibold">Password</label>
				        <input type="password" class="form-control" id="password" name="password">
				    </div>
				    <span class="fs-6 text-danger">${msg }</span> 
				    <br>  
				    <button id="login-btn" type="button" class="btn btn-warning mb-3 mt-3 w-100">
				    	<span class="fw-semibold">Login</span>
				    </button>
				 </form>    			
    		</div>
    	</div>
    </body>
    <script type="text/javascript">
    	// 로그인 버튼 클릭 시 폼값 유효성 검사
    	$("#login-btn").click(function(){
    		// console.log("로그인 버튼 클릭")
    		// 숫자가 아니면 isNan() or $.isNumeric()
    		if($.isNumeric($('#staffId').val()) == false) {
    			alert('id는 숫자만 입력해주세요');
    		} else if($('#password').val().length < 4) {
    			alert('password는 4자리 이상을 입력해주세요');
    		} else {
    			$('#form').submit();
    		}
    	});
    </script>    	
</html>










