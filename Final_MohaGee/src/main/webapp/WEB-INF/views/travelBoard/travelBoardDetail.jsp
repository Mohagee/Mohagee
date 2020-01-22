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
                      
                      
				    <!-- Google Map : The div element for the map -->
				    <div id="map"></div>
				    
                             
                             
                                <div class="post-content overflow">                                                 
                                    <p class="form-control" id="board_content" name="bContent"><b>${TravelBoard.bContent }</b></p>
                                    <div class="post-bottom overflow">
                                        <ul class="nav navbar-nav post-nav">
                                            <li style="color: #0099AE"><i class="fas fa-clock"></i>&nbsp;&nbsp;${TravelBoard.bDate}</li>
             
                                  			<li style="color: #0099AE"><i class="fas fa-tags"></i>&nbsp;&nbsp;<input id="tag" type="text" data-role="tagsinput" value="${ TravelBoard.bTag }"/></li>
                                	
                                  			<li id="favorite" style="color: #0099AE"><i class="fas fa-heart"></i>&nbsp;&nbsp;${ favoriteCount }</li>
                                  
                                  			<li style="color: #0099AE"><i class="fas fa-comments"></i>&nbsp;&nbsp;댓글 숫자</li>
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
    
    <script>
    	// Google Map
	    // Initialize and add the map
		function initMap() {
		  // The location of Uluru
		  var location = { lat: parseFloat('${TravelBoard.mapY}'), lng: parseFloat('${TravelBoard.mapX}')};
		  // The map, centered at Uluru
		  var map = new google.maps.Map(
		      document.getElementById('map'), {zoom: 4, center: location});
		  // The marker, positioned at Uluru
		  var marker = new google.maps.Marker({position: location, map: map});
		}
	    </script>
	    <!--Load the API from the specified URL
	    * The async attribute allows the browser to render the page while the API loads
	    * The key parameter will contain your own API key (which is not needed for this tutorial)
	    * The callback parameter executes the initMap() function
	    -->
	    <script async defer
	    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAdVJlcXLgyChvr_TkNor9fpVvPXPQW8E&callback=initMap">
	</script>
    
    <script>
  //태그 관련 스크립트
	$("#tag").tagsinput('items');
// 좋아요 기능

$(function(){
	
	var userNo = "${member.userNo}";
	var bNo = "${TravelBoard.bNo}";
	
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
	var bNo = "${TravelBoard.bNo}";
	
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
</body>
</html>