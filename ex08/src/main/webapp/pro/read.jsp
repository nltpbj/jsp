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
		<div><h1>교수정보</h1></div>
			<div class="text-end mb-2">
			<button class="btn btn-primary" id="update">교수수정</button>
			<button class="btn btn-danger" id="delete">교수삭제</button>
		
		</div>
		<table class="table table-bordered table-secondary">
			<tr>
				<td  class="title">교수번호</td>
				<td>${pro.pcode}</td>
				<td  class="title">교수이름</td>
				<td>${pro.pname}</td>
				<td  class="title">교수학과</td>
				<td>${pro.dept}</td>
			</tr>
			<tr>
				<td class="title">임용일자</td>
				<td>${pro.hiredate}</td>
				<td  class="title">교수직급</td>
				<td>${pro.title}</td>
				<td  class="title">교수급여</td>
				<td><fmt:formatNumber pattern="#,###" value="${pro.salary}"/></td>
			</tr>	
		</table>
	</div>
</div>
<jsp:include page="info.jsp"/>

<script>
	//수정버튼을 클릭한경우
	$("#update").on("click", function(){
		const pcode="${pro.pcode}";
		location.href="/pro/update?pcode=" + pcode;
	});
	//삭제버튼을 클릭한경우
	$("#delete").on("click", function(){
		const pcode="${pro.pcode}";
		if(confirm(pcode + "번 교수를 삭제하실래요?")){
			//교수삭제
			$.ajax({
				type:"post",
				url:"/pro/delete",
				data:{pcode},
				success:function(data){
					if(data==1){
						alert("삭제완료!");
						location.href="/pro/list";
					}else{
						alert("삭제실패!");
					}
					
				}
			});
		}
	});
</script>
