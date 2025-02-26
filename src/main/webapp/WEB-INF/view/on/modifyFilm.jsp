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
        		<h2 class="mt-3 fw-semibold">영화 정보 수정</h2>
        		<form action="${pageContext.request.contextPath}/on/modifyFilm" method="post" id="formModifyFilm">
	        		<table class="table table-bordered mt-3">
	        			<tr>
	        				<td class="fw-semibold">filmId</td>
	        				<td>
								<input type="text" value="${film.filmId }" name="filmId" readonly>
							</td>
	        			</tr>
	        			<tr>
	        				<td class="fw-semibold">title</td>
	        				<td>
								<input type="text"name="title" id="title">
							</td>
	        			</tr>
	        			<tr>
        					<td class="fw-semibold">languageId</td>
        					<td>
        						<select id="languageId" name="languageId" class="form-select ">
        							<option value="">언어 선택</option>
        							<c:forEach var="la" items="${languageList }">
        								<option value="${la.languageId }">${la.name }</option>
        							</c:forEach>
        						</select>
        					</td>
        				</tr>
        				<tr>
	        				<td class="fw-semibold">rentalDuration</td>
	        				<td>
								<input type="number" id="rentalDuration" name="rentalDuration" value="3">
							</td>
	        			</tr>
	        			<tr>
	        				<td class="fw-semibold">rentalRate</td>
	        				<td>
								<input type="number" id="rentalRate" name="rentalRate" value="4.99">
							</td>
	        			</tr>
	        			<tr>
	        				<td class="fw-semibold">replacementCost</td>
	        				<td>
								<input type="number" id="replacementCost" name="replacementCost" value="19.99">
							</td>
	        			</tr>
	        			<tr>
        					<td class="fw-semibold">rating</td>
        					<td>
        						<!-- radio -->
        						<!-- eunm(G,PG,PG-13,R,NC-17)타입, DB기본값 : "G" -->
        						<input type="radio" name="rating" id="rating" class="rating " value="G">
        						<label>G</label>
        						<input type="radio" name="rating" class="rating" value="PG"> PG
        						<input type="radio" name="rating" class="rating" value="PG-13"> PG-13
        						<input type="radio" name="rating" class="rating" value="R"> R
        						<input type="radio" name="rating" class="rating" value="NC-17"> NC-17
        					</td>
        				</tr>
	        			<tr>
        					<td class="fw-semibold">description</td>
        					<td>
        						<!-- textarea -->
        						<textarea rows="3" cols="50" id="description" name="description"></textarea>
        					</td>
        				</tr>
	        			<tr>
        					<td class="fw-semibold">releaseYear</td>
        					<td>
        						<input type="number" id="releaseYear" name="releaseYear">
        					</td>
        				</tr>
        				<tr>
        					<td class="fw-semibold">originalLanguageId</td>
        					<td>
        						<select id="originalLanguageId" name="originalLanguageId"  class="form-select ">
        							<option value="">오리지널 언어 선택</option>
        							<c:forEach var="la" items="${languageList }">
        								<option value="${la.languageId }">${la.name }</option>
        							</c:forEach>
        						</select>
        					</td>
        				</tr>
        				<tr>
        					<td class="fw-semibold">length</td>
        					<td>
        						<input type="number" id="length" name="length" value="0">분
        					</td>
        				</tr>
        				<tr>
        					<td class="fw-semibold">specialFeatures</td>
        					<td>
        						<!-- checkbox -->
        						<!-- set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes')타입, DB기본값 : null -->
        						<input type="checkbox" name="specialFeatures" id="specialFeatures" value="Trailers">Trailers
        						<input type="checkbox" name="specialFeatures" id="specialFeatures" value="Commentaries">Commentaries
        						<input type="checkbox" name="specialFeatures" id="specialFeatures" value="Deleted Scenes">Deleted Scenes
        						<input type="checkbox" name="specialFeatures" id="specialFeatures" value="Behind the Scenes">Behind the Scenes
        					</td>
        				</tr>
	        		</table> 
	        		<button type="button" class="mb-3 btn btn-warning" id="btnModifyFilm">
	        			수정
	        		</button>
        		</form>
        	</div>
        </div>
    </body>
    <script type="text/javascript">
    	$('#btnModifyFilm').click(function() {
    		// 폼 유효성 검사(description,releaseYear,originalLanguageId, length, specialFeatures 제외)
    		if($('#title').val() == '') {
    			alert('title을 입력해주세요');
    		} else if($('#languageId').val() == '') {
    			alert('languageId을 입력해주세요');
    		} else if($.isNumeric($('#rentalDuration').val()) == false) {
    			alert('rentalDuration 숫자를 입력해주세요');
    		} else if($.isNumeric($('#rentalRate').val()) == false) {
    			alert('rentalRate 숫자를 입력해주세요');
    		}  else if($.isNumeric($('#replacementCost').val()) == false) {
    			alert('replacementCost 숫자를 입력해주세요');
    		} else if($('.rating:checked').length == 0) {
    			alert('rating을 선택해주세요');
    		} else {
	    		$('#formModifyFilm').submit();    			
    		} 
    		
    	})
    </script>
</html>