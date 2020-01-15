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
    		height : auto;
    	}
    	
    	#board_title{
    		/* font-family : ; */
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
                            <h1 class="title" style="font-family : cookierun; font-size:40px;">Alice's Contents!!</h1>
                        </div>                                                                                
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#page-breadcrumb-->


    <section id="blog-details" ><!-- class="padding-top" -->
    
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-7">
                    <div class="row"><br />

                    <!--  게시글  -->
                         <div class="col-md-12 col-sm-12">
                            <div class="single-blog blog-details two-column">
                                  <h2 class="post-title bold" id="board_title"><b>${ ShowBoard.bTitle }</b></h2><br />
                            
                    <!--  게시글 상세보기 영역 -->
   				 	<c:forEach var="ShowAttachment" items="${ShowAttachment}"> 				 			
                                <div class="post-thumb">                           
                                    <img src="${ pageContext.request.contextPath }/resources/showUpload/${ShowAttachment.bFileName}" class="img-responsive">                                  
                                </div><br />                                           
                      </c:forEach>

                      <div class="post-content overflow">                                  					
                          <p class="form-control" id="board_content" name="bContent"><b>${ShowBoard.bContent }</b></p>
                          <div class="post-bottom overflow">
                              <ul class="nav navbar-nav post-nav">
                                  <li><a href="#"><i class="fas fa-clock"></i>&nbsp;&nbsp;${ShowBoard.bDate}</a></li>
                                  
                                  <li><a href="#"><i class="fas fa-tags"></i>${ ShowBoard.bTag }</a></li>
                                
                                  <li><a href="#"><i class="fas fa-heart"></i>좋아요 숫자</a></li>
                                  
                                  <li><a href="#"><i class="fas fa-comments"></i>댓글 숫자</a></li>
                              </ul>
                          </div>
                         <div class="blog-share">
                             <span class='st_facebook_hcount'></span>
                             <span class='st_twitter_hcount'></span>
<!--                              <span class='st_linkedin_hcount'></span>
                             <span class='st_pinterest_hcount'></span> -->
                             <span class='st_email_hcount'></span>
                             <!-- <span>이거 살리면 기능 자동으로 되요</span> -->
                         </div>			                        
                     </div>
    				<br />				


			<!-- 게시글 수정 버튼  -->
			<div>
			<a href="${ pageContext.request.contextPath }/showBoard/showBoardList.do">
				<button type="button" class="btn btn-warning" id="listBtn">목록이동</button>
			</a>&nbsp;			

			<input type="button" class="btn btn-success" value="수정하기" 
			onclick="location.href='${pageContext.request.contextPath}/showBoard/showBoardUpdateForm.do?bNo=${ShowBoard.bNo}'" />&nbsp;

				<input type="button" class="btn btn-danger" value="삭제하기" 
					onclick="location.href='${pageContext.request.contextPath}/showBoard/showBoardDelete.do?bNo=${ShowBoard.bNo}'"/>				
				
	<br /><br />

             <div class="author-profile padding">
                 <div class="row">
                     <div class="col-sm-2">
                         <img src="${ pageContext.request.contextPath }/resources/images/alice.jpg" alt="">
                    </div>
                    <div class="col-sm-10" style="font-family:binggrae;">
                        <h3 style="font-family:binggrae;">ALice</h3>
                        <p>공연을 소개해드리는 에디터입니다!</p>
                    </div>
                </div>
            </div>
                 
    <!--  댓글 시작 영역 -->
    <div class="response-area"  style="font-family:binggrae;">
    
    <!--  댓글 제목 & 버튼 부분 -->
    <div class="row">
    	<div class="col-sm-10">
			<p class="bold" style="font-size:25px;">Comment</p>
		</div>
    		<div class="col-sm-2" align="right">	
				    <input type="button" class="btn btn-success btn-rounded btn-sm" value="댓글작성" 
							onclick="location.href='${pageContext.request.contextPath}/showBoard/showBoardUpdateForm.do?bNo=${ShowBoard.bNo}'" />&nbsp;					
   			 </div>
   </div>	

    <ul class="media-list"> <!-- 댓글영역 -->
    <!-- 댓글 하나 영역 -->
        <li class="media">   
            <div class="post-comment">
                <a class="pull-left" href="#"><!-- <== 작성자 프로필로 이동하기? -->
                    <img class="media-object" src="<%-- ${ pageContext.request.contextPath }/resources/images/blogdetails/2.png --%>" alt="작성자프로필사진">
                </a>
                <div class="media-body">
                    <span><i class="fa fa-user"></i>&nbsp;댓글 작성자</span>
                    	<p>댓글 내용</p>
                    	<i class="far fa-clock"></i> 댓글 작성일
                    	<div align="right">	
				    		<input type="button" class="btn btn-info btn-rounded btn-sm" value="댓글작성" 
							onclick="location.href='${pageContext.request.contextPath}/showBoard/showBoardUpdateForm.do?bNo=${ShowBoard.bNo}'" />&nbsp;					
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
</div>
</section>
    
    <script>
		
    </script>
    
    <c:import url="../common/footer.jsp"/>
</body>
</html>
