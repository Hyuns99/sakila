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
        		<h2 class="mt-3 fw-semibold">고객 추가</h2>
        		<div class="w-100 d-flex">
	        		<div class="w-50">
	        			<!-- 주소 검색 -->
	        			<form id="formSearchAddress" action="${pageContext.request.contextPath}/on/addCustomer" method="get">
	        				<input type="text" name="searchAddress" id="searchAddress">
	        				<button type="button" class="btn btn-warning" id="btnSearchAddress">검색</button>
	        			</form>
	        		</div>
	        		<!-- 주소선택 -->
	        		<div class="w-100" >
	        			<span class="fw-semibold fs-5">주소를 선택하세요</span>
	        			<select id="resultAddress" size="10" class="form-select ">
	        				<c:forEach var="a" items="${addressList }">
	        					<option value="${a.addressId }">${a.address }</option>
	        				</c:forEach>
	        			</select>
	        			<button type="button" id="btnAddrSel" class="btn btn-warning mt-3">주소 선택</button>
	        		</div>        		
        		</div>
        		
        		<div>
        			<!-- 고객 입력 폼 -->
        			<form id="formAddCustomer" action="${pageContext.request.contextPath }/on/addCustomer" method="post">
        				<table class="table table-bordered mt-3">
        					<tr>
        						<td class="fw-semibold">storeId</td>
        						<td>
        							<select class="form-select " id="storeId" name ="storeId">
       									<option value="">::선택하세요::</option>
        								<c:forEach var="s" items="${storeList }">
        									<option value="${s.storeId }">${s.storeId }</option>
        								</c:forEach>
        							</select>
        						</td>
        					</tr>
        					<tr>
        						<td class="fw-semibold">firstName</td>
        						<td>
        							<input type="text" name="firstName" id="firstName">
        						</td>
        					</tr>
        					<tr>
        						<td class="fw-semibold">lastName</td>
        						<td>
        							<input type="text" name="lastName" id="lastName">
        						</td>
        					</tr>
        					<tr>
        						<td class="fw-semibold">email</td>
        						<td>
        							<input type="text" name="email" id="email">
        						</td>
        					</tr>
        					<tr>
        						<td class="fw-semibold">addressId</td>
        						<td>
        							<input type="text" name="addressId" id="addressId" readonly>
        						</td>
        					</tr>
        				</table>
        				<button type="button" class="btn btn-warning" id="btnAddCustomer">추가</button>
        			</form>
        		</div>
        	</div>
        </div>
    </body>
    <script type="text/javascript">
    	// 주소 검색
    	$('#btnSearchAddress').click(function() {
    		if($('#searchAddress').val() == null || $('#searchAddress').val() == "") {
    			alert("주소를 입력해주세요")
    		} else {
    			$('#formSearchAddress').submit();
    		}
    	});
    	// 주소 선택
    	$('#btnAddrSel').click(function() {
    		if($('#resultAddress').val() == null || $('#resultAddress').val() == "") {
    			alert("주소를 선택해주세요")
    		} else {
    			$('#addressId').val($('#resultAddress').val()); // addressId.val에 resultAddress값 넣기
    		}
    	});
    	
    	// 유효성 검사
    	$('#btnAddCustomer').click(function() {
    		// 유효성검사
    		if($('#storeId').val() == "" || $('#storeId').val() == null) {
    			alert("storeId을 선택하세요");
    			return;
    		} else if($('#firstName').val() == "" || $('#firstName').val() == null) {
    			alert("firstName을 입력하세요");
    		} else if($('#lastName').val() == "" || $('#lastName').val() == null) {
    			alert("lastName을 입력하세요");
    		} else if($('#email').val() == "" || $('#email').val() == null) {
    			alert("email을 입력하세요");
    		} else if($('#addressId').val() == "" || $('#addressId').val() == null) {
    			alert("addressId을 입력하세요");
    		}  else {
    			$('#formAddCustomer').submit();
    		}
    	});
    </script>
</html>