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
</head>
<body>   
   <c:import url="../common/header.jsp"/>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

    <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">글작성 부분</h1>       
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#action-->


<section>
 <div align="center" >
    <div id="yu" class="site-blocks-cover overlay aos-init aos-animate" 
                      style="background-image: url('../../resources/img/파비콘.png');">
    </div>
   </div>
<div class="mb-2" align="center">
<form id="insertForm" action="${ pageContext.request.contextPath }/travelBoard/travelBoardInsertEnd.do"  method="post"  >
      <div class="input-group mb-3" style="width:900px;">
         <br />
              <input type="text" class="form-control" aria-label="Text input with dropdown button" 
              name="bTitle" placeholder="제목을 입력하세요.">
      </div>

      <div class="editorArea"  style="margin-top:20px;">
              <textarea id="summernote" name="nContent"></textarea>
      </div>
      <input type="hidden" name="userNo"  value="${member.nickName}"/>
<br />
<div align="center">
<button type="reset" class="btn btn-danger" onclick="cancelbtn();">취소</button>
<button type="submit" class="btn btn-info" onclick="insertbtn();">확인</button>
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
       url: '/travelBoard/travelBoardInsert.do',
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
         location.href = "${pageContext.request.contextPath}/travelBoard/travelBoardList.do";
        } 
   }
   
 
</script>


    <c:import url="../common/footer.jsp"/>
</body>
</html>