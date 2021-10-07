<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#whitetop {
	width: 100%;
	height: 80px;
}

#mainDiv {
	width: 72%;
	margin: 0 auto;
	color: #00282e;
	text-align: center;
}

#mainDiv>h1 {
	margin-bottom: 30px;
	text-align: left;
}

#bottomdiv {
	width:100%;
	height: 50px;
	margin : 10px 0px;
}
#count {
	font-size: 0.7em;
	color: #f5ebe3;
	text-align:left;
	float:left;
}
#count:hover {
	color: #efcac3;
}

#buttonMenu {
	float:right;
}

#list ul, #list li {
	margin: 0;
	padding: 0;
	list-style: none;
}

#list {
	width: 100%;
	height: 450px;
}

#boardList>li {
	float: left;
	width: 9%;
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #f5ebe3;
}

#boardList>li:nth-child(7n+3) {
	width: 50%;
	text-align: left;
}

#boardList>li:nth-child(3) {
	width: 50%;
	text-align: center;
}

#boardList>li:nth-child(7n+1) {
	width: 5%;
}

.wordCut {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.wordCut a:hover {
	color:#fd7d73;
}

#popup0 {
	color: #f5ebe3;
}

#popup0:hover {
	color: #81bbaf;
}

#popup1 {
	color: #81bbaf;
}

.button {
	background-color: #fd7d73;
	border: none;
	color: #f5ebe3;
	padding: 10px 20px;
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

ul.pagination {
	display: inline-block;
	padding: 0;
	margin: 0;
}

ul.pagination li {
	display: inline;
}

ul.pagination li a {
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	border-radius: 5px;
}

ul.pagination li a.active {
	background-color: #fd7d73;
	color: #f5ebe3;
	border-radius: 5px;
}

ul.pagination li a:hover:not(.active) {
	background-color: #f5ebe3;
}
</style>

<script>
//전체선택 이거 왜 안되냐......는 제이쿼리가 없다 두둥
   $(()=>{
      $('#allChk').on('change',function(){
            $('#boardList input[type=checkbox]').prop('checked',$('#allChk').prop('checked'));
      });
      
      $('#searchFrm').submit(function(){
			if($('#searchWord').val()==''){
				alert('검색어를 입력 후 검색하세요');
				return false;
			}
			return true;
		});
   });
</script>

<div id="whitetop"></div>

<div id="mainDiv">
	<h1>공지사항 관리</h1>

	<div id="list">
		<ul id="boardList">
			<li><input type="checkbox" id="allChk"></li>
			<li>No.</li>
			<li class="wordCut">제목</li>
			<li>작성일</li>
			<li>조회수</li>
			<li>첨부파일</li>
			<li>팝업</li>

			<c:forEach var="vo" items="${list}">
				<li><input type="checkbox" name="chk" value="${vo.n_num}" /></li>
				<li>${vo.n_num }</li>
				<li class="wordCut"><a
					href="/wherewego/noticeView?no=${vo.n_num}&nowPage=${pVo.nowPage}">${vo.title}</a></li>
				<li>${vo.writedate }</li>
				<li>${vo.hit }</li>
				<li><c:if test="${vo.photo==null}">
						<img src="imgs/disk0.png" />
					</c:if> <c:if test="${vo.photo!=null}">
						<!-- 첨부파일 다운받는 링크 연결하기 -->
						<a href="#"><img src="imgs/disk.png" /></a>
					</c:if></li>
				<li><c:if test="${vo.pop==1}">
						<a href="#" id="popup1">on</a>
					</c:if> <c:if test="${vo.pop==0}">
						<a href="#" id="popup0">off</a>
					</c:if></li>
			</c:forEach>
		</ul>
	</div>
	
	<div id="bottomdiv">
		<div id="count">
			<div>총 레코드 수 : ${pVo.totalRecord }</div>
			<div>현재페이지/총페이지수 : ${pVo.nowPage}/${pVo.totalPage}</div>
		</div>
		
		<div id="buttonMenu">
			<a class="button" href="#">작성</a> <a class="button" href="#">삭제</a>
		</div>
	</div>

	<!-- 페이징 -->
	<div id="paging">
		<ul class="pagination">
			<!-- 이전페이지 -->
			<c:if test="${pVo.nowPage>1}">
				<li class='page-item'><a
					href="/wherewego/noticeList?nowPage=${pVo.nowPage-1}"
					class='page-link'>«</a></li>
			</c:if>

			<c:if test="${pVo.nowPage==1}">
				<li class='page-item'><a href='#'>«</a></li>
			</c:if>

			<!-- 시작페이지부터 5개의 페이지 출력 -->
			<c:forEach var="i" begin="${pVo.startPage}"
				end="${pVo.startPage+pVo.onePageNumberCount-1}">

				<c:if test="${i<=pVo.totalPage}">

					<c:if test="${i==pVo.nowPage}">
						<li><a class="active"
							href="/wherewego/noticeList?nowPage=${i}">${i}</a>
					</c:if>

					<c:if test="${i!=pVo.nowPage}">
						<li><a href="/wherewego/noticeList?nowPage=${i}">${i}</a>
					</c:if>
				</c:if>
			</c:forEach>

			<!-- 다음페이지-->
			<c:if test="${pVo.nowPage<pVo.totalPage}">
				<li class='page-item'><a
					href="/wherewego/noticeList?nowPage=${pVo.nowPage+1}">»</a></li>
			</c:if>
			
			<c:if test="${pVo.nowPage==pVo.totalPage}">
				<li class='page-item'><a href='#'>»</a></li>
			</c:if>
		</ul>
	</div>
</div>