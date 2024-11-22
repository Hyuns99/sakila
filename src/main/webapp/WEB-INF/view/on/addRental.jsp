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
        		<h2 class="mt-3 fw-semibold">Rental 추가</h2>
        		<form id="formSearchName" action="${pageContext.request.contextPath}/on/addRental" method="get">
        			<input type="hidden" name="inventoryId" value="${inventoryId}">
					이름 검색 :
					<input type="text" name="searchName" id="searchName">
					<button type="button" id="btnSearchName">이름검색</button>
        		</form>
        		
        		<form id="formAddRental"
					method="post"
					action="${pageContext.request.contextPath}/on/addRental">
					<table class="table">
						<tr>
							<td>customerId</td>
							<td>
								<select name="customerId" id="customerId" size="5">		
									<c:forEach var="c" items="${customerList}">
										<option value="${c.customerId}">
											${c.firstName}
											${c.lastName}
											${c.email}
										</option>
									</c:forEach>
								</select> 
							</td>
						</tr>
					
						<tr>
							<td>inventoryId</td>
							<td>
								<input type="text" name="inventoryId" id="inventoryId" 
									value="${inventoryId}" readonly> 
									<!-- request.getAttribute("inventoryId") -->
							</td>
						</tr>
						
						<tr>
							<td>staffId</td>
							<td>
								<input type="text" name="staffId" id="staffId" 
									value="${loginStaff.staffId}" readonly> 
							</td>
						</tr>
						
						<tr>
							<td>rentalDate</td>
							<td>
								<input type="date" name="rentalDate" id="rentalDate"> 
							</td>
						</tr>
					</table>
					<button type="button" id="btnAddRental">대여</button>
				</form>
        	</div>
        </div>
    </body>
    <script>
		$('#btnAddRental').click(function(){
			if($('#customerId').val() == null || $('#customerId').val() == '') {
				alert('고객이름 검색 후 아이디를 선택하세요');
			} else if($('#rentalDate').val() == '') {
				alert('렌탈 날짜를 입력하세요');
			} else {
				$('#formAddRental').submit();
			}
		})
	
		$('#btnSearchName').click(function(){
			if($('#searchName').val() == '') {
				alert('검색이름을 입력하세요');
			} else {
				$('#formSearchName').submit();
			}
		});
	</script>
</html>