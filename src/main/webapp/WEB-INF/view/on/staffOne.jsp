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
    </head>
    <body class="container-flud">
        <div class="row w-100">
        	<div class="col-sm-2 bg-light">
        		<!-- leftMenu -->
        		<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
        	</div>
        	<div class="col-sm-10">
        		<!-- Main -->
				<img alt="/image/loing.png" src="회원이미지">
        		<h2 class="mt-3">${staff.managerName }님 회원정보</h2>
        		<table class="table table-bordered mt-3">
        			<!-- 스탭 정보 -->
        			<tr>
        				<td class="fw-semibold table-success ">StaffId</td>
        				<td>${staff.staffId }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold table-success">firstName</td>
        				<td>${staff.firstName }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold table-success">lastName</td>
        				<td>${staff.lastName }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold table-success">staffPostCode</td>
        				<td>${staff.staffPostCode }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold table-success">staffPhone</td>
        				<td>${staff.staffPhone }</td>
        			</tr>
        			<!-- 스탭 주소 -->
        			<tr>
        				<td class="fw-semibold table-danger">staffAddress</td>
        				<td>${staff.staffAddress }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold table-danger">staffAddress2</td>
        				<td>${staff.staffAddress2 }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold table-danger">staffDistrict</td>
        				<td>${staff.staffDistrict }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold table-danger">staffCity</td>
        				<td>${staff.staffCity }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold table-danger">staffCountry</td>
        				<td>${staff.staffCountry }</td>
        			</tr>
        			<!-- 지점 정보 -->
        			<tr>
        				<td class="fw-semibold table-warning">storeId</td>
        				<td>${staff.storeId }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold table-warning">storeAddress</td>
        				<td>${staff.storeAddress }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold table-warning">storeAddress2</td>
        				<td>${staff.storeAddress2 }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold table-warning">storeDistrict</td>
        				<td>${staff.storeDistrict }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold table-warning">storePostCode</td>
        				<td>${staff.storePostCode }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold table-warning">storePhone</td>
        				<td>${staff.storePhone }</td>
        			</tr>
        			<!-- 지점 주소 -->
        			<tr>
        				<td class="fw-semibold table-info">storeCity</td>
        				<td>${staff.storeCity }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold table-info">storeCountry</td>
        				<td>${staff.storeCountry }</td>
        			</tr>
        			<!-- 매니저 정보 -->
        			<tr>
        				<td class="fw-semibold table-primary">managerStaffId</td>
        				<td>${staff.managerStaffId }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold table-primary">managerName</td>
        				<td>${staff.managerName }</td>
        			</tr>
        		</table>
        		
        	</div>
        </div>
    </body>
</html>