<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
.write-area {
	width: 72%;
	margin: 0 auto;
}

.writeTitle {
	padding: 29px 29px 29px;;
	border: 1px solid gray;
	border-radius: 6px;
}

.writeTitle.write_header {
	
}

.write_title {
	position: relative;
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid gray;
}

.write_main {
	margin-top: 10px;
	overflow-x: auto;
	padding: 15px 15px 15px;
}

#buttonMenu {
	float: right;
}

.button {
	background-color: #fd7d73;
	border: none;
	color: #f5ebe3;
	padding: 10px 10px;
	margin: 10px 0px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border-radius: 12px;
	transition-duration: 0.4s;
	font-size: 13px;
	width: 70px;
	text-align: center;
}

.button:hover {
	color: #0e595f;
}
</style>
<script>
	function viewDel(){
		if(confirm("글을 삭제하시겠습니까?")){
			location.href="/wherewego/adDel?adnum=${vo.adnum}";
		}
	}
</script>
<div class="write-area">
	<div class="writeTitle">
		<div class="write_header">
			<div class="write_title">
				${vo.adnum }
				<h1>${vo.name }</h1>
				<div class="write_info">${vo.startdate }~${vo.enddate }</div>
			</div>
		</div>
		<div class="write_story">
			<div class="write_main">
				<img src="upload/adimg/${vo.photo}" width=70%; /><br />
				<h2>주소 : ${vo.addr }</h2>
				<h2>사업자번호 : ${vo.num }</h2>
				<h2>연락처 : ${vo.tel }</h2>
				<h2>승인여부 : ${vo.grade }</h2>
				<h2>가격 : ${vo.price }</h2>
				<h2>결제여부 : ${vo.payment }</h2>
			</div>
		</div>
	</div>
	<div id="buttonMenu">
		<c:if test="${logid=='admin' && vo.grade=='검토중'}">
			<a class="button" href="#?adnum=${vo.adnum }&grade=${vo.grade }">승인</a>
			<a class="button" href="#?adnum=${vo.adnum }&grade=${vo.grade }">미승인</a>
		</c:if>
		
		<c:if test="${logid!='admin' && vo.grade=='검토중'}">
			<a class="button" href="adEdit?adnum=${vo.adnum }">수정</a>
			<a class="button" href="javascript:viewDel()">삭제</a>
		</c:if>
		
		<a class="button" href="advermanage?nowPage=${pVo.nowPage}">목록</a>
	</div>
	<!-- 
  			 	<li>사진 : ${vo.photo }</li>
  			 -->
</div>