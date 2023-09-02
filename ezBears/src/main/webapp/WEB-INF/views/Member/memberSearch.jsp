<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(function(){
		$('#sec').hide();
		$('#searchbox').click(function(){
			$('#sec').show();
		});
	});
</script>
<style>
div#sec {
    display: flex;
    position: relative;
}

form.d-none.d-md-flex.ms-4 {
    flex-direction: column;
}

ul.pop_rel_keywords {
    position: absolute;
    background: #000;
    width: 100%;
    left: 0;
    border-radius: 5px;
    padding-bottom: 15px;
}
</style>

<div class="form-control bg-dark border-0" id="sec">
	<div class="pop_rel_keywords">
		<a>하나</a>
		<a>둘</a>
		<a>셋</a>
	</div>
</div>