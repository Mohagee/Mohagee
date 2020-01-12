<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:import url="../common/commonUtil.jsp" />

<script>
	function showBoardInsert(){
		location.href = "JQ{ pageContext.request.contextPath}/showBoard/showBoardInsert.do";
	}
	
	JQ(function(){
		
		JQ("").on("click", function(){
			
			var bNo = JQ(this).attr("id");
			console.log("bNo = " + bNo);
			location.href = "JQ{pageContext.request.contextPath}/showBoard/showBoardDetail.do?no=" + bNo;
		});
		
	});
	
	
</script>

</head>
<body>
	<c:import url="../common/header.jsp" />

	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title">공연, 뭐 볼까?</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#action-->


<!-- 글 목록 폼 시작 -->
<section id="portfolio" class="padding-top padding-bottom">
	<div class="container">
	
	<!--  글쓰기 버튼  -->
	<div align="right">
		<c:if test="${ !empty member}">
			<a href="${ pageContext.request.contextPath }/showBoard/showBoardInsert.do">
				<button type="button" class="btn btn-success" id="writerBtn">글쓰기</button>
			</a>
		</c:if>
	</div>
		
		<!-- 태그 리스트  -->
		<div class="row">
				<ul class="masonery-filter text-center">
					<li><a class="btn btn-default active" href="#" data-filter="*">All</a></li>
					<li><a class="btn btn-default" href="#" data-filter=".big">대극장</a></li>
					<li><a class="btn btn-default" href="#" data-filter=".small">소극장</a></li>
					<li><a class="btn btn-default" href="#" data-filter=".creative">창작뮤지컬</a></li>
					<li><a class="btn btn-default" href="#" data-filter=".original">오리지널 내한</a></li>
				</ul>

			<!--  글 목록  -->		
			<div class="masonery-items masonery_area">
			
			
				<c:forEach var="showBoard" items="${list}">
				
			
				<!--  글 리스트 1 -->
					<div class="col-md-3 col-sm-4 masonery-item branded mobile big">
						<div class="single-blog two-column">
						
						<!-- 사진파일 -->
						<c:if test="${ fn:trim(showBoard.bFileType)  == 'I'}">
							<div class="post-thumb">
								<a href="${ pageContext.request.contextPath }/showBoard/showBoardDetail.do?bNo=${showBoard.bNo}">
									<img src="${ pageContext.request.contextPath }/resources/showUpload/${showBoard.titleFilename}"
											class="img-responsive" alt=""></a>						
							</div>
							</c:if>
							
							<!-- 태그  -->
							<div class="post-content overflow">
								<ul class="nav nav-justified post-nav">
									<li><a href="#"><i class="fa fa-tag"></i></a></li>
								</ul>
								
								<!--  제목 -->
								<h2 class="post-title bold">
									<a href="${ pageContext.request.contextPath }/showBoardDetail.do?bNo=${showBoard.bNo}">${ showBoard.bTitle }</a>
								</h2>

								<div class="post-bottom overflow">
									<ul class="nav nav-justified post-nav">
										<li><a href="#"><i class="fa fa-heart"></i>좋아요</a></li>
										
										<li><a href="#"><i class="fa fa-comments"></i>댓글</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					
					
					
				</c:forEach>
				
				
				
				</div>				
				
			</div>
		</div>

	</section>
	<c:import url="../common/footer.jsp" />
</body>
</html>