<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
    <div class="bg-light text-center mt-3">
        <h1>
            <a href="${pageContext.request.contextPath}/on/main">HOME</a>
        </h1>
        <div class="w-100">
            <a href="${pageContext.request.contextPath}/on/staffOne">
	            <img class="staffImg" src="${pageContext.request.contextPath}/images/cat.png" alt="회원이미지">
	            <br>
            	<span>${loginStaff.userName}님 반갑습니다.</span> 
            </a>
        </div>
    </div>

    <div class="accordion" id="accordionExample">
        <!-- Store 관리 -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                    Store 관리
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <a href="${pageContext.request.contextPath}/on/branch/add" class="pb-3">지점 추가</a>
                    <br>
                    <a href="${pageContext.request.contextPath}/on/branch/edit">지점 수정</a>
                </div>
            </div>
        </div>

        <!-- Staff 관리 -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    Staff 관리
                </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <a href="${pageContext.request.contextPath}/on/staffList" class="pb-3">스탭 리스트</a>
                    <br>
                    <a href="${pageContext.request.contextPath}/on/addStaff">스탭 추가</a>
                </div>
            </div>
        </div>

        <!-- 고객 관리 -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    고객 관리
                </button>
            </h2>
            <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <a href="${pageContext.request.contextPath}/on/customer/add" class="pb-3">고객 추가</a>
                    <br>
                    <a href="${pageContext.request.contextPath}/on/customer/edit">고객 수정</a>
                </div>
            </div>
        </div>
    </div>

    <a href="${pageContext.request.contextPath}/on/logout" class="btn btn-danger mt-3">Logout</a>
</div>