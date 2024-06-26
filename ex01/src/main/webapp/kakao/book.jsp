<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h2>도서검색</h2>
	<div class="row mb-3">
		<div class="col-8 col-md-6 col-lg-4">
			<form name="frm">
				<div class="input-group">
					<input class="form-control" placeholder="검색어">
					<button class= "btn btn-info">검색</button>
				</div>
			</form>
		</div>
	</div>
	<div id="div_book" class="row"></div>
</div>
	<script id= "temp_book" type="x-handlebars-template">
		{{#each documents}}
			<div class="col-6 col-md-4 col-lg-2">
				<div class="card">
					<div class="card-body">
						<img src="{{thumbnail}}" width="90%">
					</div>
					<div class="card-footer">
						<p class="ellipsis">{{title}}</p>>
					</div>
				</div>
			</div>
		{{/each}}	
	</script>	

<script>
	getData();
	function getData(){
	   $.ajax({
	      type:"get",
	      url:"https://dapi.kakao.com/v3/search/book?target=title",
	      headers:{"Authorization":"KakaoAK f757bb64a262baafa17a02a6042a9d76"},
	      dataType:"json",
	      data:{"query":"JSP", page:1, size:6},
	      success:function(data){
				console.log(data);
				const temp=Handlebars.compile($("#temp_book").html());
				$("#div_book").html(temp(data));
	      }
	   });
	}
</script>