<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>우리들의 미니멀 챌린지::작심삼일</title>

<link rel="stylesheet" href="../../../css/bootstrap.min.css"> 
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard-dynamic-subset.css" />
<!-- 사용자 정의 CSS 파일을 Bootstrap CSS 파일 이후에 포함시킵니다. -->
	<link rel="stylesheet" href="/css/sidebarNav.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
body {
	font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
}


  /* carousel 관련 스타일 설정 */
    .carousel-inner img {
      max-width: 1300px;
      max-height: 400px;
      width: auto;
      height: auto;
      margin: 0 auto;
    }

    /* 이전/다음 버튼 스타일 설정 */
    .carousel-control-prev,
    .carousel-control-next {
   	 position: absolute;
   	  top: 70%;
      width: 5%;
      opacity: 0.5;
      background-color: rgba(255, 255, 255, 0.5);
      z-index: 10;
    }
    
    /* 버튼에 마우스를 올렸을 때의 스타일 설정 */
    .carousel-control-prev:hover,
    .carousel-control-next:hover {
      opacity: 1;
    }
	
	
	@media (max-width: 1300px) {
    .carousel-inner img {
        min-width: 1100px; /* 최소 너비를 800px로 설정 */
        max-width: 300px;
       	 width: auto;
    	 height: auto;
    }

   
     /* 미디어 쿼리를 사용하여 화면 크기에 따라 버튼 위치 조정 */
    @media (max-width: 1300px) {
      .carousel-control-prev,
      .carousel-control-next {
        width: 8%; /* 버튼 너비 조정 */
        right: auto;
        left: auto;
      }
    }

</style>
<script>
    //슬라이드 속도 설정 
    $(document).ready(function () {
      $('#slideBnr').carousel({ 
        interval: 5000 
      });

      //슬라이드 인디케이터 (하단버튼) 설정
      $("#btn1").click(function(){
        $("#slideBnr").carousel(0);
      });
      $("btn2").click(function(){
        $("#slideBnr").carousel(1);
      });
      $("#btn3").click(function(){
        $("#slideBnr").carousel(2);
      });

      //슬라이드 이전,다음 설정 
      $(".carousel-control-prev").click(function(){
        $("#slideBnr").carousel("prev");
      });

      $(".carousel-control-next").click(function(){
        $("#slideBnr").carousel("next");
      });
    });
  </script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
 <!-- SidebarNav.jsp 파일을 포함시키기. -->
  <%@ include file="/view/sidebarNav.jsp" %>
  <div id="bodyContent">
 <!-- Navigation -->
<%-- ListEventController로부터 
		request.setAttribute("eventPage", eventPage);
		request.setAttribute("nowPage", pageNo); 
		--%>
<!--  슬라이드 배너 -->
    <div class="slideBnr-container mb-4">
      <div class="row justify-content-center">
        <div id="slideBnr" class="carousel slide" data-ride="carousel">
          <!-- 이미지하단 버튼 -->
          <ol class="carousel-indicators">
            <li  data-target="#slideBnr" id="btn1" data-slide-to="0" class="active"
              aria-current="true" aria-label="Slide 1"></li>
            <li data-target="#slideBnr" id="btn2" data-slide-to="1" aria-label="Slide 2"></li>
            <li  data-target="#slideBnr" id="btn3" data-slide-to="2" aria-label="Slide 3"></li>
          </ol>
          <!--  배너 이미지  -->
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="/img/mainBnr/bnrT1.jpg" class="d-block w-100" alt="배너1">
            </div>
            <div class="carousel-item">
              <img src="/img/mainBnr/bnrT2.jpg" class="d-block w-100" alt="배너2">
            </div>
            <div class="carousel-item">
              <img src="/img/mainBnr/bnrT3.jpg" class="d-block w-100" alt="배너3">
            </div>
          </div><!-- /.carousel-inner -->
          <!-- 슬라이드 좌우 이동 -->
          <a class="carousel-control-prev" href="#slideBnr" role="button" data-slide="prev">
	        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	        <span class="sr-only">Previous</span>
	      </a>
	      <a class="carousel-control-next" href="#slideBnr" role="button" data-slide="next">
	        <span class="carousel-control-next-icon" aria-hidden="true"></span>
	        <span class="sr-only">Next</span>
	      </a>
        </div><!-- /.carousel -->
      </div>
    </div><!-- /.slideBnr-container -->
		
<div class="container">
<h2 class="mt-5 mb-4 text-center">이벤트</h2>
<table class="table table-hover">
	<thead class="thead-light">
		<tr>
			<th scope="col">제목</th>
			<th scope="col">등록일</th>
		</tr>
	</thead>
	<tbody>
		<%-- 목록 조회할 게시글이 없는 경우 --%>
		<c:if test="${eventPage.hasNoEvents()}"><%--get메소드 아니니까 생략 없이 그대로 써도 됨. --%>
			<tr>
				<td colspan="4">아직 글이 없습니다.</td>
			</tr>
		</c:if>
			
		<%-- 게시글이 있는 경우 --%>
		<%--<c:forEach var="변수명" items="배열명 또는 컬렉션"> --%>
		<c:forEach var="event" items="${eventPage.content}">
			<tr> 
				<td><a href="${cPath}/event/read.do?no=${event.event_no}&pageNo=${nowPage}" style="text-decoration: none;">${event.event_title}</a></td>
				<td>${event.event_regdate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div>
<%-- 관리자에게만 보여지는 부분 --%>	
<c:if test="${AUTH_USER.id=='admin'}"> 
	<a href="/event/write.do" class="btn btn-primary" style="float: right">글쓰기</a>
</c:if>
</div>

	<%--검색기능 구현 --%>
	<div>
		<form action="${cPath}/event/search.do?" method="get">
		<div style="justify-content: center;">
			<select name="searchField" class="form-select" style="width:100px; display:inline;">
					<option value="event_title">제목</option>
					<option value="event_con">내용</option>
			</select>
				<input type="search" name="searchText" id="searchText" placeholder="검색어를 입력하세요" maxlength="100" class="form-control" style="width:200px; display:inline;"/>
				<input type="submit" class="btn btn-outline-primary" style="margin: 0px 0px 2px 5px " value="검색"/>
		</div>	
		<%-- pagenation 출력부분 --%>
			<nav aria-label="Page navigation" >
				<ul class="pagination" style="justify-content: center;">
					<c:if test="${eventPage.startPage>5}">
						<li class="page-item"><a class="page-link" href="${cPath}/event/<c:choose><c:when test="${param.searchText!=null}">search.do</c:when><c:otherwise>list.do</c:otherwise></c:choose>?pageNo=${eventPage.startPage-5}&searchField=${searchField}&searchText=${searchText}">Previous</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${eventPage.startPage}" end="${eventPage.endPage}" step="1">
						<li class="page-item"><a class="page-link" href="${cPath}/event/<c:choose><c:when test="${param.searchText!=null}">search.do</c:when><c:otherwise>list.do</c:otherwise></c:choose>?pageNo=${pNo}&searchField=${searchField}&searchText=${searchText}">${pNo}</a></li>
					</c:forEach>
					<c:if test="${eventPage.endPage<eventPage.totalPages}">
						<li class="page-item"><a class="page-link" href="${cPath}/event/<c:choose><c:when test="${param.searchText!=null}">search.do</c:when><c:otherwise>list.do</c:otherwise></c:choose>?pageNo=${eventPage.startPage+5}&searchField=${searchField}&searchText=${searchText}">Next</a></li>
					</c:if>
				</ul>
			</nav>
		</form>
	</div>

</div> <!-- container -->
<%-- pagenation 출력부분  (원본)
	<nav aria-label="Page navigation" >
		<ul class="pagination" style="margin:10 10 10 10 ">
			<c:if test="${eventPage.startPage>5}">
				<li class="page-item"><a class="page-link" href="list.do?pageNo=${eventPage.startPage-5}">Previous</a></li>
			</c:if>
			<c:forEach var="pNo" begin="${eventPage.startPage}" end="${eventPage.endPage}" step="1">
				<li class="page-item"><a class="page-link" href="list.do?pageNo=${pNo}">${pNo}</a></li>
			</c:forEach>
			<c:if test="${eventPage.endPage<eventPage.totalPages}">
				<li class="page-item"><a class="page-link" href="list.do?pageNo=${eventPage.startPage+5}">Next</a></li>
			</c:if>
		</ul>
	</nav> --%>
	
	
	
	<%-- <c:if>이용하여 노출여부가 달라진다 
	<c:if test="${eventPage.startPage>5}">
		<a href="list.do?pageNo=${eventPage.startPage-5}">&lt;&lt;prev</a>
	</c:if>
	 <c:forEach></c:forEach>반복문 이용 1 2 3 4 5  
	<!-- for(int i=1; i<=10; i++){sout(i)} -->
	<c:forEach var="pNo" begin="${eventPage.startPage}" end="${eventPage.endPage}" step="1">
		<a href="list.do?pageNo=${pNo}">${pNo}</a>
	</c:forEach>
	<c:if test="${eventPage.endPage<eventPage.totalPages}">
		<a href="list.do?pageNo=${eventPage.startPage+5}">next&gt;&gt;</a>
	</c:if> --%>
	
<!-- C3D에 맞는 js -->
<%@ include file="../bootstrap4js.jsp" %>
   </div>  <!--  bodyContnent -->  
</body>
</html>