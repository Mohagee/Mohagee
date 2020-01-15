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
   <style>
      #summernote{
         margin-top:1px; 
         width:900px; 
         height:500px; 
      }
      #input-group mb-3{
         
      }
      
      .filebox label { 
            display: inline-block; 
            padding: .5em .75em; 
            color: #999; 
            font-size: inherit; 
            line-height: normal; 
            vertical-align: middle; 
            background-color: blue; 
            cursor: pointer; 
            border: 1px solid #ebebeb; 
            border-bottom-color: #e2e2e2; 
            border-radius: .25em; 
         }
       .filebox input[type="file"] {
              position: absolute; 
              width: 1px; 
              height: 1px; 
              padding: 0; 
              margin: -1px; 
              overflow: hidden; 
              clip:rect(0,0,0,0); 
              border: 0; 
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
                            <h1 class="title" style="font-family:cookierun;"> TALK BOARD </h1>       
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>

<section>
<div class="mb-2" align="center">
   <form id="insertForm" 
         action="${ pageContext.request.contextPath }/showBoard/showBoardInsertEnd.do"  
         method="post" enctype="multipart/form-data">
      <input type="hidden" name="userNo"  value="${member.userNo}"/>
      
      <!-- 제목 입력 칸 -->
      <div class="input-group mb-3" style="width:900px" >
         <br />
              <input type="text" class="form-control" aria-label="Text input with dropdown button" 
              id = "title" name="bTitle" placeholder="제목 입력">
      </div>
      
      <!-- 태그 입력 칸 -->
      <div class="input-group mb-3" style="width:900px;">
         <br />
              <input type="text" class="form-control" aria-label="Text input with dropdown button" 
              id = "tag" name="bTag" placeholder="태그입력 ex) # 엘리스, #하울">
      </div>
           <!-- URL 입력 칸 -->
      <div class="input-group mb-3" style="width:900px;">
         <br />
              <input type="url" class="form-control" aria-label="Text input with dropdown button" 
              id = "bUrl" name="bUrl" placeholder="link입력 ex) www.naver.com">
      </div>
      
      <br />
      
 
   <div  style="margin-bottom:3px;">
         <div class="filebox">
            <label for="ex_file">
               <i class="fas fa-video"></i>&nbsp;&nbsp;&nbsp;영상 업로드
            </label>
            <input type="file" id="ex_file" name="">
         </div>
   </div>


<!--       <div class="form-group">
          <textarea class="form-control" type="textarea" id="tbcontent" name="tbContent" placeholder="글 내용" maxlength="1000" rows="7"></textarea>
          <span class="help-block"><p id="characterLeft" class="help-block ">더 이상 작성할 수 없습니다.</p></span>
      </div>
 -->
   <!-- 내용 입력칸 -->
      <div class="editorArea"  style="margin-top:5px;">
              <textarea id="summernote" name="bContent" placeholder="글 내용" maxlength="1000" rows="7"></textarea>
              <span class="help-block"><p id="characterLeft" class="help-block ">더 이상 작성할 수 없습니다.</p></span>
      </div>
            

<div align="center">
<button type="reset" class="btn btn-primary" onclick="cancelbtn();">취소</button>
<button type="submit" class="btn btn-primary" id="btnSubmit">확인</button>
</div>
</form>
            
</div>
</section>
<br ><br ><br ><br ><br >


<c:import url="../common/footer.jsp" />

    <!-- 최대글 작성 한도 스크립트 구현해야함@ -->
<script>
   $(document).ready(function(){
       $('#characterLeft').text('1000 자 작성가능');
       $('#summernote').keydown(function () {
           var max = 1000;
           var len = $(this).val().length;
           if (len >= max) {
               $('#characterLeft').text('더 이상 작성할 수 없습니다.');
               $('#characterLeft').addClass('red');
               $('#btnSubmit').addClass('disabled');
           }
           else {
               var ch = max - len;
               $('#characterLeft').text(ch + ' 자 작성가능');
               $('#btnSubmit').removeClass('disabled');
               $('#characterLeft').removeClass('red');
           }
       });
   });
</script>




    <c:import url="../common/footer.jsp"/>
</body>
</html>