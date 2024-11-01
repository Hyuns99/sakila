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
        		background-color: #2b2b2b;
        	}
        </style>
    </head>
    <body class="container d-flex justify-content-center align-items-center">
    	<div class="card w-50">
    		<div class="card-header">
		        <h1>staff login</h1>
    		</div>
    		<div class="card-body">
		        <form action="${pageContext.request.contextPath }/off/login" method="post">
				    <div class="mb-3 mt-3">
				        <label for="staffId" class="form-label">StaffId :</label>
				        <input type="text" class="form-control" id="staffId" name="staffId">
				    </div>
				    <div class="mb-3">
				        <label for="password" class="form-label">Password:</label>
				        <input type="password" class="form-control" id="password" name="password">
				    </div>
				    <span class="fs-6 text-danger">${msg }</span> 
				    <br>  
				    <button type="submit" class="btn btn-warning mb-3 mt-3">
				    	<span>Login</span>
				    </button>
				    <button type="submit" class="btn btn-warning">
				    	<span>Sign up</span>
				    </button>
				 </form>    			
    		</div>
    	</div>
    </body>    	
</html>