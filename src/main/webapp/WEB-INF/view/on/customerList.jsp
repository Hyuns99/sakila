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
        		<h2 class="mt-3 fw-semibold">customer List</h2>
        		
        		<table class="table table-bordered mt-3">
        			<tr>
        				<td>customerId</td>
        				<td>storeId</td>
        				<td>firstName</td>
        				<td>lastName</td>
        				<td>email</td>
        				<td>addressId</td>
        				<td>active</td>
        				<td>createDate</td>
        				<td>lastUpdate</td>
        			</tr>
        			<c:forEach var="c" items="${customerList }">
	        			<tr>
	        				<td>${c.customerId }</td>
	        				<td>${c.storeId }</td>
	        				<td>${c.firstName }</td>
	        				<td>${c.lastName }</td>
	        				<td>${c.email }</td>
	        				<td>${c.addressId }</td>
	        				<td>${c.active }</td>
	        				<td>${c.createDate }</td>
	        				<td>${c.lastUpdate }</td>
	        			</tr>        			
        			</c:forEach>
        		</table>
        		
        		<!-- 페이지네이션 -->
        		<!-- 이전 11 12 13 14 15 16 17 18 19 20 다음 -->
        		<nav aria-label="Page navigation example">
				    <ul class="pagination justify-content-center">
				    	<li class="page-item">
					        <a class="page-link" href="${pageContext.request.contextPath}/on/customerList?currentPage=1">
					            <span aria-hidden="true">&laquo;</span>
					        </a>
					    </li>
				        <!-- Previous Button -->
				        <c:if test="${currentPage > 10 }">
					        <li class="page-item ">
					            <a class="page-link" href="${pageContext.request.contextPath}/on/customerList?currentPage=${currentPage - 10}" aria-label="Previous">
					                <span aria-hidden="true">이전</span>
					            </a>
					        </li>				        
				        </c:if>
				
				        <!-- Page Numbers -->
				        <c:forEach var="num" begin="${startPagingNum}" end="${endPagingNum}">
				            <li class="page-item ${num == currentPage ? 'active' : ''}">
				                <a class="page-link" href="${pageContext.request.contextPath}/on/customerList?currentPage=${num}">
				                    ${num}
				                </a>
				            </li>
				        </c:forEach>
				
				        <!-- Next Button -->
				        <c:if test="${currentPage < lastPage }">
					        <li class="page-item ">
					            <a class="page-link" href="${pageContext.request.contextPath}/on/customerList?currentPage=${currentPage + 10}" aria-label="Next">
					                <span aria-hidden="true">다음</span>
					            </a>
					        </li>				        
				        </c:if>
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/on/customerList?currentPage=${lastPage}">
						        <span aria-hidden="true">&raquo;</span>
						    </a>
						</li>
				    </ul>
				</nav>
        	</div>
        </div>
    </body>
</html>