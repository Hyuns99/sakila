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
        		<h2 class="mt-3 fw-semibold">장르 리스트</h2>
        		<table class="table table-bordered mt-3">
        			<tr>
        				<td>categoryId</td>
        				<td>name</td>
        				<td>lastUpdate</td>
        			</tr>
        			<c:forEach var="c" items="${categoryList }">
	       				<tr>
	       					<td>${c.categoryId }</td>
	       					<td>${c.name }</td>
	       					<td>${c.lastUpdate }</td>
	       				</tr>
        			</c:forEach>
        		</table>
        		<nav aria-label="Page navigation example">
				    <ul class="pagination justify-content-center">
				    	<li class="page-item">
			                <a class="page-link" href="${pageContext.request.contextPath}/on/categoryList?currentPage=1">
			                    <span aria-hidden="true">&laquo;</span>
			                </a>
			            </li>
				        <!-- Page Numbers -->
				        <c:forEach var="page" begin="${startPage }" end="${endPage}">
				            <li class="page-item ${page == currentPage ? 'active' : ''}">
				                <a class="page-link" href="${pageContext.request.contextPath}/on/categoryList?currentPage=${page}">
				                    ${page}
				                </a>
				            </li>
				        </c:forEach>
				
				        <li class="page-item">
			                <a class="page-link" href="${pageContext.request.contextPath}/on/categoryList?currentPage=${lastPage}">
			                    <span aria-hidden="true">&raquo;</span>
			                </a>
			            </li>
				    </ul>
				</nav>
        	</div>
        </div>
    </body>
</html>