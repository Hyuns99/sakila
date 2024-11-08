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
        		<h2 class="mt-3 fw-semibold">Staff List</h2>
        		
        		<table class="table table-bordered mt-3">
        			<tr>
        				<td class="fw-semibold">staffId</td>
        				<td class="fw-semibold">firstName</td>
        				<td class="fw-semibold">lastName</td>
        				<td class="fw-semibold">addressId</td>
        				<td class="fw-semibold">email</td>
        				<td class="fw-semibold">storeId</td>
        				<td class="fw-semibold">userName</td>
        				<td class="fw-semibold">lastUpdate</td>
        				<td class="fw-semibold">active</td>
        				<td class="fw-semibold">활성/비활성화</td>
        			</tr>
        			<c:forEach items="${staffList }" var="s">
	        			<tr>
	        				<td>${s.staffId }</td>
	        				<td>${s.firstName }</td>
	        				<td>${s.lastName }</td>
	        				<td>${s.addressId }</td>
	        				<td>${s.email }</td>
	        				<td>${s.storeId }</td>
	        				<td>${s.userName }</td>
	        				<td>${s.lastUpdate }</td>
	        				<td>${s.active }</td>
	        				<td>
	        					<a href="${pageContext.request.contextPath }/on/modifyStaffActive?staffId=${s.staffId}&active=${s.active }" >
	        						<c:if test="${s.active == 1 }"><span class="btn btn-outline-danger">사용정지 변경</span></c:if>
	        						<c:if test="${s.active == 2 }"><span class="btn btn-outline-primary">사용가능 변경</span></c:if>
	        					</a>
	        				</td>
	        			</tr>        					
        			</c:forEach>
        		</table>
        	</div>
        </div>
    </body>
</html>