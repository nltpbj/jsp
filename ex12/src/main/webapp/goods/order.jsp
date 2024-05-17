<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h1>주문하기</h1>
	<div id="div_order"></div>
	<div id="div_ototal" class="alert alert-secondary text-end">총 합계:</div>
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
		<tr class="text-center" gid="{{gid}}">
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
	}
	
	
	
	
	
</script>

<div class="purchase text-center">
        <button type="button" class="btn btn-success" >구매하기</button>
</div>