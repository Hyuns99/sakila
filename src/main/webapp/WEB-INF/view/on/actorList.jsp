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
        		<h2 class="mt-3 fw-semibold">Actor List</h2>
        		<form action="${pageContext.request.contextPath }/on/actorList" method="get" id="formSearch">
        			<input type="text" name="searchWord" id="searchWord">
        			<button type="button" id="btnSearch" class="btn btn-warning">검색</button>
        		</form>
        		<table class="table table-bordered mt-3">
        			<tr>
        				<td class="fw-semibold">ActorId</td>
        				<td class="fw-semibold">Name</td>
        			</tr>
        			<c:forEach var="a" items="${actorList }">
        				<tr>
        					<td>${a.actorId }</td>
        					<td>
        						<a href="${pageContext.request.contextPath }/on/actorOne?actorId=${a.actorId }">
        							<span>${a.firstName } ${a.lastName }</span>
        						</a>
        					</td>
        				</tr>
        			</c:forEach>
        		</table>
        		
        		<!-- 페이지네이션 -->
				<nav aria-label="Page navigation example">
				    <ul class="pagination justify-content-center">
				        <!-- Previous Button -->
				        <c:if test="${currentPage > 1}">
				            <li class="page-item">
				                <a class="page-link" href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage - 1}" aria-label="Previous">
				                    <span aria-hidden="true">&laquo;</span>
				                </a>
				            </li>
				        </c:if>
				
				        <!-- Page Numbers -->
				        <c:forEach var="page" begin="${startPage }" end="${endPage}">
				            <li class="page-item ${page == currentPage ? 'active' : ''}">
				                <a class="page-link" href="${pageContext.request.contextPath}/on/actorList?currentPage=${page}">
				                    ${page}
				                </a>
				            </li>
				        </c:forEach>
				
				        <!-- Next Button -->
				        <c:if test="${currentPage < lastPage}">
				            <li class="page-item">
				                <a class="page-link" href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage + 1}" aria-label="Next">
				                    <span aria-hidden="true">&raquo;</span>
				                </a>
				            </li>
				        </c:if>
				    </ul>
				</nav>
        	</div>
        </div>
    </body>
    <script type="text/javascript">
    	$('#btnSearch').click(function() {
    		if($('#searchWord').val() == "") {
    			alert("검색어를 입력해주세요");
    			return;
    		}
    		$('#formSearch').submit();
    	});
    </script>
</html>