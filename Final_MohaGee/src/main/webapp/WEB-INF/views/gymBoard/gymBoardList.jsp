<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title style="font-family:cookierun;">HOWL's MOHAGEE</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:import url="../common/commonUtil.jsp" />

<script>
   function gymBoardInsert(){
      location.href = "JQ{ pageContext.request.contextPath}/gymBoard/gymBoardInsertForm.do";
   }
   
   JQ(function(){
      
      JQ("").on("click", function(){
         
         var bNo = JQ(this).attr("id");
         console.log("bNo = " + bNo);
         location.href = "JQ{pageContext.request.contextPath}/gymBoard/gymBoardDetail.do?no=" + bNo;
      });
      
   });
   
   
</script>

</head>
<body>
   <c:import url="../common/header.jsp" />

   <section id="page-breadcrumb">
      <div class="vertical-center sun">
         <div class="container">
            <div class="row">
               <div class="action">
                  <div class="col-sm-12">
                     <h1 class="title" style="font-family:cookierun;">HOWL's GYM BOARD</h1>
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
         <a href="${ pageContext.request.contextPath }/gymBoard/gymBoardInsertForm.do">
            <button type="button" class="btn btn-success" id="writerBtn" style="font-family:cookierun;">글쓰기</button>
         </a>
      </c:if>
   </div>
      
      <!-- 태그 리스트  -->
      <div class="row">
            <ul class="masonery-filter text-center">
               <li><a class="btn btn-default active" href="#" data-filter="*" style="font-family:cookierun;">All</a></li>
               <li><a class="btn btn-default" href="#" data-filter=".big" style="font-family:cookierun;">헬스</a></li>
               <li><a class="btn btn-default" href="#" data-filter=".small" style="font-family:cookierun;">요가</a></li>
               <li><a class="btn btn-default" href="#" data-filter=".creative" style="font-family:cookierun;">수영</a></li>
               <li><a class="btn btn-default" href="#" data-filter=".original" style="font-family:cookierun;">클라이밍</a></li>
            </ul>
            


         <!--  글 목록  -->      
         <div class="masonery-items masonery_area">
            <c:forEach var="gymBoard" items="${list}">
         
            <!--  글 리스트 1 -->
               <div class="col-md-3 col-sm-4 masonery-item branded mobile big">
                  <div class="single-blog two-column">
                  
                  <!-- 사진파일 -->
                  <c:if test="${ fn:trim(gymBoard.bFileType)  == 'I'}">
                     <div class="post-thumb">
                        <a href="${pageContext.request.contextPath }/gymBoardDetail.do?bNo=${gymBoard.bNo}">
                           <img src="${pageContext.request.contextPath }/resources/gymUpload/${gymBoard.titleFilename}"
                                 class="img-responsive" alt=""></a>                  
                     </div>
                     </c:if>
                     <!-- 태그  -->
                     <div class="post-content overflow">
                        <ul class="nav nav-justified post-nav">
                           <li><a href="#" style="font-family:cookierun;"><i class="fa fa-tag"></i>&nbsp;&nbsp;${gymBoard.bTag}</a></li>
                        </ul>
                        
                        <!--  제목 -->
                        <h2 class="post-title bold">
                           <a href="${ pageContext.request.contextPath }/gymBoardDetail.do?bNo=${gymBoard.bNo}"
                           style="font-family:cookierun;">${ gymBoard.bTitle }</a>
                        </h2>

                        <div class="post-bottom overflow">
                           <ul class="nav nav-justified post-nav">
                              <li><a href="#" style="font-family:cookierun;"><i class="fa fa-heart" ></i>&nbsp;&nbsp;20</a></li>
                              
                              <li><a href="#" style="font-family:cookierun;"><i class="fa fa-comments"></i>&nbsp;&nbsp;30</a></li>
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
   <c:import url="../common/footer.jsp" />
</body>
</html>