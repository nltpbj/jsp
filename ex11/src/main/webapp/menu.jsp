<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-body-tertiary"
	data-bs-theme="dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">쇼핑몰</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="/">Home</a></li>
					
				<li class="nav-item" id="cart-item"><a class="nav-link active"
					aria-current="page" href="/cart/list">장바구니</a></li>	
					
				<li class="nav-item" id="search-item"><a class="nav-link active"
					aria-current="page" href="/goods/search">상품검색</a></li>
					
				<li class="nav-item" id="list-item"><a class="nav-link active"
					aria-current="page" href="/goods/list">상품목록</a></li>
			</ul>
			<ul class="navbar-nav  mb-2 mb-lg-0">
				<li class="nav-item" id="login"><a class="nav-link active"
					aria-current="page" href="/user/login">로그인</a></li>
				<li class="nav-item" id="uid"><a class="nav-link active"
					aria-current="page" href="/user/mypage"></a></li>
				<li class="nav-item" id="logout"><a class="nav-link active"
					aria-current="page" href="/user/logout">로그아웃</a></li>
			</ul>
		</div>
	</div>
</nav>
<script>
	const uid=sessionStorage.getItem("uid");
	if(uid){
		$("#login").hide();
		$("#logout").show();
		$("#cart-item").show();
		$("#uid a").html(uid + "님");
	}else{
		$("#login").show();
		$("#logout").hide();
		$("#uid").hide();
		$("#cart-item").hide();
	}
	
	$("#logout").on("click", "a", function(e){
		e.preventDefault();
		if(confirm("정말로 로그아웃하실래요?")){
			sessionStorage.clear();
			location.href="/user/logout";
		}
	});
	
	if(uid=="admin"){
		$("#search-item").show();
		$("#list-item").show();
		$("#cart-item").hide();
	}else{
		$("#search-item").hide();
		$("#list-item").hide();
	}
</script>