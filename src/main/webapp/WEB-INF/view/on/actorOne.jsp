<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<!-- bootstrap JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- menu.css -->
<link href="${pageContext.request.contextPath}/css/leftMenu.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<style type="text/css">
#formAddFilm {
	text-align: right;
}
</style>
</head>
<body class="container-flud">
	<div class="row w-100">
		<div class="col-sm-2 bg-light">
			<!-- leftMenu -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		<div class="col-sm-10">
			<!-- Main -->
			<h2 class="mt-3 fw-semibold">배우 상세보기</h2>

			<!-- ●
        			● 1) actor 상세 완료, 
        			● 1-1) actor 수정 /on/modifyActor
        			● 1-2) actor 삭제 /on/removeActor(actor_file, actor가 출연한 flimList, actor 삭제)
        			● 2) actor_file List 완료
        			● 2-1) actor_file 추가 완료
        			● 2-3) actor_file 개별 
        			● 3) film_actor List 완료,  
        			● 3-1) film_actor 추가 /on/addFilmByActor -> 필름 검색 후 선택
	        		● 3-2) film_actor 삭제 /on/removeFilmByActor
        		-->

			<!-- actor -->
			<table class="table table-bordered mt-3">
				<tr>
					<td class="fw-semibold">actorId</td>
					<td>${actor.actorId }</td>
				</tr>
				<tr>
					<td class="fw-semibold">firstName</td>
					<td>${actor.firstName }</td>
				</tr>
				<tr>
					<td class="fw-semibold">lastName</td>
					<td>${actor.lastName }</td>
				</tr>
				<tr>
					<td class="fw-semibold">lastUpdate</td>
					<td>${actor.lastUpdate }</td>
				</tr>
			</table>
			<div>
				<!-- 과제 : 입력폼, 액션, 서비스, 맵퍼 -->
				<a
					href="${pageContext.request.contextPath }/on/modifyActor?actorId=${actor.actorId}"
					class="btn btn-warning"> 수정 </a> <a
					href="${pageContext.request.contextPath }/on/removeActor?actorId=${actor.actorId}"
					class="btn btn-danger"> 삭제 </a>
			</div>
			<!-- actor file -->
			<table class="table table-bordered mt-3">
				<tr>
					<td class="fw-semibold">Image</td>
					<td class="fw-semibold">Type</td>
					<td class="fw-semibold">Size</td>
					<td class="fw-semibold">Create Date</td>
					<td class="fw-semibold">Delete</td>
				</tr>
				<tr>
					<c:choose>
					    <c:when test="${actorFileList == null || actorFileList.isEmpty()}">
					        <td colspan="5" class="text-center">첨부된 파일이 없습니다</td>
					    </c:when>
					    <c:otherwise>
					        <c:forEach var="af" items="${actorFileList}">
					            <tr>
					                <td><img class="w-25" alt="fileImg" src="${pageContext.request.contextPath}/upload/${af.filename}.${af.ext}"></td>
					                <td>${af.type}</td>
					                <td>${af.size} Byte</td>
					                <td>${af.createDate}</td>
					                <td><a href="${pageContext.request.contextPath}/on/removeActorFile?actorFileId=${af.actorFileId}&actorId=${actor.actorId}" class="btn btn-danger">삭제</a></td>
					            </tr>
					        </c:forEach>
					    </c:otherwise>
					</c:choose>
				</tr>
			</table>
			<div>
				<a
					href="${pageContext.request.contextPath}/on/addActorFile?actorId=${actor.actorId}"
					class="btn btn-warning">파일 추가</a>
			</div>

			<!-- film -->
			<div>
				<span class="fw-semibold fs-5 d-block mt-3 mb-3">출연작품</span>
				<div class="d-flex">
					<!-- 출연작품 추가 -->

					<!-- 영화 검색 -->
					<form id="formSearchFilm" class=" w-25"
						action="${pageContext.request.contextPath }/on/actorOne"
						method="get">
						<!-- film 검색 시 필요한 actorId도 같이 전송 -->
						<input type="hidden" name="actorId" value="${actor.actorId }">
						<input type="text" name="searchTitle">
						<button id="btnSearchFilm" class="btn btn-warning">검색</button>
					</form>

					<!-- 영화 선택 -->
					<form id="formAddFilm" class=" w-100"
						action="${pageContext.request.contextPath }/on/addFilmActorByActor"
						method="post">
						<input type="hidden" name="actorId" value="${actor.actorId }">
						<select size="5" name="filmId" class="form-select w-100">
							<c:forEach var="sf" items="${searchFilmList }">
								<option value="${sf.filmId }">${sf.title }</option>
							</c:forEach>
						</select>
						<button id="btnAddFilm" class="btn btn-warning mt-3 mb-3">추가</button>
					</form>
				</div>
				<table class="table table-bordered mt-3">
					<tr>
						<td class="fw-semibold">출연작</td>
						<td class="fw-semibold">삭제</td>
					</tr>
					<c:forEach var="f" items="${filmList }">
						<tr>
							<td><a
								href="${pageContext.request.contextPath }/on/filmOne?filmId=${f.filmId}">${f.title }</a>&nbsp;
							</td>
							<td>
								<!-- 삭제 시 f.filmId, actor.actorId 필요 --> <a
								href="${pageContext.request.contextPath }/on/removeFilmActorByActor?FilmId=${f.filmId}&actorId=${actor.actorId}"
								class="btn btn-danger"> 삭제 </a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	// film 타이틀을 검색하는 버튼
	$('#btnSearchFilm').click(function() {
		$('#formSearchFilm').submit();
	});

	// 출연작을 추가하는 버튼
	$('#btnAddFilm').click(function() {
		$('#formAddFilm').submit();
	});
</script>
</html>