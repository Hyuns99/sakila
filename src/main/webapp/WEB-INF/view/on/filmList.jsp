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
        		<h2 class="mt-3 fw-semibold">영화 리스트</h2>
        		
        		<!-- category List -->
        		<form action="${pageContext.request.contextPath }/on/filmList" method="get" id="formCategory">
        			<select name="categoryId" id="categoryId">
        				<option value="0">전체</option>
        				<c:forEach var="c" items="${categoryList }">
        					<c:if test="${c.categoryId == currentCategoryId }">
	        					<option value="${c.categoryId }" selected>${c.name }</option>        					
        					</c:if>
        					<c:if test="${c.categoryId != currentCategoryId }">
	        					<option value="${c.categoryId }">${c.name }</option>        					
        					</c:if>
        				</c:forEach>
        			</select>
        		</form>
        		
        		<!-- film List -->
        		<div>
        			<table class="table table-bordered mt-3">
        				<tr>
        					<td>filmId</td>
        					<td>title</td>
        					<td>releaseYear</td>
        					<td>rentalDuration</td>
        					<td>rentalRate</td>
        					<td>length</td>
        					<td>replacementCost</td>
        					<td>rating</td>
        				</tr>
        				<c:forEach var="f" items="${filmList }">
        					<tr>
        						<td>${f.filmId }</td>
        						<td>
        							<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">
        								${f.title }	
        							</a>
        						</td>
        						<td>${f.releaseYear }</td>
        						<td>${f.rentalDuration }</td>
        						<td>${f.rentalRate }</td>
        						<td>${f.length }</td>
        						<td>${f.replacementCost }</td>
        						<td>${f.rating }</td>
        					</tr>
        				</c:forEach>
        			</table>
        		</div>
        		<!-- 페이지네이션 -->
        		<nav aria-label="Page navigation example">
				    <ul class="pagination justify-content-center">
						<!-- category 선택 시 /on/filmList?categoryId=4 -->
						<li class="page-item">
					        <a class="page-link" href="${pageContext.request.contextPath}/on/filmList?categoryId=${currentCategoryId }&currentPage=1">
					            <span aria-hidden="true">&laquo;</span>
					        </a>
					    </li>
				        <!-- Previous Button -->
				        <c:if test="${currentPage > 1}">
						    <li class="page-item">
						        <a class="page-link" href="${pageContext.request.contextPath}/on/filmList?categoryId=${currentCategoryId }&currentPage=${currentPage - 1}" aria-label="Previous">
						            <span aria-hidden="true">이전</span>
						        </a>
						    </li>
						</c:if>
				
				        <!-- Page Numbers -->
				        <c:forEach var="page" begin="${startPage}" end="${endPage}">
						    <li class="page-item ${page == currentPage ? 'active' : ''}">
						        <a class="page-link" href="${pageContext.request.contextPath}/on/filmList?categoryId=${currentCategoryId }&currentPage=${page}">
						            ${page}
						        </a>
						    </li>
						</c:forEach>
				
				        <!-- Next Button -->
				        <c:if test="${currentPage < lastPage}">
						    <li class="page-item">
						        <a class="page-link" href="${pageContext.request.contextPath}/on/filmList?categoryId=${currentCategoryId }&currentPage=${currentPage + 1}" aria-label="Next">
						            <span aria-hidden="true">다음</span>
						        </a>
						    </li>
						</c:if>
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/on/filmList?categoryId=${currentCategoryId }&currentPage=${lastPage}">
						        <span aria-hidden="true">&raquo;</span>
						    </a>
						</li>
				    </ul>
				</nav>
        	</div>
        </div>
    </body>
    <script type="text/javascript">
    	$('#categoryId').change(function() {
    		$('#formCategory').submit();
    	})
    </script>
</html>