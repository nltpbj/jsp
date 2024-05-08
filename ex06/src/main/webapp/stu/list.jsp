<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <style>
	#size { 
		width:100px;
		float: right;
	}
</style>  
    
<div>
	<h1>학생관리</h1>
	<div class="row mt-5 mb-3">
		<form class="col-10 col-md-6" name="frm">
			<div class="input-group">
				<select class="form-select me-3" name="key">
					<option value="scode">학생번호</option>
					<option value="sname" selected>학생이름</option>
					<option value="sdept">학생학과</option>
					<option value="pname">교수이름</option>
					
				</select>
				<input placeholder="검색어" class="form-control" name="word">
				<button class="btn btn-primary">검색</button>
			</div>
		</form>
		<div class="col-2 ">
			<select class="form-select" id="size">
				<option value="2">2행</option>
				<option value="3">3행</option> 
				<option value="4">4행</option> 
				<option value="5" selected>5행</option> 
			</select>
			
		</div>
	</div>
	<div id="div_stu"></div>
	<div id="pagination" class="pagination justify-content-center mt-5"></div>
</div>
<script id="temp_stu" type="x-handlebars-template">
	<table class="table table-bordered table-hover table-dark">
		<tr class="table-secondary">
			<td>학생번호</td>
			<td>학생이름</td>
			<td>학생학과</td>
			<td>학생학년</td>
			<td>생년월일</td>
			<td>지도교수</td>
		</tr>
		{{#each .}}
		<tr>
			<td>{{scode}}</td>
			<td><a href="/stu/read?scode={{scode}}">{{sname}}<a/></td>
			<td>{{sdept}}</td>
			<td>{{year}}학년</td>
			<td>{{birthday}}</td>
			<td>{{advisor}}</td>
		</tr>
		{{/each}}
	</table>

</script>

<script>
	let page=1;
	let size=$("#size").val();
	let key=$(frm.key).val();
	let word=$(frm.word).val();
		
	$(frm).on("submit", function(e){
		e.preventDefault();
		key=$(frm.key).val();
		word=$(frm.word).val();
		size=$("#size").val();
		page=1;
		//getData();
		getTotal();
	});
	
	$("#size").on("change", function(){
		size=$("#size").val();
		page=1;
		//getData();
		getTotal();
	});
	getTotal();
	//getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/stu/list.json",
			dataType:"json",
			data:{page, size, key, word},
			success:function(data){
				console.log(data);
				const temp=Handlebars.compile($("#temp_stu").html());
				$("#div_stu").html(temp(data));
			}
		});
	}
	function getTotal(){
		$.ajax({
			type:"get",
			url:"/stu/total",
			data:{key, word},
			success:function(data){
				if(data==0){
					alert("검색내용이 없습니다.");
					return;
				}
				const totalPage=Math.ceil(data/size);
				$("#pagination").twbsPagination("changeTotalPages", totalPage, page);
				if(data > size){
					$("#pagination").show;
				}else{
					$("#pagination").hide;
				}
			}
		});
	}
	$('#pagination').twbsPagination({
	      totalPages:10, 
	      visiblePages: 5, 
	      startPage : 1,
	      initiateStartPageClick: false, 
	      first:'<i>처음</i>', 
	      prev :'<i>이전</i>',
	      next :'<i>다음</i>',
	      last :'<i>마지막</i>',
	      onPageClick: function (event, clickPage) {
	          page=clickPage; 
	          getData();
	      }
	   });
</script>