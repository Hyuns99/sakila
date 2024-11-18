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
        		<h2 class="mt-3 fw-semibold">Store 리스트</h2>
        		
        		<table class="table table-bordered mt-3">
        			<tr>
        				<td>storeId</td>
        				<td>managerStaffId</td>
        				<td>addressId</td>
        				<td>addressLastUpdate</td>
        				<td>Inventory List</td>
        				<td>Inventory 추가</td>
        				
        			</tr>
        			<c:forEach var="s" items="${storeList }">
        				<tr>
        					<td>${s.storeId }</td>
        					<td>${s.managerStaffId }</td>
        					<td>${s.addressId }</td>
        					<td>${s.lastUpdate }</td>
        					<td>
        						<a href="${pageContext.request.contextPath}/on/inventoryList?storeId=${s.storeId}" class="btn btn-outline-danger">인벤토리 리스트</a>
        					</td>
        					<td>
        						<a href="${pageContext.request.contextPath}/on/addInventory?storeId=${s.storeId}" class="btn btn-outline-danger">인벤토리 추가</a>
        					</td>
        				</tr>
        			</c:forEach>
        		</table>
        	</div>
        </div>
    </body>
</html>