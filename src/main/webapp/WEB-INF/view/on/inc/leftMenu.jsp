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
                    Store & Inventory 관리
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                	<!-- 
                		storeList : StoreMapper.selectStoreList() : Map - store x staff x adress
                		addStore : StoreService.getStoreList() : List<Map>
                		GET - /on/storeList -> storeController.storeList() -> storeList.jsp
                	 -->
                    <a href="${pageContext.request.contextPath}/on/storeList" class="pb-3">Store 리스트</a>
                    <br>
                    <a href="${pageContext.request.contextPath}/on/addStore" class="pb-3">Store 추가</a>
                    <!-- 
                    	Get - /on/addStore 
                    	- StoreController.addStore() : staffList 모델추가, search주소검색 결과 모델추가 -> addStore.jsp 
                    	
                    	StoreMapper.insertStore() : Integer
                    	StoreService.addStore() : Integer
                    	Post - /on/addStore 
                    	- StoreController.addStore(Store) - 
                     -->
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
                    <a href="${pageContext.request.contextPath}/on/customerList" class="pb-3">고객 리스트</a>
                    <br>
                    <a href="${pageContext.request.contextPath}/on/addCustomer">고객 추가</a>
                </div>
            </div>
        </div>
        <!-- 영화 관리 -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                    <i class="bi bi-film me-2"></i>
                    영화 관리
                </button>
            </h2>
            <div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <a href="${pageContext.request.contextPath}/on/categoryList" class="pb-3">장르 리스트</a>
                    <br>
                    <a href="${pageContext.request.contextPath}/on/addCategory" class="pb-3">장르 추가</a>
                    <br>
                    <a href="${pageContext.request.contextPath}/on/languageList" class="pb-3">언어 리스트</a>
                    <br>
                    <a href="${pageContext.request.contextPath}/on/addLanguage" class="pb-3">언어 추가</a>
                    <br>
                    <a href="${pageContext.request.contextPath}/on/filmList" class="pb-3">영화 리스트</a>
                    <br>
                    <a href="${pageContext.request.contextPath}/on/addFilm">영화 추가</a>
                </div>
            </div>
        </div>
        
        <!-- 배우 관리 -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                    <i class="bi bi-stars me-2"></i>
                    Actor 관리
                </button>
            </h2>
            <div id="collapseFive" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <a href="${pageContext.request.contextPath}/on/actorList" class="pb-3">Actor 리스트</a>
                    <br>
                    <a href="${pageContext.request.contextPath}/on/addActor">Actor 추가</a>
                </div>
            </div>
        </div>
        <!-- 통계 -->
        <!-- 
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                    <i class="bi bi-bar-chart-line me-2"></i>
                    통계
                </button>
            </h2>
            <div id="collapseSix" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <a href="${pageContext.request.contextPath}/on/actorList" class="pb-3">통계 리스트</a>
                    <br>
                    <a href="${pageContext.request.contextPath}/on/addActor">통계 추가</a>
                </div>
            </div>
        </div>
	 	-->
    </div>
    <a href="${pageContext.request.contextPath}/on/logout" class="btn btn-danger mt-3">Logout</a>
</div>