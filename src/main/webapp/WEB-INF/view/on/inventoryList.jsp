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
        		<h2 class="mt-3 fw-semibold">${storeId }지점 Inventory List</h2>
        		<!-- 추후 검색기능 추가 -->
        		<form action="${pageContext.request.contextPath }/on/actorList" method="get" id="formSearch">
        			<input type="text" name="searchWord" id="searchWord">
        			<button type="button" id="btnSearch" class="btn btn-warning">검색</button>
        		</form>
        		<table class="table table-bordered mt-3">
        			<tr>
        				<td>inventoryId</td>
						<td>(filmId)title</td>
						<td>lastUpdate</td>
						<td>대여</td>
						<td>customerId</td>
						<td>삭제</td>
        			</tr>
        			<c:forEach var="iv" items="${inventoryList }">
        				<tr>
        					<td>${iv.inventoryId }</td>
        					<td>
        						<a href="${pageContext.request.contextPath }/on/filmOne?filmId=${iv.filmId }">
		        					(${iv.filmId }) ${iv.title }        						
        						</a>
        					</td>
        					<td>${iv.lastUpdate }</td>
        					<td><!-- 대여중인 상태면 고객ID, 대여가능이면 addRental링크 -->
							<c:if test="${iv.customerId != null}">
								<a href="${pageContext.request.contextPath}/on/customerOne?customerId=${iv.customerId}">
									${iv.customerId}
								</a>
							</c:if>
							<c:if test="${iv.customerId == null}">
								<a href="${pageContext.request.contextPath}/on/addRental?inventoryId=${iv.inventoryId}" 
									class="btn btn-primary">
									대여
								</a>
							</c:if>
							</td>
							<td>
								<a class="btn btn-danger" 
									href="${pageContext.request.contextPath}/on/removeInventoryByKey?inventoryId=${iv.inventoryId}&storeId=${storeId}">
									삭제
								</a>
							</td>
        				</tr>
        			</c:forEach>
        		</table>
        		
        		<!-- 페이지네이션 -->
				<nav aria-label="Page navigation example">
				    <ul class="pagination justify-content-center">
				    	<li class="page-item">
			                <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId }&currentPage=1">
			                    <span aria-hidden="true">&laquo;</span>
			                </a>
			            </li>
				        <!-- Previous Button -->
				        <c:if test="${currentPage > 1}">
				            <li class="page-item">
				                <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId }&currentPage=${currentPage - 1}" aria-label="Previous">
				                    <span aria-hidden="true">이전</span>
				                </a>
				            </li>
				        </c:if>
				
				        <!-- Page Numbers -->
				        <c:forEach var="page" begin="${startPage }" end="${endPage}">
				            <li class="page-item ${page == currentPage ? 'active' : ''}">
				                <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId }&currentPage=${page}">
				                    ${page}
				                </a>
				            </li>
				        </c:forEach>
				
				        <!-- Next Button -->
				        <c:if test="${currentPage < lastPage}">
				            <li class="page-item">
				                <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId }&currentPage=${currentPage + 1}" aria-label="Next">
				                    <span aria-hidden="true">다음</span>
				                </a>
				            </li>
				        </c:if>
				        <li class="page-item">
			                <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId }&currentPage=${lastPage}">
			                    <span aria-hidden="true">&raquo;</span>
			                </a>
			            </li>
				    </ul>
				</nav>
        	</div>
        </div>
    </body>
    <script type="text/javascript">
    	
    </script>
</html>