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
    <title>Blog Details | Triangle</title>
    
    <c:import url="common/commonUtil.jsp"/>
</head><!--/head-->

<body>
	
	<c:import url="common/header.jsp"/>

    <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">블로그 상세페이지</h1>
                            <p>블로그 소제목</p>
                        </div>                                                                                
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#page-breadcrumb-->

    <section id="blog-details" class="padding-top">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-7">
                    <div class="row">
                         <div class="col-md-12 col-sm-12">
                            <div class="single-blog blog-details two-column">
                                <div class="post-thumb">
                                    <a href="#"><img src="${ pageContext.request.contextPath }/resources/images/test1.jpg" class="img-responsive" alt=""></a>
                                    <div class="post-overlay">
                                        <span class="uppercase"><a href="#">여기 <br><small>날짜</small></a></span>
                                    </div>
                                </div>
                                <div class="post-content overflow">
                                    <h2 class="post-title bold"><a href="#">여기에 블로그 제목</a></h2>
                                    <h3 class="post-author"><a href="#">소제목 or 카테고리 or 태그</a></h3>
                                    <p>여기에 블로그 내용을 적으면 될거같습니다~~~</p>
                                    <div class="post-bottom overflow">
                                        <ul class="nav navbar-nav post-nav">
                                            <li><a href="#"><i class="far fa-clock"></i>등록날짜</a></li>
                                            <li><a href="#"><i class="fa fa-tag"></i>여기 태그</a></li>
                                            <li><a href="#"><i class="fa fa-heart"></i>좋아요 숫자</a></li>
                                            <li><a href="#"><i class="fa fa-comments"></i>댓글 숫자</a></li>
                                        </ul>
                                    </div>
                                    <div class="blog-share">
                                        <span class='st_facebook_hcount'></span>
                                        <span class='st_twitter_hcount'></span>
                                        <span class='st_linkedin_hcount'></span>
                                        <span class='st_pinterest_hcount'></span>
                                        <span class='st_email_hcount'></span>
                                        <span>이거 살리면 기능 자동으로 되요</span>
                                    </div>
                                    <div class="author-profile padding">
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <img src="${ pageContext.request.contextPath }/resources/images/blogdetails/1.png" alt="">
                                            </div>
                                            <div class="col-sm-10">
                                                <h3>작성자 이름</h3>
                                                <p>작성자 정보등등...?</p>
                                                <span>Website:<a href="www.jooomshaper.com"> 작성자 웹사이트 페북등등 살릴지말지는...</a></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="response-area">
                                    <h2 class="bold">Comments</h2>
                                    <ul class="media-list">
                                        <li class="media">
                                            <div class="post-comment">
                                                <a class="pull-left" href="#">
                                                    <img class="media-object" src="${ pageContext.request.contextPath }/resources/images/blogdetails/2.png" alt="">
                                                </a>
                                                <div class="media-body">
                                                    <span><i class="fa fa-user"></i>댓글 작성자 <a href="#">댓글 작성자 이름 이하 동문</a></span>
                                                    <p>댓글 내용</p>
                                                    <ul class="nav navbar-nav post-nav">
                                                        <li><a href="#"><i class="far fa-comment-alt"></i>댓글 작성일</a></li>
                                                        <li><a href="#"><i class="fa fa-reply"></i>대댓글 달기</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="parrent">
                                                <ul class="media-list">
                                                    <li class="post-comment reply">
                                                        <a class="pull-left" href="#">
                                                            <img class="media-object" src="${ pageContext.request.contextPath }/resources/images/blogdetails/3.png" alt="">
                                                        </a>
                                                        <div class="media-body">
                                                            <span><i class="fa fa-user"></i>Posted by <a href="#">Endure</a></span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut </p>
                                                            <ul class="nav navbar-nav post-nav">
                                                                <li><a href="#"><i class="fa fa-clock-o"></i>February 11,2014</a></li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="media">
                                            <div class="post-comment">
                                                <a class="pull-left" href="#">
                                                    <img class="media-object" src="${ pageContext.request.contextPath }/resources/images/blogdetails/4.png" alt="">
                                                </a>
                                                <div class="media-body">
                                                    <span><i class="fa fa-user"></i>Posted by <a href="#">Endure</a></span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliq Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.</p>
                                                    <ul class="nav navbar-nav post-nav">
                                                        <li><a href="#"><i class="fa fa-clock-o"></i>February 11,2014</a></li>
                                                        <li><a href="#"><i class="fa fa-reply"></i>Reply</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        
                                    </ul>                   
                                    </div><!--/Response-area-->
                                </div>
                            </div>
                        </div>
                    </div>
                 </div>
                <div class="col-md-3 col-sm-5">
                    <div class="sidebar blog-sidebar">
                        <div class="sidebar-item  recent">
                            <h3>Editor 소개</h3>
                            <div class="media">
                                <div class="pull-left">
                                    <a href="#"><img src="${ pageContext.request.contextPath }/resources/images/portfolio/project1.jpg" alt=""></a>
                                </div>
                                <div class="media-body">
                                    <h4><a href="#">여기에 뭐를 쓸까요 이전글 다음글? 이하동문</a></h4>
                                    <p>작성일  07 March 2014</p>
                                </div>
                            </div>
                            <div class="media">
                                <div class="pull-left">
                                    <a href="#"><img src="${ pageContext.request.contextPath }/resources/images/portfolio/project2.jpg" alt=""></a>
                                </div>
                                <div class="media-body">
                                    <h4><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit,</a></h4>
                                    <p>posted on  07 March 2014</p>
                                </div>
                            </div>
                            <div class="media">
                                <div class="pull-left">
                                    <a href="#"><img src="${ pageContext.request.contextPath }/resources/images/portfolio/project3.jpg" alt=""></a>
                                </div>
                                <div class="media-body">
                                    <h4><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit,</a></h4>
                                    <p>posted on  07 March 2014</p>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar-item categories">
                            <h3>카테고리</h3>
                            <ul class="nav navbar-stacked">
                                <li><a href="#">Lorem ipsum<span class="pull-right">(1)</span></a></li>
                                <li class="active"><a href="#">Dolor sit amet<span class="pull-right">(8)</span></a></li>
                                <li><a href="#">Adipisicing elit<span class="pull-right">(4)</span></a></li>
                                <li><a href="#">Sed do<span class="pull-right">(9)</span></a></li>
                                <li><a href="#">Eiusmod<span class="pull-right">(3)</span></a></li>
                                <li><a href="#">Mockup<span class="pull-right">(4)</span></a></li>
                                <li><a href="#">Ut enim ad minim <span class="pull-right">(2)</span></a></li>
                                <li><a href="#">Veniam, quis nostrud <span class="pull-right">(8)</span></a></li>
                            </ul>
                        </div>
                        <div class="sidebar-item tag-cloud">
                            <h3>카테고리 소 태그 등등 태그기능 살릴거면 이거 ㄱㄱ</h3>
                            <ul class="nav nav-pills">
                                <li><a href="#">Corporate</a></li>
                                <li><a href="#">Joomla</a></li>
                                <li><a href="#">Abstract</a></li>
                                <li><a href="#">Creative</a></li>
                                <li><a href="#">Business</a></li>
                                <li><a href="#">Product</a></li>
                            </ul>
                        </div>
                        <div class="sidebar-item popular">
                            <h3>사진 구역이라는데 판단은 담당자의 몫 안하실거면 지우세요</h3>
                            <ul class="gallery">
                                <li><a href="#"><img src="${ pageContext.request.contextPath }/resources/images/portfolio/popular1.jpg" alt=""></a></li>
                                <li><a href="#"><img src="${ pageContext.request.contextPath }/resources/images/portfolio/popular2.jpg" alt=""></a></li>
                                <li><a href="#"><img src="${ pageContext.request.contextPath }/resources/images/portfolio/popular3.jpg" alt=""></a></li>
                                <li><a href="#"><img src="${ pageContext.request.contextPath }/resources/images/portfolio/popular4.jpg" alt=""></a></li>
                                <li><a href="#"><img src="${ pageContext.request.contextPath }/resources/images/portfolio/popular5.jpg" alt=""></a></li>
                                <li><a href="#"><img src="${ pageContext.request.contextPath }/resources/images/portfolio/popular1.jpg" alt=""></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <c:import url="common/footer.jsp"/>
</body>
</html>
