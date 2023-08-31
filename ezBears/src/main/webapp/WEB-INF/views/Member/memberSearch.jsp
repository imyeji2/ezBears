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
    position: absolute;
    margin-top: 2%;
}

form.d-none.d-md-flex.ms-4 {
    flex-direction: column;
}
</style>
<!-- <input class="form-control bg-dark border-0" id="sec"type="text" placeholder="123"> -->
<div class="form-control bg-dark border-0" id="sec">
	<ul class="pop_rel_keywords">
		<li>하나</li>
		<li>둘</li>
		<li>셋</li>
	</ul>
</div>