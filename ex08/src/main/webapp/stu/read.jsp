<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <style>
   table .title{
		background:lightgray;
		color:black;
		text-align:center;
   }
</style>
<div class="row">
	<div class="col">
		<div><h1>학생정보</h1></div>
		<div class="text-end mb-2">
			<button class="btn btn-primary" id="update">학생수정</button>
			<button class="btn btn-danger" id="delete">학생삭제</button>
		
		</div>
		<table class="table table-bordered table-secondary">
			<tr>
				<td  class="title">학생번호</td>
				<td>${stu.scode}</td>
				<td  class="title">학생이름</td>
				<td>${stu.sname}</td>
				<td  class="title">학생학과</td>
				<td>${stu.sdept}</td>
			</tr>
			<tr>
				<td class="title">생년월일</td>
				<td>${stu.birthday}</td>
				<td  class="title">학생학년</td>
				<td>${stu.year}학년</td>
				<td  class="title">지도교수</td>
				<td>${stu.pname}(${stu.advisor})</td>
			</tr>	
		</table>
	</div>
</div>
<jsp:include page="info.jsp"/>
<script>
	//수정버튼을 클릭한경우
	$("#update").on("click", function(){
		const scode="${stu.scode}";
		location.href="/stu/update?scode=" + scode;
	});
	//삭제버튼을 클릭한경우
	$("#delete").on("click", function(){
		const scode="${stu.scode}";
		if(confirm(scode + "번 학생 삭제하실래요?")){
			//학생삭제
			$.ajax({
				type:"post",
				url:"/stu/delete",
				data:{scode},
				success:function(data){
					if(data=="true"){
						alert("삭제완료!");
						location.href="/stu/list";
					}else{
						alert("학생이 신청한 수강데이터가 존재해서 삭제가 불가능합니다.");
					}
					
				}
			});
		}
	});
</script>
