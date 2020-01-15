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
    <title style="font-family:cookierun;">HOWL's MOHAGEE</title>
    
    <c:import url="../common/commonUtil.jsp"/>
</head><!--/head-->

<body>
   
   <c:import url="../common/header.jsp"/>

    <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title" style="font-family:cookierun;">HOWL's</h1>
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
                            <h2 class="post-title bold"><a href="#" style="font-family:cookierun; font-size:30px;">${board.bTitle } <br/><br/></a></h2>
                            
                   <c:forEach var="GymAttachment" items="${GymAttachmentList}">
                         
                            <!--  게시글 상세보기 영역 -->
                                <div class="post-thumb">
                                    <!-- <a href="#"> -->
                                    <img src="${ pageContext.request.contextPath }/resources/gymUpload/${GymAttachment.bFileName}" class="img-responsive" alt="">
                                    <!-- </a> -->
                                   
                                </div>
                                <hr />
                      </c:forEach>
                             
                                <div class="post-content overflow">
                                    <p style="font-family:cookierun; font-size:30px;">
                                    	${gymBoard.bContent }
                                    </p>
					<br />
                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalVM"><i class="fas fa-caret-square-right"></i>&nbsp;&nbsp; PlayVedio</button>
                                    <div class="post-bottom overflow">
                                        <ul class="nav navbar-nav post-nav">
                                            <li><a href="#"><i class="far fa-clock" style="font-family:cookierun;"></i>&nbsp;&nbsp;${gymBoard.bDate}</a></li>
                                            <li><a href="#"><i class="fa fa-tag" style="font-family:cookierun;"></i>&nbsp;&nbsp;${gymBoard.bTag}</a></li>
                                            <li><a href="#"><i class="fa fa-heart" style="font-family:cookierun;"></i>&nbsp;&nbsp;좋아요 숫자</a></li>
                                            <li><a href="#"><i class="fa fa-comments" style="font-family:cookierun;"></i>&nbsp;&nbsp;댓글 숫자</a></li>
                                        </ul>
                                    </div>
                                                               <!-- 게시글 수정 버튼  -->
				<div>
					<a href="${ pageContext.request.contextPath }/gymBoard/gymBoardList.do">
					   <button type="button" class="btn btn-warning" id="rewriteBtn">목록으로</button>
					</a>&nbsp;                           
					<a href="${ pageContext.request.contextPath }/gymBoard/gymBoardUpdateView.do?bNo=${gymBoard.bNo}">
					   <button type="button" class="btn btn-primary" id="rewriteBtn">수정하기</button>
					</a>&nbsp;
					<a href="${ pageContext.request.contextPath }/gymBoard/gymBoardDelete.do?bNo=${gymBoard.bNo}">
					   <button type="button" class="btn btn-danger" id="deleteBtn">삭제하기</button>
					</a>
				 </div><br />
                               </div>
                                    <div class="blog-share">
                                        <span class='st_facebook_hcount'></span>
                                        <span class='st_twitter_hcount'></span>
                                        <span class='st_linkedin_hcount'></span>
                                        <span class='st_pinterest_hcount'></span>
                                        <span class='st_email_hcount'></span>
                                        
                                    </div>
                                    <div class="author-profile padding">
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <img src="${ pageContext.request.contextPath }/resources/images/blogdetails/1.png" alt="">
                                            </div>
                                            <div class="col-sm-10">
                                                <h3>작성자 이름</h3>
                                                <p>작성자 정보등등...?</p>
                                                <span><a href=""> 작성자 웹사이트 페북등등 살릴지말지는...</a></span>
                                            </div>
                                        </div>
                                    </div>
                           
<!--  =================댓글 시작 =================================-->                                    
                                    
                                    <!--  댓글 부분  -->
                                    <div class="response-area">
                                    <h2 class="bold">Comments</h2>
                                    <ul class="media-list">
                                        <li class="media">
                                        
                                        <!-- 댓글창 시작 -->
                                            <div class="post-comment">
                                                <a class="pull-left" href="#">
                                                    <img class="media-object" src="${ pageContext.request.contextPath }/resources/images/blogdetails/2.png" alt="">
                                                </a>
                                                <div class="media-body">
                                                    <span><i class="fa fa-user"></i>댓글 작성자 <a href="#">댓글 작성일</a></span>
                                                    
                                                    <p>댓글 내용3333</p>
                                                  
                                                       <div align="right">
                                                       <a href=""><button type="button" class="btn btn-primary" id="rewriteBtn">수정</button></a>                           
                                                       <a href=""><button type="button" class="btn btn-danger" id="deleteBtn">삭제</button></a>                                     
                                                       <a href=""><button type="button" class="btn btn-success" id="reply">댓글</button></a>                                    
                                                        </div>
                                                    
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













<!-- ===========동영상 모달 시작 ===========-->
<!--Modal: modalVM-->
<div class="modal fade" id="modalVM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">

    <!--Content-->
    <div class="modal-content">

      <!--Body-->
      <div class="modal-body mb-0 p-0">

        <div class="embed-responsive embed-responsive-16by9 z-depth-1-half">
          ${board.bUrl }
        </div>

      </div>

      <!--Footer-->
      <div class="modal-footer justify-content-center flex-column flex-md-row">
        <span class="mr-4">Spread the word!</span>
        <div>
          <a type="button" class="btn-floating btn-sm btn-fb">
            <i class="fab fa-facebook-f"></i>
          </a>
          <!--Twitter-->
          <a type="button" class="btn-floating btn-sm btn-tw">
            <i class="fab fa-twitter"></i>
          </a>
          <!--Google +-->
          <a type="button" class="btn-floating btn-sm btn-gplus">
            <i class="fab fa-google-plus-g"></i>
          </a>
          <!--Linkedin-->
          <a type="button" class="btn-floating btn-sm btn-ins">
            <i class="fab fa-linkedin-in"></i>
          </a>
        </div>
        <button type="button" class="btn btn-outline-primary btn-rounded btn-md ml-4"
          data-dismiss="modal">Close</button>

      </div>

    </div>
    <!--/.Content-->

  </div>
</div>
<!--Modal: modalVM-->    
<!-- ===========동영상 모달 끝 ===========-->    
    
    <c:import url="../common/footer.jsp"/>
</body>
</html>