<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<ul class="list-group text-center bg-light">
	    <li class="list-group-item">
	    	<a href="${pageContext.request.contextPath }/on/main">HOME</a>	
	    </li>
	    <li class="list-group-item">
	    	<a href="${pageContext.request.contextPath }/on/staffOne">${loginStaff.userName }님 반갑습니다.</a>
        </li>
	    <li class="list-group-item">
	    	<a href="${pageContext.request.contextPath }/on/logout">Logout</a>	
	    </li>
	    
	    <!-- 지점메뉴 -->
	    <li class="list-group-item">
	    	<a href="${pageContext.request.contextPath }/on/logout">지점 관리</a>	
	    </li>
	    <li class="list-group-item">
	    	<a href="${pageContext.request.contextPath }/on/logout">지점 추가</a>	
	    </li>
	    <li class="list-group-item">
	    	<a href="${pageContext.request.contextPath }/on/logout">지점 수정</a>	
	    </li>
	    
	    <!-- 스탭메뉴 -->
	    <li class="list-group-item">
	    	<a href="${pageContext.request.contextPath }/on/logout">staff 관리</a>	
	    </li>
	    <li class="list-group-item">
	    	<a href="${pageContext.request.contextPath }/on/logout">staff 추가</a>	
	    </li>
	    <li class="list-group-item">
	    	<a href="${pageContext.request.contextPath }/on/logout">staff 수정</a>	
	    </li>
	    
		<!-- 고객메뉴 -->
	    <li class="list-group-item">
	    	<a href="${pageContext.request.contextPath }/on/logout">고객 관리</a>	
	    </li>
	    <li class="list-group-item">
	    	<a href="${pageContext.request.contextPath }/on/logout">고객 추가</a>	
	    </li>
	    <li class="list-group-item">
	    	<a href="${pageContext.request.contextPath }/on/logout">고객 수정</a>	
	    </li>
	    
	</ul>
</div>