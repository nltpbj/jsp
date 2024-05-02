<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-body-tertiary"
	data-bs-theme="dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">자리가춥다</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="/">회사소개</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="/user/list">사용자목록</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="/bbs/list">게시판</a></li>
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
	const uid="${user.uid}";
	const uname="${user.uname}";
	if(uid){
		$("#login").hide();
		$("#logout").show();
		$("#uid a").html(uname);
	}else{
		$("#login").show();
		$("#logout").hide();
	}
	
	$("#logout").on("click", "a", function(e){
		e.preventDefault();
		if(confirm("정말로 로그아웃아실래요?")){
			location.href="/user/logout";
		}
	});
</script>