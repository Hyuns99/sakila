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
        		<h2 class="mt-3 fw-semibold">영화 상세보기</h2>
       			<!-- 
        			● 1) film 상세 완료, 
        			● 1-1) film 수정 /on/modifyFilm,
        			● 1-2) film 삭제 /on/removeFilm 
        			(인벤토리와 렌탈정보 확인 + film_category, actor가 출연한 flimList, film 삭제)
        			
        			● 2) film_category List 완료
        			● 2-1) film_category 추가 /on/addFilmCategory -> 카테고리 전체 목록에서 선택(동일한 카테고리를 한번 더 추가하면 500에러발생 : PK중복에러)
        			2-3) film_category 삭제 /on/removeFilmCategory
        			
        			● 3) film_actor List 완료,  
        			3-1) film_actor 추가 /on/addActorByFilm -> actor 검색 후 선택
        			3-2) film_actor 삭제 /on/removeFilmActor
        			
        			4) 인벤토리 정보
        		-->
       		
       			<!-- 필름하나의 상세 정보 -->
        		<table class="table table-bordered mt-3">
        			<tr>
        				<td class="fw-semibold">filmId</td>
        				<td>${film.filmId }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold">title</td>
        				<td>${film.title }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold">length</td>
        				<td>${film.length }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold">releaseYear</td>
        				<td>${film.releaseYear }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold">language</td>
        				<td>${film.language }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold">rentalRate</td>
        				<td>${film.rentalRate }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold">rentalDuration</td>
        				<td>${film.rentalDuration }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold">specialFeatures</td>
        				<td>${film.specialFeatures }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold">rating</td>
        				<td>${film.rating }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold">description</td>
        				<td>${film.description }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold">replacementCost</td>
        				<td>${film.replacementCost }</td>
        			</tr>
        			<tr>
        				<td class="fw-semibold">lastUpdate</td>
        				<td>${film.lastUpdate }</td>
        			</tr>
        		</table> 
        		<div class="mb-3">
        			<a href="${pageContext.request.contextPath }/on/modifyFilm?filmId=${film.filmId}" class="btn btn-warning">수정</a>
        			<a href="${pageContext.request.contextPath }/on/removeFilm?filmId=${film.filmId}" class="btn btn-danger">삭제</a>
        			<span class="text-danger">${removeFilmMsg }</span>
        		</div>       			
        		
        		<div>
        			<span class="fw-semibold fs-5">영화장르</span>
        			<!-- 장르 추가, 장르 삭제 필요 -->
        			<!-- 이미 있는 카테고리를 선택한 경우 경고창 호출 -->
        			<form id="formFilmCategory" action="${pageContext.request.contextPath }/on/addFilmCategory" method="post">
        				<input type="hidden" name="filmId" value="${film.filmId }">
        				<select name="categoryId" id="categoryId">
        					<option value="">선택해주세요</option>
        					<!-- model.allCategoryList 받아오기 -->
        					<c:forEach var="ac" items="${allCategoryList }">        					
	        					<option value="${ac.categoryId }">${ac.name }</option>
        					</c:forEach>
        				</select>
        				<button type="button" id="btnFilmCategory" class="btn btn-warning">추가</button>
        			</form>
        			
        			<!-- filmCategoryList -->
        			<c:forEach var="fc" items="${filmCategoryList }">
       					<div>
       						${fc.name }
	        				<a href="" class="btn btn-warning">삭제</a>       						        					
       					</div>
       				</c:forEach>
        		</div>
        		<div>
        			<span class="fw-semibold fs-5">출연배우</span>
        			<!-- 배우 추가, 배우 삭제 필요 -->
        			<div>
        				<div class="d-flex">
        					<!-- 검색 폼 -->
        					<form action="" method="post"> 
	        					<input type="text" name="searchName">
	        					<button type="button" class="btn btn-warning">검색</button>
	        				</form>
	        			
	        				<!-- 선택 폼 -->
	        				<form action="" method="post">
		        				<select name="categoryId" id="categoryId">
		        					<option value="">선택해주세요</option>
		        					<!-- model.actorList 받아오기 -->
		        					<option value=""></option>
		        				</select>
		        				<button type="button" class="btn btn-warning">추가</button>
		        			</form>
        				</div>
        				
        				<c:forEach var="a" items="${actorList }">
        					<div>
		        				<a href="${pageContext.request.contextPath }/on/actorOne?actorId=${a.actorId}" >
		        					${a.firstName } ${a.lastName }
		        				</a> 
		        				<a href=""  class="btn btn-warning">삭제</a>       						        					
        					</div>
        				</c:forEach>
        			</div>
        		</div>
        	</div>
        </div>
    </body>
    <script type="text/javascript">
    	$('#btnFilmCategory').click(function(){
    		if($('#categoryId').val() == '') {
    			alert('장르를 선택해주세요')
    		} else {
    			$('#formFilmCategory').submit()
    		}
    	})
    </script>
</html>