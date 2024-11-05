<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div style="padding: 10px 0px 10px 10px; height: 100vh">
    <div class="bg-light text-center">
        <h1>
            <a href="${pageContext.request.contextPath}/on/main">HOME</a>
        </h1>
        <div class="w-100 mt-3 mb-3">
            <a href="${pageContext.request.contextPath}/on/staffOne">
	            <img class="staffImg" src="${pageContext.request.contextPath}/images/cat.png" alt="회원이미지">
	            <br>
            	<span class="fw-semibold">${loginStaff.userName}</span>님 반갑습니다.
            </a>
        </div>
    </div>

    <div class="accordion " id="accordionExample">
        <!-- Store 관리 -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                    <i class="bi bi-shop me-2"></i>
                    Store 관리
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <a href="${pageContext.request.contextPath}/on/branch/add" class="pb-3">Store 추가</a>
                    <br>
                    <a href="${pageContext.request.contextPath}/on/branch/edit">Store 수정</a>
                </div>
            </div>
        </div>

        <!-- Staff 관리 -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    <i class="bi bi-person-gear me-2"></i>
                    Staff 관리
                </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <a href="${pageContext.request.contextPath}/on/staffList" class="pb-3">Staff 리스트</a>
                    <br>
                    <a href="${pageContext.request.contextPath}/on/addStaff">Staff 추가</a>
                </div>
            </div>
        </div>

        <!-- 고객 관리 -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    <i class="bi bi-people me-2"></i>
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
        
        <!-- 배우 관리 -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                    <i class="bi bi-stars me-2"></i>
                    Actor 관리
                </button>
            </h2>
            <div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <a href="${pageContext.request.contextPath}/on/actorList" class="pb-3">Actor 리스트</a>
                    <br>
                    <a href="${pageContext.request.contextPath}/on/addActor">Actor 추가</a>
                </div>
            </div>
        </div>
    </div>

    <a href="${pageContext.request.contextPath}/on/logout" class="btn btn-danger mt-3">Logout</a>
</div>