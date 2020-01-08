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
    <title>Travel Details | Triangle</title>
    
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
                            <h1 class="title">Travel</h1>
                            <p>Anywhere in our Universe</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>

    <section id="portfolio-information" class="padding-top">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <img src="${ pageContext.request.contextPath }/resources/images/portfolio-details/1.jpg" class="img-responsive" alt="">
                </div>
                <div class="col-sm-6">
                    <div class="project-name overflow">
                        <h2 class="bold">제목</h2>
                        <ul class="nav navbar-nav navbar-default">
                            <li><a href="#"><i class="far fa-clock"></i>등록날짜</a></li>
                            <li><a href="#"><i class="fa fa-tag"></i>태그</a></li>
                            <li><a href="#"><i class="fa fa-heart"></i>좋아요 숫자</a></li>
                            <li><a href="#"><i class="fa fa-comments"></i>댓글 숫자</a></li>
                        </ul>
                    </div>
                    <div class="project-info overflow">
                        <h3>소제목</h3>
                        <p>내용~!~!~!~</p>
                        <ul class="elements">
                            <li><i class="fa fa-angle-right"></i> 원하시는내용</li>
                            <li><i class="fa fa-angle-right"></i> 쓰시면</li>
                            <li><i class="fa fa-angle-right"></i> 될거같아요</li>
                        </ul>
                    </div>
                    <div class="skills overflow">
                    <h3>공유</h3>
                        <ul class="nav navbar-nav navbar-default">
                            <li><span class='st_facebook_hcount'></span></li>
                            <li><span class='st_twitter_hcount'></span></li>
                            <li><span class='st_linkedin_hcount'></span></li>
                            <li><span class='st_pinterest_hcount'></span></li>
                            <li><span class='st_email_hcount'></span></li>
                        </ul>
                    </div>
                    <div class="live-preview">
                        <a href="#" class="btn btn-common uppercase">프리뷰 버튼인데 음...</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <!--/#portfolio-information-->
     <section id="portfolio-information" class="padding-top">
    <div class="container">
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
    </div>
    <div class="response-area">
    <div class="container">
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
    </div>                
    </div><!--/Response-area-->
    </section>
    <section id="related-work" class="padding-top padding-bottom">
        <div class="container">
            <div class="row">
                <h1 class="title text-center">사진모음인데 이것도..?
                </h1>
                <div class="col-sm-3">
                    <div class="portfolio-wrapper">
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="${ pageContext.request.contextPath }/resources/images/portfolio/1.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="${ pageContext.request.contextPath }/resources/images/portfolio/1.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info ">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="portfolio-wrapper">
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="${ pageContext.request.contextPath }/resources/images/portfolio/2.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="${ pageContext.request.contextPath }/resources/images/portfolio/2.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info ">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="portfolio-wrapper">
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="${ pageContext.request.contextPath }/resources/images/portfolio/3.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="${ pageContext.request.contextPath }/resources/images/portfolio/3.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info ">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="portfolio-wrapper">
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="${ pageContext.request.contextPath }/resources/images/portfolio/4.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="${ pageContext.request.contextPath }/resources/images/portfolio/4.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info ">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <c:import url="common/footer.jsp"/>
    
</body>
</html>
