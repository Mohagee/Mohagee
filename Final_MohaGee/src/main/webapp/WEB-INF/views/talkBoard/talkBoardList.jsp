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
    
    <c:import url="../common/commonUtil.jsp"/>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	
	<title>수다방</title>

</head>

<body>
	
	<c:import url="../common/header.jsp"/>
	
    <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">수다방</h1>
                            <p>Anywhere in our Universe</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#action-->

    <section id="portfolio" class="padding-top padding-bottom">
        <div class="container">
        
        	<div align="right">
        	<c:if test="${ !empty member}">
        	<a href="${ pageContext.request.contextPath }/talkBoard/talkInsert.do">
              <button type="button" class="btn btn-success" id="writerBtn">글쓰기</button>
             </a>
             &nbsp;&nbsp;&nbsp;
             <a class="btn btn-primary" href="${ pageContext.request.contextPath }/chat.do" role="button">
             	<i class="fas fa-paper-plane"></i>&nbsp;&nbsp; 쪽지
             </a>
            </c:if> 
        	</div>
             <br /><br /><br />
            <div class="row">
                <div class="masonery-items masonery_area" id="boardScroll">
                
                <c:forEach var="talkBoard" items="${list}">
                
                        <div class="col-md-3 col-sm-4">
                        <div class="single-blog two-column">
                    <c:if test="${ fn:trim(talkBoard.tFileType)  == 'I'}">
						<div class="post-thumb">
							<a href="${ pageContext.request.contextPath }/talkBoard/talkBoardDetail.do?tno=${talkBoard.tno}">
								<img src="${ pageContext.request.contextPath }/resources/talkUpload/${talkBoard.titleFilename}"
									class="img-responsive" alt=""></a>
															
						</div>
					</c:if>
                            <div class="post-content overflow">
                               <ul class="nav nav-justified post-nav">
                                   <li><a href="#"><i class="fa fa-tag"></i>${talkBoard.tTag}</a></li>
                               </ul>
                               <h2 class="post-title bold">
									<a href="${ pageContext.request.contextPath }/talkBoard/talkBoardDetail.do?tno=${talkBoard.tno}">
												${ talkBoard.tTitle }</a>
								</h2>
                                <div class="post-bottom overflow">
                                    <ul class="nav nav-justified post-nav">
                                        <li><a href="#"><i class="fa fa-heart"></i> Love</a></li>
                                        <li><a href="#"><i class="fa fa-comments"></i> Comments</a></li>
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
    
    <script>
	
	JQ(function(){
		
		JQ("").on("click", function(){
			
			var tno = JQ(this).attr("id");
			console.log("tno = " + tno);
			location.href = "JQ{pageContext.request.contextPath}/talkBoard/talkBoardDetail.do?no=" + tno;
		});
		
	});
    
    </script>
    
    <!-- <script>
	    $(function() {
	
	        // 스크롤 감지
	        var didScroll = false;
	
	        $(window).on('scroll', function() { didScroll = true; });
	
	        setInterval(function() {
	            var bottomHeight = $(window).scrollTop() + $(window).height() + 600;
	            var docHeight = $(document).height();
	
	            if (didScroll) {
	                didScroll = false;
	                if (bottomHeight > docHeight) infiniteScrollContent();
	            }
	        }, 250);
	
	        function infiniteScrollContent() {
	
	            var scrollcon = '';
	            for (var k = 0; k < 4; k++) {
	                scrollcon += 'foreach 안에 있는 것들 들어갈 곳이에요';
	            }            
	            $("#boardScroll").append(scrollcon);
	        }
	    });
    </script> -->
    
    <c:import url="../common/footer.jsp"/>
</body>
</html>