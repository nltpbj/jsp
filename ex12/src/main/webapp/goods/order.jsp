<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	span {
		width: 150px;
	}
</style>    
<div>
	<h1>주문하기</h1>
	<div id="div_order"></div>
	<div id="div_ototal" class="alert alert-secondary text-end">총 합계:</div>
	<div class="row justify-content-center my-5">
		<div class="col-10 col-md-8">
			<div class="card">
			 	<div class="card-header text-center">
			 		<h3>배송자정보</h3>
			 	</div>
			 	<div class="card-body">
			 		<form name="frm">
			 			<div class="input-group  mb-2">
			 				<span class="input-group-text">주문자명</span>
			 				<input  name="rname" class="form-control" value="${user.uname}">
			 			</div>
			 			<div class="input-group  mb-2">
			 				<span class="input-group-text">전화번호</span>
			 				<input name="rphone" class="form-control" value="${user.phone}">
			 			</div>
			 			<div class="input-group mb-2">
			 				<span class="input-group-text">주소</span>
			 				<input name="raddress1" class="form-control" value="${user.address1}">
			 				<button class="btn btn-dark">검색</button>
			 			</div>
			 			<div>
			 				<input name="raddress2" class="form-control" placeholder="상세주소" value="${user.address2}">
			 			</div>
			 			<input name="sum" type="hidden">
			 			<div class="text-center my-3">
			 				<button class="btn btn-dark px-5">주문하기</button>
			 			</div>
			 		</form>
			 	</div>	
			</div>
		</div>
	</div>
</div>
<script id="temp_order" type="x-handlebars-template">
	<table class="table table-bordered table-hover">
		<tr class="text-center table-info">
			<td>상품번호</td>
			<td>상품이름</td>
			<td>가격</td>
			<td>수량</td>
			<td>금액합계</td>
		</tr>
		{{#each .}}
		<tr class="text-center goods" gid="{{gid}}" price="{{price}}" qnt="{{qnt}}">
			<td>{{gid}}</td>
			<td class="text-start">
				<img src="{{image}}" width="50px">
				<a href="/goods/read?gid={{gid}}">{{{title}}}</a>
			</td>
			<td>{{sum price 1}}원</td>
			<td>{{qnt}}개</td>
			<td>{{sum price qnt}}원</td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
//주문하기 버튼을 클릭한경우
	$(frm).on("submit", function(e){
		e.preventDefault();
		const rname=$(frm.rname).val();
		const rphone=$(frm.rphone).val();
		const raddress1=$(frm.raddress1).val();
		const raddress2=$(frm.raddress2).val();
		const sum=$(frm.sum).val();
		console.log(uid, rname, rphone, raddress1, raddress2, sum)
		const cnt=$("#div_order .goods").length;
		if(!confirm(cnt + "개 상품들을 구매하실래요?")) return;
		//주문정보입력
		$.ajax({
			type:"post",
			url:"/purchase/insert",
			data:{uid, rname, rphone, raddress1, raddress2, sum},
			success:function(pid){
				let order_cnt=0;
				//주문상품등록
				$("#div_order .goods").each(function(){
					//제이쿼리 반복문 .each
					const gid=$(this).attr("gid");
					const price=$(this).attr("price");
					const qnt=$(this).attr("qnt");
					console.log(pid, gid, price, qnt);
					$.ajax({
						type:"post",
						url:"/orders/insert",
						data:{pid, gid, price, qnt},
						success:function(){
							//장바구니에서 삭제
							$.ajax({
								type:"post",
								url:"/cart/delete",
								data:{uid, gid},
								success:function(){
									order_cnt++;
									if(cnt==order_cnt){
										alert(order_cnt + "개 주문상품 등록완료");
										location.href="/";
									}
								}
							})
							if(cnt==order_cnt){
								alert("주문상품등록완료")
							}
						}
					});
				});
			}
		});
	});
	
	function getOrder(data){
		const temp=Handlebars.compile($("#temp_order").html());
		$("#div_order").html(temp(data));
		let total=0;
		$(data).each(function(){
			const price=this.price;
			const qnt=this.qnt;
			const sum=price*qnt;
			total += sum;
		});
		$("#div_ototal").html("총 합계:" + total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
		$(frm.sum).val(total);
	}
	
	
	
	
	
</script>
