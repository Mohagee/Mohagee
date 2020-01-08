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

	<section id="portfolio" class="padding-top padding-bottom">
		<div class="container">
		<!--  글쓰기 버튼  -->
			<div align="right">
				<a href="${ pageContext.request.contextPath }/showBoard/showBoardInsert.do">
					<button type="button" class="btn btn-success" id="writerBtn">글쓰기</button>
				</a>
			</div>
			
			<!-- 태그 리스트  -->
			<div class="row">
				<ul class="masonery-filter text-center">
					<li><a class="btn btn-default active" href="#" data-filter="*">All</a></li>
					<li><a class="btn btn-default" href="#" data-filter=".big">대극장</a></li>
					<li><a class="btn btn-default" href="#" data-filter=".small">소극장</a></li>
					<li><a class="btn btn-default" href="#" data-filter=".folio">창작뮤지컬</a></li>
					<li><a class="btn btn-default" href="#" data-filter=".logos">오리지널 내한</a></li>
				</ul>
				
			<!--  글 목록  -->		
			<div class="masonery-items masonery_area">
			
				<!--  글 리스트 1 -->
					<div class="col-md-3 col-sm-4 masonery-item branded mobile big">
						<div class="single-blog two-column">
							<div class="post-thumb">
								<a href="${ pageContext.request.contextPath }/showBoardDetail.do">
									<img src="${ pageContext.request.contextPath }/resources/images/show/아마데우스1.jpg"
											class="img-responsive" alt=""> </a>
								<div class="post-overlay">
									<span class="uppercase"><a href="#">일 <br> <small>월</small></a></span>
								</div>
							</div>
							<div class="post-content overflow">
								<ul class="nav nav-justified post-nav">
									<li><a href="#"><i class="fa fa-tag"></i>태그</a></li>
								</ul>
								<h2 class="post-title bold">
									<a href="showBoardDetail.do">연극 아마데우스</a>
								</h2>
								<p>내용</p>
								<!-- <a href="#" class="read-more">더보기</a> -->
								<div class="post-bottom overflow">
									<ul class="nav nav-justified post-nav">
										<li><a href="#"><i class="fa fa-heart"></i>좋아요</a></li>
										<li><a href="#"><i class="fa fa-comments"></i>댓글</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

				<!-- 글 리스트 2 -->
					<div class="col-md-3 col-sm-4 masonery-item branded mobile logos">
						<div class="single-blog two-column">
							<div class="post-thumb">
								<audio src="${ pageContext.request.contextPath }/resources/audio/juicy.mp3" preload="auto"></audio>
							</div>
							<div class="post-content overflow">
								<ul class="nav nav-justified post-nav">
									<li><a href="#"><i class="fa fa-tag"></i>태그</a></li>
									<li><a href="#"><i class="fa fa-clock-o"></i>14 Feb</a></li>
								</ul>
								<h2 class="post-title bold">
									<a href="${ pageContext.request.contextPath }/showBoardDetail.do">뮤지컬 그날들</a>
								</h2>
								<h3 class="post-author">
								</h3>
								<p>내용</p>
							<!-- 	<a href="#" class="read-more">View More</a> -->
								<div class="post-bottom overflow">
									<ul class="nav nav-justified post-nav">
										<li><a href="#"><i class="fa fa-heart"></i>32 Love</a></li>
										<li><a href="#"><i class="fa fa-comments"></i>3 Comments</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					
					<!--  글 리스트 3 -->
					<div class="col-md-3 col-sm-4 masonery-item branded mobile small">
						<div class="single-blog two-column">
							<div class="post-thumb">
								<a href="${ pageContext.request.contextPath }/showBoardDetail.do">
									<img src="${ pageContext.request.contextPath }/resources/images/show/레베카.jpg"
											class="img-responsive" alt=""> </a>
								<div class="post-overlay">
									<span class="uppercase"><a href="#">일 <br> <small>월</small></a></span>
								</div>
							</div>
							<div class="post-content overflow">
								<ul class="nav nav-justified post-nav">
									<li><a href="#"><i class="fa fa-tag"></i>태그</a></li>
								</ul>
								<h2 class="post-title bold">
									<a href="showBoardDetail.do">뮤지컬 레베카</a>
								</h2>
								<p>내용</p>
								<div class="post-bottom overflow">
									<ul class="nav nav-justified post-nav">
										<li><a href="#"><i class="fa fa-heart"></i>좋아요</a></li>
										<li><a href="#"><i class="fa fa-comments"></i>댓글</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					
					<!--  글 리스트 4 -->
					<div class="col-md-3 col-sm-4 masonery-item branded mobile big">
						<div class="single-blog two-column">
							<div class="post-thumb">
								<a href="${ pageContext.request.contextPath }/showBoardDetail.do">
									<img src="${ pageContext.request.contextPath }/resources/images/show/그날들1.jpg"
											class="img-responsive" alt=""> </a>
								<div class="post-overlay">
									<span class="uppercase"><a href="#">일 <br> <small>월</small></a></span>
								</div>
							</div>
							<div class="post-content overflow">
								<ul class="nav nav-justified post-nav">
									<li><a href="#"><i class="fa fa-tag"></i>태그</a></li>
								</ul>
								<h2 class="post-title bold">
									<a href="showBoardDetail.do">뮤지컬 그날들</a>
								</h2>
								<p>내용</p>
								<a href="#" class="read-more">더보기</a>
								<div class="post-bottom overflow">
									<ul class="nav nav-justified post-nav">
										<li><a href="#"><i class="fa fa-heart"></i>좋아요</a></li>
										<li><a href="#"><i class="fa fa-comments"></i>댓글</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<!--  글 리스트 5 -->
					<div class="col-md-3 col-sm-4 masonery-item branded mobile big">
						<div class="single-blog two-column">
							<div class="post-thumb">
								<a href="${ pageContext.request.contextPath }/showBoardDetail.do">
									<img src="${ pageContext.request.contextPath }/resources/images/show/마타하리1.jpg"
											class="img-responsive" alt=""> </a>
								<div class="post-overlay">
									<span class="uppercase"><a href="#">일 <br> <small>월</small></a></span>
								</div>
							</div>
							<div class="post-content overflow">
								<ul class="nav nav-justified post-nav">
									<li><a href="#"><i class="fa fa-tag"></i>태그</a></li>
								</ul>
								<h2 class="post-title bold">
									<a href="showBoardDetail.do">뮤지컬 마타하리</a>
								</h2>
								<p>내용</p>
								<a href="#" class="read-more">더보기</a>
								<div class="post-bottom overflow">
									<ul class="nav nav-justified post-nav">
										<li><a href="#"><i class="fa fa-heart"></i>좋아요</a></li>
										<li><a href="#"><i class="fa fa-comments"></i>댓글</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>					

					<!--  글 리스트 5 -->
					<div class="col-md-3 col-sm-4 masonery-item branded mobile small">
						<div class="single-blog two-column">
							<div class="post-thumb">
								<a href="${ pageContext.request.contextPath }/showBoardDetail.do">
									<img src="${ pageContext.request.contextPath }/resources/images/show/아이다.jsp"
											class="img-responsive" alt=""> </a>
								<div class="post-overlay">
									<span class="uppercase"><a href="#">일 <br> <small>월</small></a></span>
								</div>
							</div>
							<div class="post-content overflow">
								<ul class="nav nav-justified post-nav">
									<li><a href="#"><i class="fa fa-tag"></i>태그</a></li>
								</ul>
								<h2 class="post-title bold">
									<a href="showBoardDetail.do">뮤지컬 그리스</a>
								</h2>
								<p>내용</p>
								<a href="#" class="read-more">더보기</a>
								<div class="post-bottom overflow">
									<ul class="nav nav-justified post-nav">
										<li><a href="#"><i class="fa fa-heart"></i>좋아요</a></li>
										<li><a href="#"><i class="fa fa-comments"></i>댓글</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>					

				</div>
			</div>
		</div>

	</section>
	<c:import url="../common/footer.jsp" />
</body>
</html>