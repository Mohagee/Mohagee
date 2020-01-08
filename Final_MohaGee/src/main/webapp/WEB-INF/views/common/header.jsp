<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- 로그인 버튼 부분 헤더 -->
   <header id="header">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 overflow">
                   <div class="social-icons pull-right">
                    <div class="text-center" style="font-family:biggrea;">
						<a href="" class="btn btn-info btn-rounded mb-4" data-toggle="modal" data-target="#modalJoinForm">
                            Join
                        </a>
                        &nbsp;&nbsp;
                        <a href="" class="btn btn-warning btn-rounded mb-4" data-toggle="modal" data-target="#modalLoginForm">
                            Login
                        </a>
                    </div>
                    </div> 
                </div>
             </div>
        </div>

<!-- Login Modal -->
<div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" style="font-family:biggrea;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form action="${ pageContext.request.contextPath }/member/memberLogin.do" method="POST" onsubmit="return login();">
      <div class="modal-header text-center" style="background-color:#f0ad4e;">
        <h4 class="modal-title w-100 font-weight-bold" style="color : snow; font-family: biggrea;">Sign In</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <!-- <span aria-hidden="true">&times;</span> -->
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
        <i class="fas fa-envelope prefix grey-text"></i>
        <label data-error="wrong" data-success="right" for="Login-defaultForm-email">ID</label>
          <input name="userId" type="email" id="Login-defaultForm-email" class="form-control validate" placeholder="example@example.com">
        </div>
        <br>
        <div class="md-form mb-4">
          <i class="fas fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="Login-defaultForm-pass">PW</label>
          <input name="password" type="password" id="Login-defaultForm-pass" class="form-control validate" placeholder="Your Password">
        </div>
      </div>
      <div class="modal-footer d-flex justify-content-center">
        <input type="submit" class="btn btn-warning btn-rounded mb-4" value="Login" >
      </div>
      </form>
    </div>
  </div>
</div>
<!-- Modal -->

<!-- Join Modal -->
<div class="modal fade" id="modalJoinForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" style="font-family:biggrea;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form action="${ pageContext.request.contextPath }/member/signUp.do" method="POST" onsubmit="return enroll();">
      <div class="modal-header text-center" style="background-color:#5bc0de;">
        <h4 class="modal-title w-100 font-weight-bold" style="color : snow;  font-family: biggrea;">Sign Up</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <!-- <span aria-hidden="true">&times;</span> -->
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
        <i class="fas fa-envelope prefix grey-text"></i>
        <label data-error="wrong" data-success="right" for="Sign-defaultForm-email">ID</label>
          <section>
	          <input style="width: 83%; display:inline;" type="email" name="userId" id="Sign-defaultForm-email" class="form-control validate" placeholder="example@example.com">
	          <button class="btn btn-success" type="button" id="checkEmail">중복확인</button>
	          <input type="hidden" id="emailSameCheck" value="0"/>
          </section>
        </div>
        
        <br>
        <div class="md-form mb-4">
          <i class="fas fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="Sign-defaultForm-pass">Password</label>
          <input type="password" name="password" id="Sign-defaultForm-pass" class="form-control validate" placeholder="영문 대소문자 6~18자리">
        </div>
        <br>
        <div class="md-form mb-4">
          <i class="fas fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="Sign-defaultForm-passCheck">Check Password</label>
          <input type="password" name="passwordCheck" id="Sign-defaultForm-passCheck" class="form-control validate" placeholder="비밀번호 확인">
		  <span class="guide ok">일치 합니다</span>
          <span class="guide error">불일치 합니다</span>
          <input type="hidden" name="passwordSameCheck" id="passwordSameCheck" value="0"/>
        </div>
        <br>
        <div class="md-form mb-4">
            <i class="fas fa-user prefix grey-text"></i>
            <label data-error="wrong" data-success="right" for="Sign-defaultForm-Name">Name</label>
            <input type="text" name="userName" id="Sign-defaultForm-Name" class="form-control validate" placeholder="한글만 적어주세요">
        </div>
        <br>
        <div class="md-form mb-4">
            <i class="fas fa-user prefix grey-text"></i>
            <label data-error="wrong" data-success="right" for="Sign-defaultForm-NickName">NickName</label>
            <section>
	            <input style="width: 83%; display:inline;" type="text" name="nickName" id="Sign-defaultForm-NickName" class="form-control validate" placeholder="NickName">
				<button id="checkNick" class="btn btn-success" type="button">중복확인</button>
				<input type="hidden" id="nickNameSameCheck" value="0"/>
          </section>
        </div>
        <br>
        <div class="md-form mb-4">
            <i class="fas fa-phone prefix grey-text"></i>
            <label data-error="wrong" data-success="right" for="Sign-defaultForm-Phone">Phone</label>
            <input type="text" name="phone" id="Sign-defaultForm-Phone" class="form-control validate" placeholder="'-' 제외한 전화번호">
        </div>

      </div>
	      <div class="modal-footer d-flex justify-content-center">
	        <input type="submit" class="btn btn-info" id="join" value="Join" >
	      </div>
      </form>
    </div>
  </div>
</div>
<!-- Modal -->

<!-- 카테고리 부분 -->
        <div class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/gotoIndex.do">
                        <h1><img src="${ pageContext.request.contextPath }/resources/images/logo.png" style="width: 208px; height: 60px;" alt="logo"></h1>
                    </a>
                    
                </div>
               <!--  <div class="collapse navbar-collapse" > -->
               <br />
                    <ul class="nav navbar-nav navbar-right" >
                        <li class="category" >
                        	<a href="${ pageContext.request.contextPath }/showBoard/showBoardList.do" 
									 style="font-family:cookierun; font-size : 20px;">공연</a>
                        </li>                                                                 
                        <li class="category">
                        	<a href="${ pageContext.request.contextPath }/gymBoardList.do"  
                        			style="font-family:cookierun; font-size : 20px;">운동</a>
                        </li>                  
                        <li class="category">
                        	<a href="${ pageContext.request.contextPath }/gotoPortfolio.do"  
                        			style="font-family:cookierun; font-size : 20px;">여행</a>
                        </li> 
                        <li class="category">
                        	<a href="${ pageContext.request.contextPath }/gotoPortfolio.do"
                        			 style="font-family:cookierun; font-size : 20px;">수다방</a>
                        </li>
                        <li class="category">
                        	<a href="${ pageContext.request.contextPath }/gotoPortfolio.do"
                        			 style="font-family:cookierun; font-size : 20px;">공지사항</a>
                        </li>
                    </ul>
            </div>
        </div>
        <script>
        
	        JQ("#checkEmail").on("click", function(){
	        	
	        	var email = JQ("#Sign-defaultForm-email").val();
	        	var reg = /^[a-z][a-z0-9_-]{3,11}@([a-z\d\.-]+)\.([a-z\.]{2,6})$/;
	        	
	        	if(reg.test(email)){
	        		
	        		JQ.ajax({
		        		url : "${pageContext.request.contextPath}/email/checkEmail.do",
		        		data : {
		        			email : email
		        		},
		        		success: function(data){
		        			if(data == 1){
		        				alert("이미 존재하는 이메일입니다.");
		        				JQ("#emailSameCheck").val(0);
		        			} else {
		        				alert("사용가능한 이메일입니다.")
		        				JQ("#emailSameCheck").val(1);
		        			}
		        		}, error: function(){
		        			alert("이메일 체크에 실패했습니다.");
		        		}
		        	});
	        		
	        	} else {
	        		
	        		alert("이메일 형식에 맞게 작성해주시기 바랍니다.");
	        		
	        	}
	        	
	        	
	        });
        
        	JQ("#Sign-defaultForm-passCheck").on("keyup", function(){
        		var p1 = JQ("#Sign-defaultForm-passCheck").val();
        		var p2 = JQ("#Sign-defaultForm-pass").val();
        		
        		if(p1 != p2){
        			JQ(".guide.error").show();
        			JQ(".guide.ok").hide();
        			JQ("#passwordSameCheck").val(0);
        		} else if(p1 == p2){
        			JQ(".guide.ok").show();
        			JQ(".guide.error").hide();
        			JQ("#passwordSameCheck").val(1);
        		}
        	});
        	
        	JQ("#checkNick").on("click", function(){
				var nick = JQ("#Sign-defaultForm-NickName").val();
	        	
	        	JQ.ajax({
	        		url : "${pageContext.request.contextPath}/nick/checkNick.do",
	        		data : {
	        			nick : nick
	        		},
	        		success: function(data){
	        			if(data == 1){
	        				alert("이미 존재하는 닉네임입니다.");
	        				JQ("#nickNameSameCheck").val(0);
	        			} else {
	        				alert("사용가능한 닉네임입니다.")
	        				JQ("#nickNameSameCheck").val(1);
	        			}
	        		}, error: function(){
	        			alert("이메일 체크에 실패했습니다.");
	        		}
	        	});
        	});
        	
        	function enroll(){
        		
        		var reg = /^[가-힣]{2,5}$/;
        		var name = JQ("#Sign-defaultForm-Name").val();
        		
				var reg2 = /^[A-Za-z0-9_-]{6,18}$/;
				var pass = JQ("#Sign-defaultForm-pass").val();
				
				var reg3 = /^\d{2,3}\d{3,4}\d{4}$/;
				var phone = JQ('#Sign-defaultForm-Phone').val();
				
				if(JQ('#emailSameCheck').val() == 0){
        			alert("이메일 중복확인을 해주세요");
        			JQ("#Sign-defaultForm-email").focus();
        			return false;
        		}
				
				if( !reg2.test(pass) ) {
					alert("비밀번호를 확인해주세요");
					JQ("#Sign-defaultForm-pass").focus();
					return false;
				}
				
				if(JQ('#passwordSameCheck').val() == 0){
        			alert("비밀번호가 불일치 합니다.");
        			JQ("#Sign-defaultForm-pass").focus();
        			return false;
        		}
        		
        		if( !reg.test(name) ){
        			alert("이름을 확인해주세요");
        			JQ("#Sign-defaultForm-Name").focus();
        			return false;
        		}
        		
        		if(JQ('#nickNameSameCheck').val() == 0){
        			alert("닉네임 중복확인을 해주세요");
        			JQ("#Sign-defaultForm-NickName").focus();
        			return false;
        		}
        		
        		if( !reg3.test(phone) ){
        			alert("전화번호를 확인 해주세요");
        			JQ("#Sign-defaultForm-Phone").focus();
        			return false;
        		}
        		
        		return true;
        		
        	}
        	
			JQ("#Sign-defaultForm-email").on("keyup", function(){
        		
        		JQ("#emailSameCheck").val(0);
        		
        	});
        	
        	JQ("#Sign-defaultForm-NickName").on("keyup", function(){
        		
        		JQ("#nickNameSameCheck").val(0);
        		
        	});
        	
			JQ("#Sign-defaultForm-pass").on("keyup", function(){
				
				var p1 = JQ("#Sign-defaultForm-passCheck").val();
        		var p2 = JQ("#Sign-defaultForm-pass").val();
        		
				if(p1 != p2){
        			JQ(".guide.error").show();
        			JQ(".guide.ok").hide();
        			JQ("#passwordSameCheck").val(0);
        		} else if(p1 == p2){
        			JQ(".guide.ok").show();
        			JQ(".guide.error").hide();
        			JQ("#passwordSameCheck").val(1);
        		}
        		
        	});
			
			function login(){
				var userId = JQ("#Login-defaultForm-email").val();
				var pass = JQ("#Login-defaultForm-pass").val();
				
				if(userId == "" || userId == null){
					alert("아이디를 입력해주세요");
					return false;
				}
				if(pass == "" || pass == null){
					alert("비밀번호를 입력해주세요");
					return false;
				}
				
				return true;
			}
        </script>
    </header>

    
    
    
    
    
    
    
    
    
    
    
    