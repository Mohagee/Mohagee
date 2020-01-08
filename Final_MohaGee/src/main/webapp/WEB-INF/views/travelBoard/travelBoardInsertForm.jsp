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
             margin-top:20px; 
             width:900px; 
             height:500px; 
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
                             <h1 class="title" style="font-family:cookierun;">EDITOR Alice's Show Board </h1>      
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#action-->

<section>
 <div align="center" >
    <div id="yu" class="site-blocks-cover overlay aos-init aos-animate" style="background-image: url('../../resources/img/파비콘.png');">
    </div>
   </div>
<div class="mb-2" align="center">
   <form id="insertshowBoardForm"  action="${ pageContext.request.contextPath }/showBoard/showBoardInsert.do"  
         method="post" >
      
      <!-- 제목 입력 칸 -->
      <div class="input-group mb-3" style="width:900px;">
         <br />
              <input type="text" class="form-control" aria-label="Text input with dropdown button" 
              id = "title" name="title" placeholder="제목 입력">
      </div>
      
      <!-- 태그 입력 칸 -->
      <div class="input-group mb-3" style="width:900px;">
         <br />
              <input type="text" class="form-control" aria-label="Text input with dropdown button" 
              id = "tag" name="tag" placeholder="태그입력 ex) # 엘리스, #하울">
      </div>
      
      <!-- 태그 입력 칸 -->
      <div class="input-group mb-3" style="width:900px;">
         <br />
              <input type="text" class="form-control" aria-label="Text input with dropdown button" 
              id = "tag" name="tag" placeholder="태그입력 ex) #앨리스, #하울  #">
      </div>      

   <!-- 내용 입력칸 -->
      <div class="editorArea" >
              <textarea id="summernote" name="bContent" placeholder="글 내용" maxlength="1000" rows="7"></textarea>
             <!-- <span class="help-block"> -->
              <p id="characterLeft" class="help-block ">더 이상 작성할 수 없습니다.</p>
               <!-- </span> --> 
      </div>
            
      <input type="hidden" name="userNo"  value="${member.userNo}"/>

<div align="center">
<button type="reset" class="btn btn-denger" onclick="cancelbtn();">취소</button>
<button type="submit" class="btn btn-primary" onclick="insertbtn();">확인</button>
</div>
</form>
            
</div>
</section>
<br ><br ><br ><br ><br >


<script>
$(document).ready(function(){
   
      $('#summernote').summernote({
          placeholder: '내용을 입력하세요.',
          tabsize: 2,
          height: 500,
          width: 900,
          focus: true,
          callbacks: {
             onImageUpload: function(files, editor, welEditable) {
                   for (var i = files.length - 1; i >= 0; i--) {
                      sendFile(files[i], this);
                   }
               }
          }
       });
      });
         
        $('.dropdown-toggle').dropdown()
 
 function sendFile(file, el) {
    
 var form_data = new FormData();
  form_data.append('file', file);
  // console.log(form_data.file);

  
  $.ajax({
       data: form_data,
       type: "post",
       url: '/showBoard/showBoardInsert.do',
    cache : false,
    contentType : false,
       enctype: 'multipart/form-data',
    processData : false,
       success: function(url) {
          console.log('----------------------------');
          console.log(url);
          console.log('----------------------------');
          url.replace("\/","/");
         $(el).summernote('editor.insertImage', url);
       }, error: function(){
          console.log("실패실패");
       }
  });
}
 
  function insertbtn(){
      if($('#title').val() == ""){
         alert("제목을 입력하세요.");
         $('#title').focus();
      } else if($('#summernote').val() == ""){
         alert("내용을 입력해 주세요.");
         $('#summernote').focus();
      } else {
         $('#insertForm').submit();
      }
      event.preventDefault();   
      
   }
   
   function cancelbtn(){
      var answer = confirm("게시글 작성을 취소하시겠습니까?");
      
      if(answer == true){
         location.href = "${pageContext.request.contextPath}/showBoard/showBoardList.do";
        } 
   }
   
 
</script> <!-- 최대글 작성 한도 스크립트 구현해야함@ -->
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


<script>
$(document).ready(function(){
   
      $('#editorArea').summernote({
          placeholder: '내용을 입력하세요.',
          tabsize: 2,
          height: 500,
          width: 900,
          focus: true,
          callbacks: {
             onImageUpload: function(files, editor, welEditable) {
                   for (var i = files.length - 1; i >= 0; i--) {
                      sendFile(files[i], this);
                   }
               }
          }
       });
      });
         
        $('.dropdown-toggle').dropdown()
 
 function sendFile(file, el) {
    
 var form_data = new FormData();
  form_data.append('file', file);
  // console.log(form_data.file);

  
  $.ajax({
       data: form_data,
       type: "post",
       url: '/sc/insert.tn',
    cache : false,
    contentType : false,
       enctype: 'multipart/form-data',
    processData : false,
       success: function(url) {
          console.log('----------------------------');
          console.log(url);
          console.log('----------------------------');
          url.replace("\/","/");
         $(el).summernote('editor.insertImage', url);
       }, error: function(){
          console.log("실패실패");
       }
  });
}
 
  function insertbtn(){
      if($('#title').val() == ""){
         alert("제목을 입력하세요.");
         $('#title').focus();
      } else if($('#summernote').val() == ""){
         alert("내용을 입력해 주세요.");
         $('#summernote').focus();
      } else {
         $('#insertForm').submit();
      }
      event.preventDefault();   
      
   }
   
   function cancelbtn(){
      var answer = confirm("게시글 작성을 취소하시겠습니까?");
      
      if(answer == true){
         location.href = "${pageContext.request.contextPath}/showBoard/selectList.no";
        } 
   }
   
 
</script>




    <c:import url="../common/footer.jsp"/>
</body>
</html>