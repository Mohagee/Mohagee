﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
      
      #board_img{
         
         background : rgb(8, 187, 104);
      
      }
      
      #board_video{
         
         background : rgb(223, 67, 152);
      
      }
      
      #board_audio{
         
         background : rgb(8, 143, 233);
      
      }
      
      
      .filebox label { 
            display: inline-block; 
            padding: .5em .75em; 
            color: white; 
            font-size: inherit; 
            line-height: normal; 
            vertical-align: middle; 
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
                            <h1 class="title" style="font-family:cookierun;">게시글 수정</h1>       
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>

   <section>
      <div class="mb-2" align="center">
         <form id="updateTravelBoard" action="${ pageContext.request.contextPath }/travelBoard/travelBoardUpdate.do"
                 method="post" enctype="multipart/form-data">
            <input type="hidden" name="userNo" value="${member.userNo}" />
            <input type="hidden" name="bNo" value="${TravelBoard.bNo}" />     

    <!-- 카테고리선택 칸 -->
      <select id = "bCategory" name="bCategory" class="input-group mb-3" style="width:900px; border:1px solid lightblue;" required>
         <option value="" disabled selected >카테고리를 선택해주세요 (필수!)</option>
         <option value="korea" >국내</option>
         <option value="asia" >아시아</option>
         <option value="america" >아메리카</option>
         <option value="europe" >유럽</option>
         <option value="oceania" >오세아니아</option>
         <option value="africa" >아프리카</option>
      </select>

            <!-- 제목 입력 칸 -->
            <div class="input-group mb-3" style="width: 900px"><br /> 
               <input type="text" class="form-control" aria-label="Text input with dropdown button" id="title"
                                                   name="bTitle" placeholder="제목 입력" value="${TravelBoard.bTitle}" >
            </div>

            <!-- 태그 입력 칸 -->
            <div class="input-group mb-3" style="width: 900px;"><br /> 
               <input type="text" class="form-control" aria-label="Text input with dropdown button" id="tag" name="bTag"
                                                               placeholder="태그입력 ex) # 엘리스, #하울" value="${TravelBoard.bTag}">
            </div>
            
            <!-- URL 입력 칸 -->
            <div class="input-group mb-3" style="width: 900px;"><br /> 
               <input type="url" class="form-control" aria-label="Text input with dropdown button" id="bUrl" name="bUrl"
                                                            placeholder="link입력 ex) www.naver.com" value="${TravelBoard.bUrl}">
            </div><br />

            <div style="margin-bottom: 3px;">
               <div class="filebox">
                  <label id="board_img" for="ex_file"> <i class="fas fa-image"></i>&nbsp;&nbsp;&nbsp;사진올리기
                  </label> <input type="file" id="ex_file" name="upFile" multiple>&nbsp;&nbsp;

                  <label id="board_video" for="ex_file"> <i class="fas fa-video"></i>&nbsp;&nbsp;&nbsp;영상올리기
                  </label> <input type="file" id="ex_file" name="upFile">&nbsp;&nbsp;

                  <label id="board_audio" for="ex_file"> <i class="fas fa-headphones"></i>&nbsp;&nbsp;&nbsp;음악올리기
                  </label> <input type="file" id="ex_file" name="upFile">&nbsp;&nbsp;
               </div>
            </div>

            <!-- 내용 입력칸 -->
            <div class="editorArea" style="margin-top: 5px;">
               <textarea id="summernote" name="bContent"
                  required placeholder="글 내용" maxlength="1000" rows="7">${TravelBoard.bContent}</textarea>
               <span class="help-block"><p id="characterLeft" class="help-block ">더 이상 작성할 수 없습니다.</p></span>
            </div>

            <div align="center">
               <button type="submit" class="btn btn-danger" id="btnSubmit">수정완료</button>
         
            <input type="button" class="btn btn-warning" value="삭제하기" 
               onclick="location.href='${pageContext.request.contextPath}/travelBoard/travelBoardDelete.do?bNo=${TravelBoard.bNo}'"/>
               
             </div>
             <br />
             
         </form>
      </div>
   </section>
   <br>
   <br>
   <br>
   <br>
   <br>

   <c:import url="../common/footer.jsp" />

    <!-- 최대글 작성 한도 스크립트 구현해야함@ -->
<script>
   $(document).ready(function() {
      $('#characterLeft').text('1000 자 작성가능');
      $('#summernote').keydown(function() {
         var max = 1000;
         var len = $(this).val().length;
         if (len >= max) {
            $('#characterLeft').text('더 이상 작성할 수 없습니다.');
            $('#characterLeft').addClass('red');
            $('#btnSubmit').addClass('disabled');
         } else {
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