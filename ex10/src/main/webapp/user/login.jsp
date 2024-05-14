<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <style>
 	#login .title{
 		width:150px;
 	
 	}
 
 </style>   
    
<div class="row my-5 justify-content-center my-5" id="login">
    <div class="col-6 col-md-4">
        <div class="card">
            <div class="card-header text-center">
                <h3 class="py-2">로그인</h3>
            </div>
            <div class="card-body">
                <form name="frm">
                   <div class="input-group mb-2">
	                   	<span class="input-group-text title justify-content-center">아이디</span>
	                   	<input name="uid" class="form-control">
                   </div>
                    <div class="input-group mb-3">
	                   	<span class="input-group-text title justify-content-center">비밀번호</span>
	                   	<input name="upass" class="form-control" type="password">
                   </div>
                   <div>
                   		<button class="btn btn-dark w-100">로그인</button>
                   </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
	$(frm).on("submit", function(e){
		e.preventDefault();
		const uid=$(frm.uid).val();
		const upass=$(frm.upass).val();
		if(uid==""){
			alert("아이디를 입력하세요");
			return;
		}
		if(upass==""){
			alert("비밀번호를 입력하세요");
			return;
		}
		//로그인체크
		$.ajax({
			type:"post",
			url:"/user/login",
			data:{uid, upass},
			success:function(data){
				const result=parseInt(data);
				if(result==0){
					alert("아이디가 존재하지 않습니다");
				}else if(result==2){
					alert("비밀번호가 일치하지 않습니다");
				}else if(result==1){
					sessionStorage.setItem("uid", uid);
					const target=sessionStorage.getItem("target");
					if(target){
						location.href=target;
					}else{
						location.href="/";
					}
		
				}
			}
		});
		
	});

</script>