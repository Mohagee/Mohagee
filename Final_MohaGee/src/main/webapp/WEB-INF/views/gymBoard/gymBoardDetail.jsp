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
    <title style="font-family:cookierun;">HOWL's MOHAGEE</title>
    
    <c:import url="../common/commonUtil.jsp"/>
    
    
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
    
    
</head><!--/head-->

<body>
   
   <c:import url="../common/header.jsp"/>

    <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title" style="font-family:cookierun;">HOWL's</h1>
                        </div>                                                                                
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#page-breadcrumb-->

    <section id="blog-details">
    
    
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-7">
                    <div class="row">
  
                    <!--  게시글  -->
                         <div class="col-md-12 col-sm-12">
                            <div class="single-blog blog-details two-column">
                            <h2 class="post-title bold"><a href="#" style="font-family:cookierun; font-size:30px;">${gymBoard.bTitle } <br/><br/></a></h2>
                            
                   <c:forEach var="GymAttachment" items="${GymAttachmentList}">
                         
                            <!--  게시글 상세보기 영역 -->
                                <div class="post-thumb">
                                    <!-- <a href="#"> -->
                                    <img src="${ pageContext.request.contextPath }/resources/upload/${GymAttachment.bFileName}" class="img-responsive" alt="">
                                    <!-- </a> -->
                                   
                                </div>
                                <hr />
                      </c:forEach>
                             
                                <div class="post-content overflow">
                                    <p style="font-family:cookierun; font-size:30px;">
                                    	${gymBoard.bContent }
                                    </p>
					<br />
                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalVM"><i class="fas fa-caret-square-right"></i>&nbsp;&nbsp; PlayVedio</button>
                                    <div class="post-bottom overflow">
                                        <ul class="nav navbar-nav post-nav">
                                            <li><a href="#"><i class="far fa-clock" style="font-family:cookierun;"></i>&nbsp;&nbsp;${gymBoard.bDate}</a></li>
                                            <li><a href="#"><i class="fa fa-tag" style="font-family:cookierun;"></i>&nbsp;&nbsp;${gymBoard.bTag}</a></li>
                                            <li><a href="#"><i class="fa fa-heart" style="font-family:cookierun;"></i>&nbsp;&nbsp;좋아요 숫자</a></li>
                                            <li><a href="#"><i class="fa fa-comments" style="font-family:cookierun;"></i>&nbsp;&nbsp;댓글 숫자</a></li>
                                        </ul>
                                    </div>
                                <!-- 게시글 수정 버튼  -->
				<div>
					<a href="${ pageContext.request.contextPath }/gymBoard/gymBoardList.do">
					   <button type="button" class="btn btn-warning" id="rewriteBtn">목록으로</button>
					</a>&nbsp;                           
					<a href="${ pageContext.request.contextPath }/gymBoard/gymBoardUpdateView.do?bNo=${gymBoard.bNo}">
					   <button type="button" class="btn btn-primary" id="rewriteBtn">수정하기</button>
					</a>&nbsp;
					<a href="${ pageContext.request.contextPath }/gymBoard/gymBoardDelete.do?bNo=${gymBoard.bNo}">
					   <button type="button" class="btn btn-danger" id="deleteBtn">삭제하기</button>
					</a>
				 </div><br />
                               </div>
                               
                               
                               
                                    <div class="blog-share">
                                    
                                        <span class='st_facebook_hcount'></span>
                                        <span class='st_twitter_hcount'></span>
                                        <span class='st_linkedin_hcount'></span>
                                        <span class='st_pinterest_hcount'></span>
                                        <span class='st_email_hcount'></span>
                                      
                                    </div>
                                    
                                    <div class="author-profile padding">
                 <div class="row">
                     <div class="col-sm-2">
                         <img src="${ pageContext.request.contextPath }/resources/profile/${gymBoard.pRenamedFileName}">
                    </div>
                    <div class="col-sm-10" style="font-family:binggrae;">
                        <h3 style="font-family:binggrae;">${ gymBoard.nickName }</h3>
                        <p>${ gymBoard.introduce }</p>
                    </div>
                </div>
            </div>
                                    
                                    <div align="right" >
					<a href=""><button type="button" class="btn btn-success" id="reply" data-toggle="modal" data-target="layerpop">댓글달기</button></a>   
			    	    </div> <br />  
                           
<!--  =================댓글 시작 =================================-->                                    
<div class="footer">
  <a href="#"></a> 
  <div class="row">
    <div class="write-comment">
      <input type="text" name="bcContent" id="bcContent" placeholder="댓글을 입력하세요.">
      <button type="button" id="addReply" onclick="insertConmment();"><i class="fas fa-feather-alt"></i></button>
 </div>
  </div>
</div>




                                    <!--  댓글 부분  -->
                                    <div class="response-area">                         
                                        <!-- 댓글창 시작 -->
                                            <div class="post-comment">
                                                <a class="pull-left" href="#">
                                                    <img class="media-object" src="${ pageContext.request.contextPath }/resources/images/blogdetails/2.png" alt="">
                                                </a>
                                                <div class="media-body">
                                                    <span><i class="fa fa-user"></i>댓글 작성자 <a href="#">댓글 작성일</a></span>                                                   
                                                    <p>댓글 내용3333</p>                                                  
                                                       <div align="right">
                                                       <a href=""><button type="button" class="btn btn-primary" id="rewriteBtn">수정</button></a>                           
                                                       <a href=""><button type="button" class="btn btn-danger" id="deleteBtn">삭제</button></a>                                     
                                                       <a href=""><button type="button" class="btn btn-success" id="reply">댓글</button></a>                                    
                                                        </div>                                                   
                                                </div>
                                            </div>                  
                                  </div>
                                  <!--/Response-area-->

                                </div>
                            </div>
                        </div>
                    </div>
                 </div>
            </div>





</section>

<!-- 댓글 스크립트 시작 -->


  <script>
	$('#ccontent').keyup(function(e) {
		console.log(e.key);
		if(e.key == 'Enter'){
			insertConmment();
		}
	});
	
	function insertConmment(){
        var contentt = $('#ccontent').val().trim();
        var talkno = Number($('#talkno').val().trim());
        var userno = Number($('#userno').val());
        
        if(contentt.length == 0) {
        	alert("내용을 입력하세요.");
        	return;
        	
        } else {
	        $.ajax({
	            url  : "${pageContext.request.contextPath}/talk/talkCommentInsertSelect.do",
	            data : {talkno: talkno , userno : '${member.userNo}' , ccontent : contentt},
	            dataType: "json",
	            success : function(data){
								// data : List<TalkComment>
        				var contentt = $('#ccontent').val('');
						$('.footer').find('.replySelectArea').remove();
						
	            		
	            

	            		for ( var tt in data) {
	            		var $replySelectArea = $('<div>').addClass('replySelectArea');
	            		
	            		var $table = $('<table>').addClass('replySelectTable replyList');
	            		
	            		var $tr1 = $('<tr>');
	            		var $tr2 = $('<tr>').addClass('search');
	            		
	            		var $td1 = $('<td>').attr("rowspan","2");
	            		var $td2 = $('<td>').append(  $('<b>').text(data[tt].nickname)  );
	            		var $td3 = $('<td>').text(new Date(data[tt].cdate).format('yyyy-MM-dd a/p hh:mm:ss'));
	            		var $td4 = $('<td>').attr("align","right");

	            		var $input = $('<input>').attr("type","hidden").attr("name","cno").val(data[tt].commentno);
	            		var $button1 = $('<button>').attr("type", "button").addClass("updateBtn").attr("onclick", "updateReply(this);").text("수정하기");
	            		var $button2 = $('<button>').attr("type", "button").addClass("updateConfirm").attr("onclick", "updateConfirm(this);").css("display","none").text("수정완료");
	            		var $button3 = $('<button>').attr("type", "button").addClass("deleteBtn").attr("onclick", "deleteReply(this);").text("삭제하기");
	            		
	            		var $td5 = $('<td>').attr("colspan","3").css("background", "transparent")
	            		var $textarea = $('<textarea>').addClass("reply-content").attr('cols','71%').attr('rows','3').attr('readonly','readonly').text(data[tt].ccontent);
	            		
	            		$replySelectArea.append($table);
	            		$table.append($tr1).append($tr2);
	            		$tr1.append($td1).append($td2).append($td3).append($td4);
	            		$td4.append($input).append($button1).append($button2).append('&nbsp;&nbsp;').append($button3);
	            		
	            		$tr2.append($td5)
	            		$td5.append($textarea);
	            		
	            		$('.footer').append($replySelectArea);
	            		
	            		}
	            		
	            		cilckEvent();
	            }, error : function(jqxhr, textStatus, errorThrown){
	                console.log("ajax 처리 실패");
	                //에러로그
	                console.log(jqxhr);
	                console.log(textStatus);
	                console.log(errorThrown);
	            }
        	});
     	}
	}
	// 댓글 수정하는 AJAX
	function updateReply(obj) {
		// updateReply(this) → $(obj)
		// 수정하기 -> 수정완료 버튼수정
		$(obj).parent().parent().parent().find("textarea").attr("readonly", false);
		$(obj).css("display", 'none');
		$(obj).next().css("display", 'inline-block');
		
	}
	// 수정을 완료 실행
	function updateConfirm(obj){
		var contentt = $(obj).parent().parent().parent().find("textarea").val().trim();
		var commentno = Number($(obj).parent().find("input").val().trim());
        var talkno = Number($('#talkno').val().trim());
        // var userno = Number($('#userno').val());
        
        if(contentt.length == 0) {
        	alert("내용을 입력하세요.");
        	return;
        	
        } else {
	        $.ajax({
	            url  : "${pageContext.request.contextPath}/talk/talkCommentUpdateSelect.do",
	            data : {commentno : commentno , talkno: talkno , ccontent : contentt},
	            dataType: "json",
	            success : function(data){
								// data : List<TalkComment>
        				var contentt = $('#ccontent').val('');
						$('.footer').find('.replySelectArea').remove();


	            		for ( var tt in data) {
	            		var $replySelectArea = $('<div>').addClass('replySelectArea');
	            		
	            		var $table = $('<table>').addClass('replySelectTable replyList');
	            		
	            		var $tr1 = $('<tr>');
	            		var $tr2 = $('<tr>').addClass('search');
	            		
	            		var $td1 = $('<td>').attr("rowspan","2");
	            		var $td2 = $('<td>').append(  $('<b>').text(data[tt].nickname)  );
	            		var $td3 = $('<td>').text(new Date(data[tt].cdate).format('yyyy-MM-dd a/p hh:mm:ss'));
	            		var $td4 = $('<td>').attr("align","right");

	            		var $input = $('<input>').attr("type","hidden").attr("name","cno").val(data[tt].commentno);
	            		var $button1 = $('<button>').attr("type", "button").addClass("updateBtn").attr("onclick", "updateReply(this);").text("수정하기");
	            		var $button2 = $('<button>').attr("type", "button").addClass("updateConfirm").attr("onclick", "updateConfirm(this);").css("display","none").text("수정완료");
	            		var $button3 = $('<button>').attr("type", "button").addClass("deleteBtn").attr("onclick", "deleteReply(this);").text("삭제하기");
	            		
	            		var $td5 = $('<td>').attr("colspan","3").css("background", "transparent")
	            		var $textarea = $('<textarea>').addClass("reply-content").attr('cols','71%').attr('rows','3').attr('readonly','readonly').text(data[tt].ccontent);
	            		
	            		$replySelectArea.append($table);
	            		$table.append($tr1).append($tr2);
	            		$tr1.append($td1).append($td2).append($td3).append($td4);
	            		$td4.append($input).append($button1).append($button2).append('&nbsp;&nbsp;').append($button3);
	            		
	            		$tr2.append($td5)
	            		$td5.append($textarea);
	            		
	            		$('.footer').append($replySelectArea);
	            		
	            		}
	            		
	            		cilckEvent();
	            }, error : function(jqxhr, textStatus, errorThrown){
	                console.log("ajax 처리 실패");
	                //에러로그
	                console.log(jqxhr);
	                console.log(textStatus);
	                console.log(errorThrown);
	            }
        	});
     	}
	}
	function deleteReply(obj){
        var talkno = Number($('#talkno').val().trim());
		var commentno = Number($(obj).parent().find("input").val().trim());
        // var userno = Number($('#userno').val());
        
        if(confirm("정말 삭제하시겠습니까?") == true){
	        $.ajax({
	            url  : "${pageContext.request.contextPath}/talk/talkCommentDeleteSelect.do",
	            data : {commentno : commentno, talkno : talkno},
	            dataType: "json",
	            success : function(data){
								// data : List<TalkComment>
        				var contentt = $('#ccontent').val('');
						$('.footer').find('.replySelectArea').remove();


	            		for ( var tt in data) {
	            		var $replySelectArea = $('<div>').addClass('replySelectArea');
	            		
	            		var $table = $('<table>').addClass('replySelectTable replyList');
	            		
	            		var $tr1 = $('<tr>');
	            		var $tr2 = $('<tr>').addClass('search');
	            		
	            		var $td1 = $('<td>').attr("rowspan","2");
	            		var $td2 = $('<td>').append(  $('<b>').text(data[tt].nickname)  );
	            		var $td3 = $('<td>').text(new Date(data[tt].cdate).format('yyyy-MM-dd a/p hh:mm:ss'));
	            		var $td4 = $('<td>').attr("align","right");

	            		var $input = $('<input>').attr("type","hidden").attr("name","cno").val(data[tt].commentno);
	            		var $button1 = $('<button>').attr("type", "button").addClass("updateBtn").attr("onclick", "updateReply(this);").text("수정하기");
	            		var $button2 = $('<button>').attr("type", "button").addClass("updateConfirm").attr("onclick", "updateConfirm(this);").css("display","none").text("수정완료");
	            		var $button3 = $('<button>').attr("type", "button").addClass("deleteBtn").attr("onclick", "deleteReply(this);").text("삭제하기");
	            		
	            		var $td5 = $('<td>').attr("colspan","3").css("background", "transparent")
	            		var $textarea = $('<textarea>').addClass("reply-content").attr('cols','71%').attr('rows','3').attr('readonly','readonly').text(data[tt].ccontent);
	            		
	            		$replySelectArea.append($table);
	            		$table.append($tr1).append($tr2);
	            		$tr1.append($td1).append($td2).append($td3).append($td4);
	            		$td4.append($input).append($button1).append($button2).append('&nbsp;&nbsp;').append($button3);
	            		
	            		$tr2.append($td5)
	            		$td5.append($textarea);
	            		
	            		$('.footer').append($replySelectArea);
	            		
	            		}
	            		
	            		cilckEvent();
	            }, error : function(jqxhr, textStatus, errorThrown){
	                console.log("ajax 처리 실패");
	                //에러로그
	                console.log(jqxhr);
	                console.log(textStatus);
	                console.log(errorThrown);
	            }
        	});
     	}
	}
	
	Date.prototype.format = function (f) {

	    if (!this.valueOf()) return " ";



	    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];

	    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];

	    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

	    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

	    var d = this;



	    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {

	        switch ($1) {

	            case "yyyy": return d.getFullYear(); // 년 (4자리)

	            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)

	            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)

	            case "dd": return d.getDate().zf(2); // 일 (2자리)

	            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)

	            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)

	            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)

	            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)

	            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)

	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)

	            case "mm": return d.getMinutes().zf(2); // 분 (2자리)

	            case "ss": return d.getSeconds().zf(2); // 초 (2자리)

	            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분

	            default: return $1;

	        }

	    });

	};



	String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };

	String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };

	Number.prototype.zf = function (len) { return this.toString().zf(len); };
	
	</script>


<!-- 댓글 스크립트 끝 -->



<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">Header</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
            Body
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        Footer
        <button type="button" class="btn btn-primary" data-dismiss="modal">등록</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>



<!-- ===========동영상 모달 시작 ===========-->
<!--Modal: modalVM-->
<div class="modal fade" id="modalVM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Body-->
      <div class="modal-body mb-0 p-0">
        <div class="embed-responsive embed-responsive-16by9 z-depth-1-half">
          ${gymBoard.bUrl }
        </div>
      </div>
      <!--Footer-->
      <div class="modal-footer justify-content-center flex-column flex-md-row">
        <span class="mr-4">공유해보라우!</span>
                                    <div class="blog-share">                                    
                                        <span class='st_facebook_hcount'></span>
                                        <span class='st_twitter_hcount'></span>
                                        <span class='st_linkedin_hcount'></span>
                                        <span class='st_pinterest_hcount'></span>
                                        <span class='st_email_hcount'></span>                                   
                                    </div>
        <button type="button" class="btn btn-outline-primary btn-rounded btn-md ml-4"
          data-dismiss="modal">Close</button>
      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
<!--Modal: modalVM-->    
<!-- ===========동영상 모달 끝 ===========-->    
    

    
    
    <c:import url="../common/footer.jsp"/>
</body>
</html>