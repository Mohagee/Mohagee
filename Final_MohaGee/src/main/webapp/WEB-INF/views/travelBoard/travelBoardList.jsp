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

<script>

	$("input").tagsinput('items');

   function travelBoardInsert(){
      location.href = "JQ{ pageContext.request.contextPath}/travelBoard/travelBoardInsertForm.do";
   }
</script>
<style>
	.bootstrap-tagsinput input{
		display: none;
	}
	
	span[data-role = remove]{
		display: none;
	}
	
	.bootstrap-tagsinput{
		display: initial;
		border: none;
		box-shadow: none;
	}
	.label{
		font-size: 85%;
	}
</style>

</head>
<body>
   <c:import url="../common/header.jsp" />

   <section id="page-breadcrumb">
      <div class="vertical-center sun">
         <div class="container">
            <div class="row">
               <div class="action">
                  <div class="col-sm-12">
                     <h1 class="title">어딜 가볼까?</h1>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--/#action-->


<!-- 글 목록 폼 시작 -->
<section id="portfolio" class="padding-top padding-bottom">
   <div class="container">
   
   <!--  글쓰기 버튼  -->
   <div align="right">
      <c:if test="${ !empty member}">
         <a href="${ pageContext.request.contextPath }/travelBoard/travelBoardInsertForm.do">
            <button type="button" class="btn btn-success" id="writerBtn">글쓰기</button>
         </a>
      </c:if>
   </div>
      
      <!-- 태그 리스트  -->
      <div class="row">
            <ul class="masonery-filter text-center">
               <li><a class="btn btn-default active" href="#" data-filter="*">ALL</a></li>
               <li><a class="btn btn-default" href="#" data-filter=".korea">국내</a></li>
               <li><a class="btn btn-default" href="#" data-filter=".asia">아시아</a></li>
               <li><a class="btn btn-default" href="#" data-filter=".america">아메리카</a></li>
               <li><a class="btn btn-default" href="#" data-filter=".europe">유럽</a></li>
               <li><a class="btn btn-default" href="#" data-filter=".oceania">오세아니아</a></li>
               <li><a class="btn btn-default" href="#" data-filter=".africa">아프리카</a></li>
            </ul>
            


         <!--  글 목록  -->      
         <div class="masonery-items masonery_area">
         
         
            <c:forEach var="travelBoard" items="${list}">
            
         
            <!--  글 리스트 1 -->
               <div class="col-md-3 col-sm-4 masonery-item branded mobile ${travelBoard.bCategory}">
                  <div class="single-blog two-column">
                  
                  <!-- 사진파일 -->
                  <c:if test="${ fn:trim(travelBoard.bFileType)  == 'I'}">
                     <div class="post-thumb">
                        <a href="${ pageContext.request.contextPath }/travelBoard/travelBoardDetail.do?bNo=${travelBoard.bNo}">
                           <img src="${ pageContext.request.contextPath }/resources/upload/${travelBoard.titleFilename}" class="img-responsive"></a>                  
                     </div>
                     </c:if>
                     
                     <!-- 태그  -->
                     <div class="post-content overflow">                        
                        <!--  제목 -->
                        <h2 class="post-title bold">
                           <a href="${ pageContext.request.contextPath }/travelBoard/travelBoardDetail.do?bNo=${travelBoard.bNo}">${ travelBoard.bTitle }</a>
                        </h2>

                        <div class="post-bottom overflow">
                           <ul class="nav nav-justified post-nav">	
		                      <li id="favorite" style="color: #0099AE"><i class="fas fa-heart"></i>&nbsp;&nbsp;${ travelBoard.favoriteCount }</li>
		                                  
		                      <li style="color: #0099AE"><i class="fas fa-comments"></i>&nbsp;&nbsp;댓글 숫자</li>
							</ul>
							<div class="post-content overflow">   
				               <i style="color: #0099AE" class="fas fa-tags"></i>&nbsp;&nbsp;
				               <input style="color: #0099AE" type="text" data-role="tagsinput" value="${ travelBoard.bTag }"/>
				            </div>
                        </div>
                     </div>
                  </div>
               </div>
               
               
               
            </c:forEach>
            
            
            
            </div>            
            
         </div>
      </div>

   </section>
   <c:import url="../common/footer.jsp" />
</body>
</html>