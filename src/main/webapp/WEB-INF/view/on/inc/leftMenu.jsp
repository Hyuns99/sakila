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
        	.submenu {
	            display: none;
	            
	        }
        </style>
    </head>
    <body>
    	<div style="height: 100vh;">
		    <ul class="list-group text-center bg-light">
		        <li class="list-group-item">
		            <a href="${pageContext.request.contextPath}/on/main">HOME</a>
		        </li>
		        <li class="list-group-item">
		        	<img alt="/image/loing.png" src="회원이미지">
		            <a href="${pageContext.request.contextPath}/on/staffOne">${loginStaff.userName}님 반갑습니다.</a>
		        </li>
		        
		
		        <!-- 지점메뉴 -->
		        <li class="list-group-item">
		            <button type="button" class="btn btn-link w-100" onclick="toggleMenu('branchMenu')">Store 관리</button>
		            <ul id="branchMenu" class="submenu list-group">
		                <li class="list-group-item">
		                    <a href="${pageContext.request.contextPath}/on/branch/add">지점 추가</a>
		                </li>
		                <li class="list-group-item">
		                    <a href="${pageContext.request.contextPath}/on/branch/edit">지점 수정</a>
		                </li>
		            </ul>
		        </li>
		
		        <!-- 스탭메뉴 -->
		        <li class="list-group-item">
		            <button type="button" class="btn btn-link w-100" onclick="toggleMenu('staffMenu')">Staff 관리</button>
		            <ul id="staffMenu" class="submenu list-group">
		                <li class="list-group-item">
		                    <a href="${pageContext.request.contextPath}/on/staff/add">스탭 추가</a>
		                </li>
		                <li class="list-group-item">
		                    <a href="${pageContext.request.contextPath}/on/staff/edit">스탭 수정</a>
		                </li>
		            </ul>
		        </li>
		
		        <!-- 고객메뉴 -->
		        <li class="list-group-item">
		            <button type="button" class="btn btn-link w-100" onclick="toggleMenu('customerMenu')">고객 관리</button>
		            <ul id="customerMenu" class="submenu list-group">
		                <li class="list-group-item">
		                    <a href="${pageContext.request.contextPath}/on/customer/add">고객 추가</a>
		                </li>
		                <li class="list-group-item">
		                    <a href="${pageContext.request.contextPath}/on/customer/edit">고객 수정</a>
		                </li>
		            </ul>
		        </li>
		    </ul>
		    <a href="${pageContext.request.contextPath}/on/logout">Logout</a>
		</div>
		
		<script>
		    function toggleMenu(menuId) {
		        const menu = document.getElementById(menuId);
		        menu.style.display = menu.style.display === 'none' ? 'block' : 'none';
		    }
		</script>
    </body>
</html>
