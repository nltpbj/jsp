<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.input-group span{
		width: 150px;
	}
</style>
<div class="row my-5 justify-content-center">
	<div class="col-10 col-md-8">
		<div class="card border-info">
			<div class="card-header">
				<h3 class="text-center">강좌수정</h3>
			</div>
			<div class="card-body">
				<form name="frm">
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">강좌번호</span>
						<input name="lcode" class="form-control" value="${cou.lcode}" readonly>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">강좌이름</span>
						<input name="lname" class="form-control" value="${cou.lname}">
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">담당교수</span>
						<input value="${cou.instructor}" name="instructor" class="form-control" placeholder="교수번호" readonly>
						<input value="${cou.pname}" name="pname" class="form-control" placeholder="교수이름" readonly>
						<button class="btn btn-dark" type="button" id="search">검색</button>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">수강인원</span>
						<input name="capacity" class="form-control" value="${cou.capacity}" type="number">
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">강의실</span>
						<input name="room" class="form-control" value="${cou.room}">
					</div>
							<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">강의시수</span>
						<input name="hours" class="form-control" type="number" value="${cou.hours}">
					</div>
					<div class="text-center mt-3">
						<button class="btn btn-primary">강좌수정</button>
						<button class="btn btn-danger">수정취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="modal.jsp"/>
<script>

	//검색버튼을 클릭한 경우
	$("#search").on("click", function(){
		$("#modal").modal("show");	
	});
	
	$(frm.instructor).on("click", function(){
		$("#modal").modal("show");	
	});
	
	$(frm).on("submit", function(e){
		e.preventDefault();
		const lname=$(frm.lname).val();
		const instructor=$(frm.instructor).val();
		if(lname=="" || instructor==""){
			alert("강좌이름과 담당교수를 입력하세요!");
			$(frm.lname).focus();
			return;
		}
		if(confirm("새로운 강좌정보를 수정하실래요?")){
			frm.method="post";
			frm.submit();
		}
	});
</script>

