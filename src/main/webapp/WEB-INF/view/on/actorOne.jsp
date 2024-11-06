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
        		<h2 class="mt-3 fw-semibold">Actor 정보</h2>
        		<!-- actor -->
        		<table class="table table-bordered mt-3">
        			<tr>
        				<td>actorId</td>
        				<td>${actor.actorId }</td>
        			</tr>
        			<tr>
        				<td>firstName</td>
        				<td>${actor.firstName }</td>
        			</tr>
        			<tr>
        				<td>lastName</td>
        				<td>${actor.lastName }</td>
        			</tr>
        			<tr>
        				<td>lastUpdate</td>
        				<td>${actor.lastUpdate }</td>
        			</tr>
        		</table>
        		<div>
        			<a href="">actor 수정</a>
        		</div>
        		<!-- actor file -->
        		<table class="table table-bordered mt-3">
        			<tr>
        				<td>image</td>
        				<td>type</td>
        				<td>size</td>
        				<td>createDate</td>
        				<td>삭제</td>
        			</tr>
        			<c:forEach var="af" items="${actorFileList }">
        				<tr>
        					<td>
        						<img alt="fileImg" src="${pageContext.request.contextPath }/upload/${af.filename}.${af.ext}"> 
        					</td>
        					<td>${af.type }</td>
        					<td>${af.size} Byte</td>
        					<td>${af.createDate}</td>
        					<td>
        						<a href="">삭제</a>
        					</td>
        				</tr>
        			</c:forEach>
        		</table>
        		<div>
        			<a href="">파일 추가</a>
        		</div>
        		
        		<!-- film -->
        		<div>
        			<span class="fw-semibold fs-5">출연작품</span>
        			<c:forEach var="f" items="${filmList }">
        				<a href="${pageContext.request.contextPath }/on/filmOne?filmId=${f.filmId}">${f.title }</a>&nbsp;
        			</c:forEach>
        		</div>
        	</div>
        </div>
    </body>
</html>