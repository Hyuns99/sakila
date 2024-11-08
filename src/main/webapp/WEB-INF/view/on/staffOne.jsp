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
        		<h2 class="mt-3 fw-semibold">Staff</h2>
				<img class="staffImg" src="${pageContext.request.contextPath}/images/cat.png" alt="회원이미지">
				<br>
        		<span class="mt-3 fs-4">${staff.managerName }님 회원정보</span>
        		<div class="mt-3 mb-3">
        			<a href="${pageContext.request.contextPath}" class="btn btn-warning">password 수정</a>
        			<a href="${pageContext.request.contextPath}" class="btn btn-warning">email 수정</a>
        			<a href="${pageContext.request.contextPath}" class="btn btn-warning">address 수정</a>
        			<a href="${pageContext.request.contextPath}" class="btn btn-warning">store 수정</a>
        		</div>
        		
        		<span class="fw-semibold fs-5">Staff 정보</span>
        		<table class="table table-bordered mt-3 mb-3">
        			<!-- 스탭 정보 -->
        			<tr>
        				<td class="fw-semibold">StaffId</td>
        				<td class="fw-semibold">firstName</td>
        				<td class="fw-semibold">lastName</td>
        				<td class="fw-semibold ">staffPostCode</td>
        				<td class="fw-semibold ">staffPhone</td>
        				<td class="fw-semibold">staffAddress</td>
        				<td class="fw-semibold ">staffAddress2</td>
        				<td class="fw-semibold ">staffDistrict</td>
        				<td class="fw-semibold">staffCity</td>
        				<td class="fw-semibold ">staffCountry</td>
        			</tr>
        			<tr>
        				<td>${staff.staffId }</td>
        				<td>${staff.firstName }</td>
        				<td>${staff.lastName }</td>
        				<td>${staff.staffPostCode }</td>
        				<td>${staff.staffPhone }</td>
        				<!-- 스탭 주소 -->
        				<td>${staff.staffAddress }</td>
        				<td>${staff.staffAddress2 }</td>
        				<td>${staff.staffDistrict }</td>
        				<td>${staff.staffCity }</td>
        				<td>${staff.staffCountry }</td>
        			</tr>
        		</table>
        		
        		<span class="fw-semibold fs-5">Store 정보</span>
        		<table class="table table-bordered mt-3 mb-3">
        			<!-- 지점 정보 -->
        			<tr>
        				<td class="fw-semibold">storeId</td>
        				<td class="fw-semibold">storeAddress</td>
        				<td class="fw-semibold">storeAddress2</td>
        				<td class="fw-semibold">storeDistrict</td>
        				<td class="fw-semibold">storePostCode</td>
        				<td class="fw-semibold">storePhone</td>
        				<td class="fw-semibold">storeCity</td>
        				<td class="fw-semibold">storeCountry</td>
        			</tr>
        			<tr>
        				<td>${staff.storeId }</td>
        				<td>${staff.storeAddress }</td>
        				<td>${staff.storeAddress2 }</td>
        				<td>${staff.storeDistrict }</td>
        				<td>${staff.storePostCode }</td>
        				<td>${staff.storePhone }</td>
        				<!-- 지점 주소 -->
        				<td>${staff.storeCity }</td>
        				<td>${staff.storeCountry }</td>
        			</tr>
       			</table>
       			
        		<span class="fw-semibold fs-5">Manager 정보</span>
        		<table class="table table-bordered mt-3 mb-3">
        			<!-- 매니저 정보 -->
        			<tr>
        				<td class="fw-semibold">managerStaffId</td>
        				<td class="fw-semibold">managerName</td>
        			</tr>
        			<tr>
        				<td>${staff.managerStaffId }</td>
        				<td>${staff.managerName }</td>
        			</tr>
       			</table>
        	</div>
        </div>
    </body>
</html>