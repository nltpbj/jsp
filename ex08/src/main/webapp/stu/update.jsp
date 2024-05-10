<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.input-group span{
		width: 150px;
	}
</style>
<div class="row my-5 justify-content-center">
	<div class="col-10 col-md-8">
		<div class="card border-info">
			<div class="card-header">
				<h3 class="text-center">학생수정</h3>
			</div>
			<div class="card-body">
				<form name="frm">
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">학생번호</span>
						<input name="scode" class="form-control" value="${stu.scode}" readonly>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">학생이름</span>
						<input name="sname" class="form-control" value="${stu.sname}">
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">학생학과</span>
						<select class="form-select" name="dept">
							<option <c:out value="${stu.sdept=='전산'?'selected':''}"/> value="전산">컴퓨터정보공학과</option>
							<option <c:out value="${stu.sdept=='전자'?'selected':''}"/> value="전자">전자공학과</option>
							<option <c:out value="${stu.sdept=='건축'?'selected':''}"/> value="건축">건축공학과</option>
						</select>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">학생학력</span>
						<div class="form-check m-2">
							<input <c:out value="${stu.year==1?'checked':''}"/> value="1" name="year" class="form-check-input" type="radio" checked>
							<label class="form-check-label">1학년</label>
						</div>
						<div class="form-check m-2">
							<input <c:out value="${stu.year==2?'checked':''}"/> value="2" name="year" class="form-check-input" type="radio">
							<label class="form-check-label">2학년</label>
						</div>
						<div class="form-check m-2">
							<input <c:out value="${stu.year==3?'checked':''}"/> value="3" name="year" class="form-check-input" type="radio">
							<label class="form-check-label">3학년</label>
						</div>	
							<div class="form-check m-2">
							<input <c:out value="${stu.year==4?'checked':''}"/> value="4" name="year" class="form-check-input" type="radio">
							<label class="form-check-label">4학년</label>
						</div>			
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">지도교수</span>
						<input value="${stu.advisor}" name="advisor" class="form-control" placeholder="교수번호" readonly>
						<input value="${stu.pname}" name="pname" class="form-control" placeholder="교수이름" readonly>
						<button class="btn btn-dark" type="button" id="search">검색</button>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">생년월일</span>
						<input value="${stu.birthday}" name="birthday" class="form-control" type="date" value="2005-01-01">
					</div>
					<div class="text-center mt-3">
						<button class="btn btn-primary">학생수정</button>
						<button class="btn btn-danger">수정취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="modal.jsp"/>
<script>

	//검색버튼을 클릭한경우
	$("#search").on("click", function(){
		$("#modal").modal("show");
	});
	//학생수정을 클릭
	$(frm).on("submit", function(e){
		e.preventDefault();
		const sname=$(frm.sname).val();
		const advisor=$(frm.advisor).val();
		if(sname=="" || advisor==""){
			alert("학생이름과 지도교수를 입력하세요!");
			$(frm.sname).focus();
			return;
		}
		if(confirm("학생정보를 수정하실래요?")){
			frm.method="post";
			frm.submit();
		}
	});
</script>

