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
    <title>수다방</title>
    
    <c:import url="../common/commonUtil.jsp"/>

</head><!--/head-->

<style>
	html, body {
	  height: 100%;
	}
	
	.wrap {
	  height: 100%;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	
	.btn btn-success {
	  width: 140px;
	  height: 45px;
	  font-family: 'Roboto', sans-serif;
	  font-size: 11px;
	  text-transform: uppercase;
	  letter-spacing: 2.5px;
	  font-weight: 500;
	  color: #000;
	  background-color: #fff;
	  border: none;
	  border-radius: 45px;
	  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	  transition: all 0.3s ease 0s;
	  cursor: pointer;
	  outline: none;
	  }
	
	.btn btn-success:hover {
	  background-color: #2EE59D;
	  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	  color: #fff;
	  transform: translateY(-7px);
	}    
	    
	
	
	.facebook-box .footer .write-comment input[type="text"] {
	  background: #fff;
	  border: 1px solid #dcdee3;
	  padding: 7px 7px 7px 5px;
	  min-height: 16px;
	  width: calc(95% - 32px - 22px);
	  float: left;
	}
</style>

<body>

	<c:import url="../common/header.jsp"/>

	
    <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title" style="font-family:cookierun;">게시글 상세보기</h1>
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
                    
                    <!-- 게시글 -->
                         <div class="col-md-12 col-sm-12">
                            <div class="single-blog blog-details two-column">
                            
                       <c:forEach var="talkAttachment" items="${talkAttachmentList}">
                            <!-- 이미지 영역 -->
                                <div class="post-thumb">
                                   	<img src="${ pageContext.request.contextPath }/resources/talkUpload/${talkAttachment.tFileName}" class="img-responsive" alt="">
                                	<br />
                                </div>
                          </c:forEach>      
                                
                                <div class="post-content overflow">
                                    <h2 class="post-title bold">${talkBoard.tTitle}</h2>
                                    <span> ${talkBoard.tContent} </span>
                                    <div class="post-bottom overflow">
                                        <ul class="nav navbar-nav post-nav">
                                         	<li><a href="#"><i class="far fa-clock" style="font-family:cookierun;"></i>&nbsp;&nbsp;${talkBoard.tDate}</a></li>
                                            <li><a href="#"><i class="fa fa-tag"></i>${talkBoard.tTag}</a></li>
                                            <li><a href="#"><i class="fa fa-comments"></i> Comments</a></li>
                                        </ul>
                                        
                                        <br /><br /><br />
                  <div>
					<a href="${ pageContext.request.contextPath }/talkBoard/talkBoardList.do">
					   <button type="button" class="btn btn-warning" id="rewriteBtn">목록으로</button>
					</a>&nbsp;    
					
					 <c:if test="${member.userNo eq talkBoard.tWriter}">                       
					<a href="${ pageContext.request.contextPath }/talkBoard/talkUpdate.do?tno=${talkBoard.tno}">
					   <button type="button" class="btn btn-primary" id="rewriteBtn">수정하기</button>
					</a>&nbsp;
					<a href="${ pageContext.request.contextPath }/talkBoard/talkBoardDelete.do?tno=${talkBoard.tno}">
					   <button type="button" class="btn btn-danger" id="deleteBtn">삭제하기</button>
					</a>
					</c:if>
					
				 </div>
                                    </div>
                                    
                     
			      <!-- 댓글 작성 부분 -->           
			       <div id="addComment">
			          <input type="text" placeholder="댓글을 달아주세요" style="font-family:binggrae;"></input>&nbsp;&nbsp;&nbsp;<button id="newCommentButton" onclick="submitNewComment(this)">&nbsp;댓 글&nbsp;</button>
			       </div><br />                 
			                 
			    <!--  댓글 시작 영역 -->
			    <div class="response-area"  style="font-family:binggrae;">
			    
			  <ul class="media-list">
			               <c:forEach var="sbc" items="${tcList }">
			                   <li class="reply${ tc.tcLevel }" style="padding-left : ${ tc.bcLevel * 7 }%" for="${ tc.ttcNo }">
			                       <div class="post-comment">
			                           <a class="pull-left" href="${pageContext.request.contextPath}/member/myPage.do?userNo=${tc.userNo }">
			                               <img class="media-object" src="${pageContext.request.contextPath }/resources/profile/${tc.pRenamedFileName}" alt="">
			                           </a>
			                           <div class="media-body">
			                               <span style="font-family:cookierun;"><a href="${pageContext.request.contextPath}/member/myPage.do?userNo=${tc.userNo }" style="font-family:cookierun;">${tc.nickName }이</a>  ${tc.tcDate }에 작성</span>
			                               <br /><br>
			                               <textarea class="contentUpdateForm" id="${ tc.tcNo }" style="color: black;" readonly>${tc.bcContent }</textarea>
			                               <ul class="nav navbar-nav post-nav">
			                                   <li style="font-family:cookierun;"><i class="fa fa-wrench" ></i>&nbsp;&nbsp;수정</li>
			                                   <li style="font-family:cookierun;"><i class="fa fa-eraser" ></i>&nbsp;&nbsp;삭제</li>
			                               </ul>
			                           </div>
			                       </div>
			                       <!-- 대댓글 작성 창 -->
			                       <div id="addComment"><input type="text" placeholder="대댓글 달고싶지?" style="font-family:cookierun;"></input>&nbsp;&nbsp;&nbsp;<button id="newCommentButton" onclick="submitNewReplyComment(this, ${ tc.tcNo })">댓글</button></div>
			                       
			                   </li>
			               </c:forEach>
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
    	
    /* 댓글 만들기 스크립트 시작 */
    /**
    	obj : 클릭된 버튼 자신
    */
   function submitNewComment(obj){
   	$.ajax({
   		url : '${ pageContext.request.contextPath }/tComment/tCommentInsert.do',
   		  data : {
   			  bNo : '${talkBoard.tno}',
   			  userNo : '${member.userNo}',
   			  bcContent : $(obj).siblings('input').val()
   		  }, success : function(data){
   			  alert("댓글 추가 성공!");
   			  location.href='${pageContext.request.contextPath}/talkBoard/talkBoardDetail.do?tno=${talkBoard.tno}';
   		  }
   	});
   }

   /**
   	obj : 클릭된 버튼 자신
   	parentBcNo : 누구의 대댓글인지 확인하기 위한 원본 댓글의 번호
   */
   function submitNewReplyComment(obj, parentBcNo){
   	$.ajax({
   		url : '${ pageContext.request.contextPath }/tComment/tCommentInsert.do',
   		  data : {
   			  bNo : '${talkBoard.tno}',
 			  userNo : '${member.userNo}',
   			  bcContent : $(obj).siblings('input').val(),
   			  bbcNo : parentBcNo
   		  }, success : function(data){
   			  alert("댓글 추가 성공!");
   			  location.href='${pageContext.request.contextPath}/talkBoard/talkBoardDetail.do?tno=${talkBoard.tno}';
   		  }
   	});
   }

   $('.fa-wrench').parent().each(function(){
   	$(this).on('click', function(){
   		var textArea = $(this).parent().parent().children('textarea');
   		if(textArea.prop('readonly')){
   			textArea.prop('readonly', false);
   		} else {
   			textArea.prop('readonly', true);
   			$.ajax({
   				url : '${ pageContext.request.contextPath }/tComment/tCommentUpdate.do',
   				  data : {
   					  bcNo : textArea.attr('id'),
   					  userNo : '${member.userNo}',
   					  bcContent : textArea.val()
   				  }, success : function(data){
   					  if(data != 0){
   						  alert("댓글 변경 성공!");		
   					  } else {
   						  alert("댓글 수정 실패!");
   					  }
   				  }
   			});
   		}
   	});
   });

   $('.fa-eraser').parent().each(function(){
   	$(this).on('click', function(){
   		var obj =  $(this);
   		var textArea = $(this).parent().parent().children('textarea');
   		
   		$.ajax({
   			url : '${ pageContext.request.contextPath }/tComment/tCommentDelete.do',
   			  data : {
   				  bcNo : textArea.attr('id')
   			  }, success : function(data){
   				  if(data != 0){
   					  alert("댓글 삭제 성공!");		
   					  obj.parents('li').remove();
   					  $('[for=' + textArea.attr('id') + ']').remove();
   				  } else {
   					  alert("댓글 삭제 실패!");
   				  }
   			  }
   		});
   	});
   });


   $(function(){
   	$.ajax({
   		url : '${ pageContext.request.contextPath }/tComment/tCommentSelectList.do',
   		data : {bNo : '${talkBoard.tno}'},
   		success : function(data){
   			
   			  for(var i in data){
   				  let comments = document.getElementById("comments");
   				  createNewComment(data[i].bcContent, data[i].bcNo);
   				  while (comments.firstChild) {
   					     comments.removeChild(comments.firstChild);
   				 }
   				  displayComments(listOfComments, 0);
   			  };
   		  }
   	});
   });
    

   /* 댓글만들기 스크립트 끝! */
    
    </script>
    
    
    <c:import url="../common/footer.jsp"/>
    
</body>
</html>
