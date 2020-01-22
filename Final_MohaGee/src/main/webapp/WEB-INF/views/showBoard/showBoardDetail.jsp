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
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3484c416ab1339a45db9fa79d4fa15c5"></script> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

    <style>
    	#board_content{
    		width : 1300px;
    		border : none;
    		font-size : 20px;
    		height : auto;
    	}
    	
    	#board_title{
    		/* font-family : ; */
    		font-size : 30px;
    	}
    	
    .bootstrap-tagsinput input{
		display: none;
	}
	
	li span[data-role = remove]{
		display: none;
	}
	
	.bootstrap-tagsinput{
		display: initial;
		border: none;
		box-shadow: none;
	}
	
	
	#favorite:hover{
		cursor: pointer;
	}
	
	.label{
		font-size: 85%;
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

    <section id="blog-details" >
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-7">
                    <div class="row"><br />

                    <!--  게시글  -->
                         <div class="col-md-12 col-sm-12">
                            <div class="single-blog blog-details two-column">
                                  <h2 class="post-title bold" id="board_title"><b>${ ShowBoard.bTitle }</b></h2><br />

		<!-- 게시글 사진 슬라이드 영역 -->
   <div id="carousel-example-generic" class="carousel slide carousel-fade" data-ride="carousel">

		  <ol class="carousel-indicators">
			  <c:forEach var="att" items="${ShowAttachment}" varStatus="status"> 
				  	<c:if test="${status.index == 0}">
				   		<li data-target="#carousel-example-generic" data-slide-to="${status.index}" class="active"></li>
				    </c:if>
				    <c:if test="${status.index != 0}">
				    	<li data-target="#carousel-example-generic" data-slide-to="${status.index}"></li>
				  	</c:if>
			  	</c:forEach>
		  </ol>  
		
		  <!-- Wrapper for slides -->
  	  <div class="carousel-inner" role="listbox">
		   <c:forEach var="att" items="${ShowAttachment}" varStatus="status"> 
		  		<c:if test="${status.index == 0}">
			   		 <div class="item active">
			     		 <img class="d-block w-100" src="${ pageContext.request.contextPath }/resources/upload/${att.bFileName}" class="img-responsive" alt="slide${status.index }">
		    		</div>
		     </c:if><c:if test="${status.index != 0}">
		  	    <div class="item">
		  	    <img class="d-block w-100" src="${ pageContext.request.contextPath }/resources/upload/${att.bFileName}" class="img-responsive" alt="slide${status.index }">
		  </div>
		</c:if>
		  </c:forEach>
		  </div>  
		  
		 
		  <!-- Controls -->
 	 	<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="icon-prev" aria-hidden="true" ></span>
				<span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				<span class="icon-next" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
		  </a> 

		</div><br />                 
		
		<!-- --------------------------------------------------- --!>

       <!-- 동영상 영역 -->
       <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalVM">
			<i class="fas fa-caret-square-right"></i>&nbsp;&nbsp; 누르면 영상이 나옵니다</button><br /><br />
			
		<!-- 본문 내용 영역 -->	
          <div class="post-content overflow">                                  					
			<pre class="form-control" id="board_content" name="bContent"><b>${ShowBoard.bContent }</b></pre><br />
					
        <!-- 지도 담을 영역 -->
        <div id="map" style="width:500px;height:400px;"></div>   
        

          <div class="post-content overflow">                                  					
              <div class="post-bottom overflow">
                  <ul class="nav navbar-nav post-nav">
                      <li style="color: #0099AE"><i class="fas fa-clock"></i>&nbsp;&nbsp;${ShowBoard.bDate}</li>
 
                      <li style="color: #0099AE"><i class="fas fa-tags"></i>&nbsp;&nbsp;<input type="text" data-role="tagsinput" value="${ ShowBoard.bTag }"/></li>
                    	
                      <li id="favorite" style="color: #0099AE"><i class="fas fa-heart"></i>&nbsp;&nbsp;${ favoriteCount }</li>
                      
                      <li style="color: #0099AE"><i class="fas fa-comments"></i>&nbsp;&nbsp;댓글 숫자</li>
                  </ul>
              </div>
        <div class="blog-share">
            <span class='st_facebook_hcount'></span>
            <span class='st_twitter_hcount'></span>
            <span class='st_linkedin_hcount'></span>
            <span class='st_pinterest_hcount'></span>
            <span class='st_email_hcount'></span>
            </div>			                        
        </div>
<br />				


	<!-- 게시글 수정 버튼  -->
	<div>
		<a href="${ pageContext.request.contextPath }/showBoard/showBoardList.do">
			<button type="button" class="btn btn-warning btn-rounded" id="listBtn">목록이동</button>
		</a>&nbsp;			

 <a href="${ pageContext.request.contextPath }/showBoard/showBoardList.do" class="btn orange"><span class="btn-lg">button</span></a>

		<button type="button" class="btn btn-primary btn-rounded"
		onclick="location.href='${pageContext.request.contextPath}/showBoard/showBoardUpdateForm.do?bNo=${ShowBoard.bNo}'" >수정 하기</button>&nbsp;

		<button type="button" class="btn btn-danger btn-rounded" 
			onclick="location.href='${pageContext.request.contextPath}/showBoard/showBoardDelete.do?bNo=${ShowBoard.bNo}'">삭제 하기</button>				
			
<br /><br />

             <div class="author-profile padding">
                 <div class="row">
                     <div class="col-sm-2">
                         <img src="${ pageContext.request.contextPath }/resources/profile/${ShowBoard.pRenamedFileName}">
                    </div>
                    <div class="col-sm-10" style="font-family:binggrae;">
                        <h3 style="font-family:binggrae;">${ ShowBoard.nickName }</h3>
                        <p>${ ShowBoard.introduce }</p>
                    </div>
                </div>
            </div>
                 
    <!--  댓글 시작 영역 -->
    <div class="response-area"  style="font-family:binggrae;">
    
    <!--  댓글 제목 & 버튼 부분 -->
<div class="row">
	<div class="col-sm-10"></div>	
		<div class="col-sm-2" align="right">	
			<button type="button" class="btn btn-success btn-rounded btn-sm"  
				onclick="location.href='${pageContext.request.contextPath}/showBoard/showBoardUpdateForm.do?bNo=${ShowBoard.bNo}'" >댓글작성</button>&nbsp;					
		</div> 
   </div><br />

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
				    		<button type="button" class="btn btn-info btn-rounded btn-sm"
							onclick="location.href='${pageContext.request.contextPath}/showBoard/showBoardUpdateForm.do?bNo=${ShowBoard.bNo}'">댓글작성</button>&nbsp;					
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
		<div class="embed-responsive embed-responsive-16by9 z-depth-1-half"> ${ShowBoard.bUrl}</div>
	</div>

      <!--Footer-->
      <div class="modal-footer justify-content-center flex-column flex-md-row">
	        <button type="button" class="btn btn-outline-primary btn-rounded btn-md ml-4"
	          data-dismiss="modal">Close</button>
         </div>
      </div>
    <!--/.Content-->
  </div>
</div>
<!--Modal: modalVM-->    
<!-- ===========동영상 모달 끝 ===========-->    
<script>
		/*  카카오 지도 구현  */
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(${ShowBoard.cLat}, ${ShowBoard.cLng}),  //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(${ShowBoard.cLat}, ${ShowBoard.cLng}), // 지도의 중심좌표
	        level: 3, // 지도의 확대 레벨
	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(${ShowBoard.cLat}, ${ShowBoard.cLng}),   // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
		
    
    // 태그 관련 스크립트
    	$("input").tagsinput('items')
    // 좋아요 기능
    
    $(function(){
    	
    	var userNo = "${member.userNo}";
    	var bNo = "${ShowBoard.bNo}";
    	
    	$.ajax({
    		url: "${pageContext.request.contextPath}/favorite/checkFavorite",
    		data: {
    			userNo : userNo,
    			bNo : bNo
    		},
    		dataType: "json",
    		async: false,
    		success: function(data){
    			
    			if(data.Favorite.fStatus == 'Y'){
    				$("#favorite").css("color", "red");
    			}
    			
    		}
    	});
    	
    });
    
    $("#favorite").on("click", function(){
    	
    	var userNo = "${member.userNo}";
    	var bNo = "${ShowBoard.bNo}";
    	
    	$.ajax({
    		url: "${pageContext.request.contextPath}/favorite/checkFavorite",
    		data: {
    			userNo : userNo,
    			bNo : bNo
    		},
    		dataType: "json",
    		async: false,
    		success: function(data){
    			
    			/* console.log(data);
    			console.log(data.Favorite);
    			console.log(data.Favorite.fStatus); */
    			
    			var fStatus = data.Favorite.fStatus;
    			
    			if(fStatus == null || fStatus == 'N'){
    				$.ajax({
    					url: "${pageContext.request.contextPath}/favorite/doFavorite",
    					data: {
    						fStatus : fStatus,
    		    			userNo : userNo,
    		    			bNo : bNo
    		    		},
    		    		async: false,
    		    		success: function(data){
    		    			if(data == 1){
    		    				alert("좋아요를 눌러주셔서 감사합니다.");
    		        			$("#favorite").css("color", "red");
    		        			
    		        			var text = $('#favorite').text();
    		        			
    		        			$.ajax({
    		        				url: "${pageContext.request.contextPath}/favorite/favoriteNumber",
    		        				data: {
    		        					bNo : bNo
    		        				},
    		        				async: false,
    		        				success: function(data){
    		        					$('#favorite').html('<i class="fas fa-heart"></i>&nbsp;&nbsp;' + data);
    		        				}
    		        			});
    		    			}
    		    		}
    				});
    			} else {
    				$.ajax({
    					url: "${pageContext.request.contextPath}/favorite/cancelFavorite",
    					data: {
    						userNo : userNo,
    		    			bNo : bNo
    					},
    					async: false,
    					success: function(data){
    						if(data == 1) {
    							alert("좋아요를 취소하였습니다.");
    		        			$("#favorite").css("color", "#0099AE");
    		        			
    		        			$.ajax({
    		        				url: "${pageContext.request.contextPath}/favorite/favoriteNumber",
    		        				data: {
    		        					bNo : bNo
    		        				},
    		        				async: false,
    		        				success: function(data){
    		        					$('#favorite').html('<i class="fas fa-heart"></i>&nbsp;&nbsp;' + data);
    		        				}
    		        			});
    						}
    					}
    				});
    			}
    		}
    	});
    });
    	
    </script>
    
    <c:import url="../common/footer.jsp"/>
</body>
</html>







