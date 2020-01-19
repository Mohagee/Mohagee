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
    <title>게시글 상세보기</title>
    
    <c:import url="../common/commonUtil.jsp"/>
    
    <style>
       #board_content{
          border : none;
          font-size : 20px;
       }
       
       #board_title{
          font-family : binggrea;
          font-size : 30px;
          
       }
    </style>
    
    
</head>

<body>
   
   <c:import url="../common/header.jsp"/>

    <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">ALICE</h1>
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
                        
                    <!--  게시글  -->
                         <div class="col-md-12 col-sm-12">
                            <div class="single-blog blog-details two-column">
                                  <h2 class="post-title bold" id="board_title">${ TravelBoard.bTitle }</h2><br />
                            
                   <c:forEach var="TravelAttachment" items="${TravelAttachment}">
                         
                                <!--  게시글 상세보기 영역 -->
                                <div class="post-thumb">                           
                                    <img src="${ pageContext.request.contextPath }/resources/upload/${TravelAttachment.bFileName}" class="img-responsive" alt="">
                                </div>
                                
                      </c:forEach>
                             
                                <div class="post-content overflow">                                                 
                                    <p class="form-control" id="board_content" name="bContent"><b>${TravelBoard.bContent }</b></p>
                                    <div class="post-bottom overflow">
                                        <ul class="nav navbar-nav post-nav">
                                            <li><a href="#"><i class="far fa-clock"></i>&nbsp;&nbsp;${TravelBoard.bDate}</a></li>
                                            
                                            <li><a href="#"><i class="fa fa-tag"></i>여기 태그</a></li>
                                            
                                            <li><a href="#"><i class="fa fa-heart"></i>좋아요 숫자</a></li>
                                            
                                            <li><a href="#"><i class="fa fa-comments"></i>댓글 숫자</a></li>
                                        </ul>
                                    </div>
                                    </div>
                                    <!-- 게시글 수정 버튼  -->
		                            <div>
		                            <a href="${ pageContext.request.contextPath }/travelBoard/travelBoardList.do">
		                               <button type="button" class="btn btn-warning" id="rewriteBtn">목록으로</button>
		                            </a>&nbsp;                           
		                            <a href="${ pageContext.request.contextPath }/travelBoard/travelBoardUpdateView.do?bNo=${TravelBoard.bNo}">
		                               <button type="button" class="btn btn-primary" id="rewriteBtn">수정하기</button>
		                            </a>&nbsp;
		                            <a href="${ pageContext.request.contextPath }/travelBoard/travelBoardDelete.do?bNo=${TravelBoard.bNo}">
		                               <button type="button" class="btn btn-danger" id="deleteBtn">삭제하기</button>
		                            </a>
		                            </div><br />
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
                         <img src="${ pageContext.request.contextPath }/resources/profile/${TravelBoard.pRenamedFileName}">
                    </div>
                    <div class="col-sm-10" style="font-family:binggrae;">
                        <h3 style="font-family:binggrae;">${ TravelBoard.nickName }</h3>
                        <p>${ TravelBoard.introduce }</p>
                    </div>
                </div>
            </div>
                           
                                    
                                    
                                    <!--  댓글 부분  -->
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
            </div>
  
    </section>
    
    <c:import url="../common/footer.jsp"/>
</body>
</html>