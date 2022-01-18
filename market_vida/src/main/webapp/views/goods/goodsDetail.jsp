<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">

	:root {
		--my-color: #006F00;
		--base-color: #EFEFEF;
		--font-color: dimgray;
	}
	
	body {
		width:100%;
		height:100vh;
	}
	
	*{
		margin: 0;
		padding: 0;
	}
	
	.goodsDetailBody {
		width: 1000px;
		margin: 0 auto;
	}
	
	.goodsMainInfo {
		display: flex;
		gap: 0 70px;
		flex-grow: 2;
	}
	
	.goodsDesc {
		flex-grow: 3;
	}
	
 	.goodsDesc p span:not(#priceinKorean) {
		font-size: x-large;
		font-weight: bold;
		padding-bottom: 20px;
	} 
	
	.goodsDesc p:first-child {
		font-weight: bold;
		padding-bottom: 30px;
	}
	
	.dlList {
		padding: 20px 0;
	}
	
	.goodsDesc dl {
		display: flex;
		padding: 10px 0;
	}
	
	.goodsDesc dt {
		width: 120px;
	}

	
	input[type="number"]::-webkit-inner-spin-button {
		-webkit-appearance: none;
		margin: 0;
	}
	
	.dlList input[type="button"], input[type="number"] {
		background-color: white;
	 	border: none; 
		text-align: center;
		
	}
	
	.dlList input[type="button"] {
		font-size: large;
		padding: 0 5px;
		width: 30px;
		cursor: grabbing;
	}
	
	.dlList input[type="number"] {
		width: 20px;
	}
	
	.dlList #spanQty {
		border: 3px solid var(--base-color);
   		border-radius: 5px;
   		padding: 3px 0;
   		font-weight: bold;
	}
	
	
	.showAmount {
		text-align: right;
		font-weight: bold;
		border-top: 2px solid var(--base-color);
		padding: 20px 0;
	}

	.getMine {
		display: flex;
		gap: 0 30px;
		height: 55px;
		
	}
	
	.getMine #toMyfavorite {
		flex-grow: 1;
		border: 2px solid var(--base-color);
		background-image: url("../resources/img/heart.png");
		border-radius: 3px;
		background-size: 30px;
	    background-color: white;
	    background-repeat: no-repeat;
	    background-position: center;
	    cursor: grabbing;
	}
	
	.getMine #toCart {
		border-radius: 3px;
		flex-grow: 3;
		border: none;
		background-color: var(--my-color);
		color: white;
		font-weight: bold;
		font-size: x-large;
		cursor: grabbing;
	}
	
	.subInfo {
		margin: 80px 0;
	}
	
	.tabsItems>img {
		text-align: center;
	}
	
	.tabsItems {
		color: var(--font-color);
	}
	
	.tabs {
		display: flex;
		flex-direction: row;
		justify-content: space-around;
	}
	
	.tab {
		background-color: var(--base-color);
	    color: var(--font-color);
		
	}
	
	.tab.active {
		color: var(--my-color);
		background-color: white;
		border-top: 2px solid var(--my-color);
		border-left: 2px solid var(--my-color);
		border-right: 2px solid var(--my-color);
		border-bottom: none;
	}
	
	
	.tabs div {
		width: 100%;
		height: 70px;
		cursor: grabbing;
		background-color: var(--base-color);
		text-align: center;
		display: flex;
	    justify-content: center;
	    align-items: center;
	    color: var(--font-color);
	    border: 1.5px solid white;
	    border-bottom: 2px solid var(--my-color);
	}
	
	
	.items {
		width: 100%;
		display: none;
		text-align: center;
		margin: 70px 0;
	}
	
	.items.active {
		display: inline-block;
	}
	
	.desciption {
		width: 80%;
		margin: 100px auto;
		border: 1.5px solid var(--base-color);
		border-collapse: collapse;
	}
	
	.desciption th {
		background-color: var(--base-color);
		color: var(--font-color);
		width: 130px;
		
	}
	
	.desciption tr {
		height: 40px;
		border: 1.5px solid var(--base-color);
		color: var(--font-color);
		font-size: medium;
	}
	
	.goodsQna_info {
		margin: 0 auto;
    	padding: 0 50px;
    	text-align: left;
	}
	
	.qnaTable {
	    width: 100%;
   		margin: 50px auto;
   		border-collapse: collapse;
	    border-left: hidden;
	    border-right: hidden;
	}
	
	.qnaTable tr th {
	    height: 50px;
	    border-top: 2px solid var(--font-color);
	    border-bottom: 1px solid var(--font-color);
	}
	
	.qnaTable .qna_row td {
	    border-right: hidden;
  		border-left: hidden;
  		height: 45px;
    	border-bottom: 1px solid var(--base-color);
	}
	
	.qnaTable .goods_qna_contents {
		display: none;
	}
	
	.qnaTable .goods_qna_contents.active {
		display: block;
		border-bottom: hidden;
	}
	
	.goods_qna_contents .question {
		text-align: left;
   		padding: 30px;
	}

	
	.qnaBottom {
		text-align: end;
   		padding: 40px;
	}
	
	#writeGoodsQna {
	    width: 150px;
	    height: 50px;
	    color: white;
	    background-color: var(--my-color);
	    border: none;
	    border-radius: 3px;
	    font-size: medium;
	    font-weight: bold;
	    cursor: grabbing;
	}
	
	.quaModal {
		position: fixed;
		top: 0; 
		left: 0; 
		width: 100%; 
		height: 100%;
		display: none;
		background-color: rgba(0, 0, 0, 0.4);
	}
	
	.quaModal.show {
		display: block;
	}
	
	.modalBody {
	    position: relative;
	    margin: 5vh auto;
		width: 800px;
		height: 600px;
		background-color: white; 
		border-radius: 10px; 
		box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
		padding: 25px 40px;
	}
	
	.goodsInfoQna {
		display: flex;
    	margin: 10px 0;
	    padding: 15px 0;
	    border-top: 2px solid var(--base-color);
	    border-bottom: 1px solid var(--base-color);
	}
	
	.goodsInfoQna strong {
		align-self: center;
	}
	
	.goodsInfoQna img {
		 width: 70px;
   		 height: 70px;
   		 border-radius: 3px;
    	 margin-right: 50px;
	}
	
	.goodsQnaTnC {
	    padding: 20px 0;  
	    border-bottom: 1px solid var(--base-color)
	}
	
	.qnaTitle input[type="text"] {
		width: 90%;
	    padding: 7px;
	    margin: 0 10px;
	    border: 1.5px solid silver;
	    border-radius: 3px;
	}
	
	.qnaContents textarea {
		width: 90%;
	    padding: 7px;
	    margin: 20px 10px;
	    align-self: flex-end;
	    border: 1.5px solid silver;
	    border-radius: 3px;
	    display: inline-table;
	    height: 220px;
	}
	
	
	.secretYN {
		padding: 0 50px;
	}
	
	.secretYN p {
		display: contents;
	}
	
	.modalButton {
		margin: 20px 0;
  		text-align: center;
	}
	
	.modalButton input[type="button"], input[type="submit"] {
		width: 150px;
	    height: 50px;
	    border: 1px solid var(--my-color);
	    border-radius: 5px;
	    background-color: white;
	    font-size: large;
	    font-weight: bold;
	    color: var(--my-color);
	    margin: 0 20px;
	}
	
	.modalButton input[type="button"]:hover, input[type="submit"]:hover {
	    color: white;
	    background-color: var(--my-color);
	}

	
</style>

<script type="text/javascript">
	$(function(){
		
		calculateAmount();
		adjustQty();
		addMyfavorite();	
		chooseTab();
		writeGoodsQna();
		showQnaDetail();
		
	});
	
	
	/* 문의 상세보기 */
	function showQnaDetail(){
		var qna_row = document.querySelectorAll('.qna_row');
		var goods_qna_contents = document.querySelectorAll('.goods_qna_contents');
		
		console.dir(qna_row);
		console.dir(goods_qna_contents);
		
		qna_row.forEach((row) => {
			row.addEventListener('click', () =>{
				
				var qnaDetail = row.rowIndex+1;
				goods_qna_contents.forEach((cont)=>{
					if(cont.rowIndex==qnaDetail){
							cont.className = 'goods_qna_contents active';
					}else{
							cont.className = 'goods_qna_contents';
					}
				});

			});
		});

	}
	
	
	/* 문의 모달창 */
	function writeGoodsQna(){
		$('#writeGoodsQna').on('click', function(){
			console.dir($('.quaModal'))
			$('.quaModal')[0].classList.toggle('show');
			$('body')[0].style.overflow = 'hidden';
		});
		
		$('#modalBackButton').on('click', function(){
			console.dir($('#modalBackButton'));
			$('.quaModal')[0].classList.toggle('show');
			$('body')[0].style.overflow = 'auto';
		})
		
	}
	
	
	/* 가격 계산 */
	function calculateAmount(){	
		console.dir($('#goodsAmount'));
		$('#goodsAmount')[0].toLocaleString('ko-KR');
		$('#goodsAmount')[0].innerText = $('#inputQty')[0].valueAsNumber*$('#discountPrice')[0].textContent;
		$('#goodsAmount')[0].style.fontSize="xx-large";
		
	}
	
	
	/* 수량 조정 */
	function adjustQty(){
		var inputQty = $('#inputQty')[0];
		
		$('#minusQty').on('click', function(){
			if (inputQty.valueAsNumber > 1){
				inputQty.valueAsNumber -= 1;
			}
			
			calculateAmount();
		});
		
		$('#plusQty').on('click', function(){
			if (inputQty.valueAsNumber < 50) {
				inputQty.valueAsNumber += 1;
			}else if (inputQty.valueAsNumber>=50){
				alert("최대 구매수량은 50입니다.");
			}
			
			calculateAmount();
		});	
		
	}
	
	
	/* 찜하기 */
	function addMyfavorite(){
		var index = 0;
		$('#toMyfavorite').on('click', function(){
			index ++;
			if (index%2!=0){
				$('#toMyfavorite')[0].style.backgroundImage='url("../resources/img/filledheart.png")'; 
			}else {
				$('#toMyfavorite')[0].style.backgroundImage='url("../resources/img/heart.png")';
			}
			if (index>=10) index = 0;
		})
	}
	
	
	/* 장바구니 */
	function addCart(){
		
	}
	
	
	/* 상품 상세 정보 탭 */
	function chooseTab(){
		var tabs = document.querySelectorAll('[data-tab-target]');
		var tabItems = document.querySelectorAll('[data-tab-content]');
		
		tabs.forEach((tab) => {
			tab.addEventListener('click', () => {
				
				var target = document.querySelector(tab.dataset.tabTarget);
				tabItems.forEach((items)=>{
					items.classList.remove('active');
					
					tabs.forEach((tab2) =>{
						tab2.className='tab';
						
					});
					
				});
			
				tab.className='tab active';
				target.classList.add('active');	
			});
			
			});
			
		}
		
	
		

</script>
</head>
<body>

	<div class="goodsDetailBody">
		<div class="goodsMainInfo">
			<div class="mainImg">
			<c:forEach var="detailImgDto" items="${ detailImgDto}" varStatus="status">
				<c:if test="${status.first==true}">
					<img src="${detailImgDto.img_name }" alt="${detailImgDto.img_name }" />
					<c:set var="mainGoodsImg" value="${detailImgDto.img_name }"></c:set>
				</c:if>
			</c:forEach>
			</div>
			<div class="goodsDesc">
				<c:set var="discountPrice" value="${Math.round(goodsDto.goods_price-(goodsDto.goods_price*(goodsDto.discount_rate/100))) }" />
				<p><span>${goodsDto.goods_name }</span></p>
				<p><span id="discountPrice">${discountPrice}</span>원</p>
				<div class="dlList">
					<dl>
						<dt>판매단위</dt>
						<dd>${goodsDto.qty }</dd>
					</dl>
					<dl>
						<dt>포장타입</dt>
						<dd>${goodsDto.package_type }</dd>
					</dl>
					<dl>
						<dt>원산지</dt>
						<dd>${goodsDto.origin }</dd>
					</dl>
					<dl>
						<dt>상품정보</dt>
						<dd>${goodsDto.goods_info }</dd>
					</dl>
					<dl>
						<dt>구매수량</dt>
						<dd>
							<span id="spanQty">
								<input type="button" value="-" id="minusQty"/>
								<input type="number" name="" id="inputQty" value="1" size="1" min="1" max="50" readonly="readonly" />
								<input type="button" value="+" id="plusQty" />
							</span>
						</dd>
					</dl>	
				</div>
				<p class="showAmount">
					<span id="priceinKorean">총 금액 : </span>
					<span id="goodsAmount"></span>원
				</p>
				<div class="getMine">
					<input type="button" value="" id="toMyfavorite"/>
					<input type="button" value="장바구니" id="toCart"/>	
				</div>
			</div>
		</div>
		
		<div class="subInfo">
		
			<!-- 탭으로 상품 상세페이지 구현 -->
			<div class="tabs">
				<div class="tab active" data-tab-target="#tab1">
					<h3>상품설명</h3>
				</div>
				<div class="tab" data-tab-target="#tab2">
					<h3>상세정보</h3>
				</div>
				<div class="tab" data-tab-target="#tab3">
					<h3>후기</h3>
				</div>
				<div class="tab" data-tab-target="#tab4">
					<h3>문의</h3>
				</div>
			</div>
			<div class="tabsItems">
			<!-- 상품설명 -->
				<div id="tab1" data-tab-content class="items active">
				<c:forEach var="detailImgDto" items="${ detailImgDto}" varStatus="status">
					<c:if test="${status.first==false}">
						<img src="${detailImgDto.img_name }" alt="${detailImgDto.img_name }" />
					</c:if>
				</c:forEach>
				</div>
			<!-- 상세정보 -->
				<div id="tab2" data-tab-content class="items">
					<table class="desciption">
						<tr>
							<th>상품 ID</th>
							<td>${goodsDto.goods_no }</td>
							<th>규격</th>
							<td>${goodsDto.qty }</td>
						</tr>
						<tr>
							<th>원산지</th>
							<td>${goodsDto.origin }</td>
							<th>재고수량</th>
							<td>${goodsDto.stock }</td>
						</tr>
						<tr>
							<th>상세정보</th>
							<td>${goodsDto.goods_info }</td>
							<th>보관방법</th>
							<td>${goodsDto.package_type } 보관</td>
						</tr>
						<tr>
							<th>영양성분</th>
							<td>상품설명 및 상품이미지 참조</td>
							<th>섭취 주의사항</th>
							<td>상품설명 및 상품이미지 참조</td>
						</tr>
						
					</table>
				</div>
			<!-- 후기 -->
				<div id="tab3" data-tab-content class="items">
					<p>후기블라</p>
				</div>
			<!-- 문의 -->
				<div id="tab4" data-tab-content class="items">
					<div class="goodsQna_info">
						<ul>
							<li>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
							<li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이비다 내 <a href="./board/qnaboard">1:1문의</a>에 남겨주세요.</li>
						</ul>
					</div>
					
					<div class="quaList">
						<table class="qnaTable">
							<colgroup>
								<col style='width:60%'/>
								<col style='width:15%'/>
								<col style='width:15%'/>
								<col style='width:10%'/>
							</colgroup>
							<tr>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>답변상태</th>
							</tr>
							<c:forEach var="goodsQnaDto" items="${goodsQnaDto }">
							<tr class="qna_row">
									<td>${goodsQnaDto.goods_qna_title }</td>
									<td>${goodsQnaDto.crew_id }</td>
									<td>${goodsQnaDto.goods_qna_date }</td>
									<td>${goodsQnaDto.qna_status }</td>
							</tr>
							<tr class="goods_qna_contents" >
								<td colspan="4">
									<div class="question">${goodsQnaDto.goods_qna_contents }</div>
									<c:choose>
										<c:when test="${goodsQnaDto.goods_qna_answer != null }">
											<div class="answer">${goodsQnaDto.goods_qna_answer }</div>
											<input type="button" value="수정" />
											<input type="button" value="답변 삭제" />
										</c:when>
										<c:when test="${goodsQnaDto.goods_qna_answer == null }">
											<div class="answer">
												<textarea name="goods_qna_answer" id="goods_qna_answer" cols="30" rows="10"></textarea>
												<input type="button" value="지우기" />
												<input type="button" value="답변등록" />
											</div>
										</c:when>
									</c:choose>
								</td>
							</tr>
							</c:forEach>
						</table>
				
					</div>
					<div class="qnaBottom">
						<input type="button" value="문의하기" id="writeGoodsQna"/>
					</div>
					
				</div>
			
			</div>
		</div>
	</div>
	
	<jsp:include page="../main/footer.jsp"/>
	
	<!-- 모달창 -->
	<div class="quaModal">
	<form action="writeGoodsQna" method="post">
		<div class="modalBody">
			<div>
				<h3>상품 문의하기</h3>
			</div>
			<div class="goodsInfoQna">
				<img src="${mainGoodsImg }" alt="${goodsDto.goods_name }" />
				<strong>${goodsDto.goods_name }</strong>
			</div>
			<div class="goodsQnaTnC">
				<div class="qnaTitle">
					<strong>제목</strong> 
					<input type="text" name="goods_qna_title" id="" placeholder="제목을 입력해주세요" /> 
					<input type="hidden" name="goods_no" value="${goodsDto.goods_no }" />

				</div>
				<div class="qnaContents">
				<strong>내용</strong> 
				<textarea name="goods_qna_contents" maxlength="3000"
					placeholder="상품문의 작성 전 확인해 주세요
								해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.
								배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이비다 내 1:1 문의에 남겨주세요.">
				</textarea>
				</div>	
				<div class="secretYN">
					<input type="checkbox" name="secretYN" id="" />
					<p>비밀글로 문의하기</p>
				</div>
			</div>
			<div class="modalButton">
				<input type="button" value="취소" id="modalBackButton" />
				<input type="submit" value="등록" />
			</div>
		</div>
		</form>
	</div>
	
</body>
</html>