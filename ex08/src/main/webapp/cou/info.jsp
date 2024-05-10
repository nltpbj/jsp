<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h1>수강신청한 학생목록</h1>
	<div id="div_stu"></div>
</div>


<script id="temp_stu" type="x-handlebars-template">
	<table class="table table-bordered table-hover table-dark ">
		<tr class="table-secondary text-center">
			<td>학생번호</td>
			<td>학생이름</td>
			<td>학생학과</td>
			<td>학생학년</td>
			<td>신청일</td>
			<td>점수</td>
		</tr>
		{{#each .}}
		<tr class="text-center">
			<td>{{scode}}</td>
			<td><a href="/stu/read?scode={{scode}}">{{sname}}<a/></td>
			<td>{{sdept}}</td>
			<td>{{year}}학년</td>
			<td>{{edate}}</td>
			<td><input value="{{grade}}" size=3 class="text-end px-2"></td>
		</tr>
		{{/each}}
	</table>

</script>
<script>
	let lcode="${cou.lcode}";
	getData();

	function getData(){
		$.ajax({
			type:"get",
			url:"/enroll/slist.json",
			dataType:"json",
			data:{lcode},
			success:function(data){
				console.log(data);
				const temp=Handlebars.compile($("#temp_stu").html());
				$("#div_stu").html(temp(data));
			}
		});
	}


</script>