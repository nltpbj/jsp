<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="page-cart">
	<h1>장바구니</h1>
	<div id="div_cart"></div>
	<div id="div_total" class="alert alert-secondary text-end">합계:</div>
	<div class="text-center">
		<button class="btn btn-primary px-5" id="btn-order">주문하기</button>
		<a href="/" class="btn btn-secondary px-5">쇼핑계속하기</a>
	</div>
</div>
<div id="page-order" style="display:none;">
	<jsp:include page="order.jsp"></jsp:include>

</div>
<script id="temp_cart" type="x-handlebars-template">
	<div class="mb-2">
		<button class="btn btn-danger" id="delete">선택상품삭제</button>
	</div>
	<table class="table table-bordered table-hover">
		<tr class="text-center table-info">
			<td><input type="checkbox" id="all"></td>
			<td>상품번호</td>
			<td>상품이름</td>
			<td>가격</td>
			<td>수량</td>
			<td>금액합계</td>
			<td>삭제</td>
		</tr>
		{{#each .}}
		<tr class="text-center" gid="{{gid}}">
			<td><input type="checkbox" class="chk" goods="{{toString @this}}"></td>
			<td>{{gid}}</td>
			<td class="text-start">
				<img src="{{image}}" width="50px">
				<a href="/goods/read?gid={{gid}}">{{{title}}}</a>
			</td>
			<td>{{sum price 1}}원</td>
			<td>
				<input class="qnt" value="{{qnt}}" size=2>
				<button class="btn btn-info btn-sm update">수정</button>
			</td>
			<td>{{sum price qnt}}원</td>
			<td><button class="btn btn-danger btn-sm delete"><i class="bi bi-trash"></i></button></td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	Handlebars.registerHelper("sum", function(price, qnt){
		const sum=price * qnt;
		return sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	});
	
	Handlebars.registerHelper("toString", function(goods){
		return JSON.stringify(goods);
	});
</script>
<script>
	getData();
	//주문하기 버튼을 클릭한경우
	$("#btn-order").on("click", function(){
		const chk=$("#div_cart .chk:checked").length;
		if(chk==0) {
			alert("주문할 상품을 선택하세요!");
			return;
		}
		let data=[];
		$("#div_cart .chk:checked").each(function(){
			const goods=$(this).attr("goods");
			data.push(JSON.parse(goods));
		});
		console.log(data);
		getOrder(data);
		$("#page-cart").hide();
		$("#page-order").show();
	});
	//선택삭제 버튼을 클릭한경우
	$("#div_cart").on("click", "#delete", function(){
		const chk=$("#div_cart .chk:checked").length;
		if(chk==0){
			alert("삭제할 상품을 선택하세요");
			return;
		}
		if(!confirm(chk + "개 상품을 삭제하실래요?")) return;
		//삭제하기
		let cnt=0;
		$("#div_cart .chk:checked").each(function(){
			const gid=$(this).parent().parent().attr("gid");
			$.ajax({
				type:"post",
				url:"/cart/delete",
				data:{uid, gid},
				success:function(){
					cnt++;
					if(chk == cnt){
						alert(cnt + "개 삭제완료!");
						getData();
					}
					
				}
			});
		});
		
	});
	//전체선택 체크박스를 클릭한경우
	$("#div_cart").on("click", "#all", function(){
		if($(this).is(":checked")){
			$("#div_cart .chk").each(function(){
				$(this).prop("checked", true);
			});
		}else{
			$("#div_cart .chk").each(function(){
				$(this).prop("checked", false);
			});	
		}
	});
	//각행의 체크박스를 클릭한경우
	$("#div_cart").on("click", ".chk", function(){
		const all=$("#div_cart .chk").length;
		const chk=$("#div_cart .chk:checked").length;
		if(all==chk){
			$("#div_cart #all").prop("checked", true);
		}else{
			$("#div_cart #all").prop("checked", false);
		}
	});
	//각행의 삭제버튼을 클릭한경우
	$("#div_cart").on("click", ".delete", function(){
		const gid=$(this).parent().parent().attr("gid");
		if(!confirm(gid + "번 상품을 삭제하실래요?")) return;
		//삭제하기
		$.ajax({
			type:"post",
			url:"/cart/delete",
			data:{uid, gid},
			success:function(){
				getData();
			}
		});
	});
	//각행의 수정버튼을 클릭한경우
	$("#div_cart").on("click", ".update", function(){
			const qnt=$(this).parent().find(".qnt").val();
			const gid=$(this).parent().parent().attr("gid");
			//alert(uid + ":" + qnt ":" + gid);
			$.ajax({
				type:"post",
				url:"/cart/update",
				data:{gid, uid, qnt},
				success:function(){
					getData();
				}
			});
	});
	function getData(){
		$.ajax({
			type:"get",
			url:"/cart/list.json",
			dataType:"json",
			data:{uid},
			success:function(data){
				const temp=Handlebars.compile($("#temp_cart").html());
				$("#div_cart").html(temp(data));
				let total=0;
				$(data).each(function(){
					const price=this.price;
					const qnt=this.qnt;
					const sum=price*qnt;
					total += sum;
				});
				$("#div_total").html("총 합계: " + total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
			}
		});
	}
</script>