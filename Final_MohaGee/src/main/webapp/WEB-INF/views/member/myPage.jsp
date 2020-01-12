<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    ${ myPageMember.nickName }님의 마이페이지
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  
  <c:import url="../common/myPageUtil.jsp"></c:import>
  
</head>

<body class="profile-page sidebar-collapse">
	<c:set value="${ member.userNo }" var="userNo"/>
	<c:set value="${ myPageMember.userNo }" var="mUserNo"/>
	<c:set value="${ myPageMember.userGrade }" var="mGrade"/>
	<c:set value="${ myPageMember.introduce }" var="mIntroduce"/>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent " color-on-scroll="400">
    <div class="container">
      <div class="dropdown button-dropdown">
        <a href="${ pageContext.request.contextPath }/gotoIndex.do">
          <i class="fas fa-home fa-2x"></i>
        </a>
      </div>
      <div class="navbar-translate">
        <a class="navbar-brand" href="${ pageContext.request.contextPath }/gotoIndex.do"  data-placement="bottom" target="_blank">
			메인페이지
        </a>
        <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-bar top-bar"></span>
          <span class="navbar-toggler-bar middle-bar"></span>
          <span class="navbar-toggler-bar bottom-bar"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse justify-content-end" id="navigation" data-nav-image="${pageContext.request.contextPath}/resources/myPageResources/img/blurred-image-1.jpg">
        <ul class="navbar-nav">
        	<c:if test="${ userNo eq mUserNo }">
	          <li class="nav-item">
	            <a class="nav-link" href="#" rel="tooltip" title="Edit Profile">
	            	<i class="fas fa-user-edit fa-2x"></i>
		            <p class="d-lg-none d-xl-none">Edit Profile</p>
	            </a>
	          </li>
          	</c:if>
          <li class="nav-item">
            <a class="nav-link" href="#" rel="tooltip" title="Favorite">
            	<i class="fas fa-heart fa-2x"></i>
            	<p class="d-lg-none d-xl-none">Favorite</p>
			</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- End Navbar -->
  <div class="wrapper">
    <div class="page-header page-header-small" filter-color="orange">
      <div class="page-header-image" data-parallax="true" style="background-image:url('${pageContext.request.contextPath}/resources/myPageResources/img/background.png');">
      </div>
      <div class="container" style="height: auto;">
        <div class="photo-container">
          <img src="${ pageContext.request.contextPath }/resources/myPageResources/img/profile.png" alt="">
        </div>
        <h3 class="title">${ myPageMember.nickName }</h3>
        <p class="category">
        	<c:if test="${ mGrade eq 'U' }">일반회원</c:if>
        	<c:if test="${ mGrade eq 'E' }">에디터</c:if>
        </p>
        <div class="content" style="position: relative;height: auto; width: auto;">
          <div class="social-description" style="height: auto; width: auto;">
          	<c:if test="${ !empty introduce }">
	            <h3>자기 소개</h3>
	            <div style="margin: auto;">
	            	${ myPageMember.introduce }
	            </div>
            </c:if>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ml-auto mr-auto">
            <h4 class="title text-center">
				<c:if test="${ mGrade eq 'E' }">My Post</c:if>
				<c:if test="${ mGrade eq 'U' }">My Favorite</c:if>
			</h4>
            <div class="nav-align-center">
              <ul class="nav nav-pills nav-pills-primary nav-pills-just-icons" role="tablist">
              	<c:if test="${ mGrade eq 'E' }">
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#profile" role="tablist">
                    <i class="far fa-image"></i>
                  </a>
                </li>
                </c:if>
                <li class="nav-item">
                  <a class="nav-link active" data-toggle="tab" href="#home" role="tablist">
                    <i class="fas fa-heart"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <!-- Tab panes -->
          <div class="tab-content gallery">
            <div class="tab-pane active" id="home" role="tabpanel">
              <div class="col-md-10 ml-auto mr-auto">
                <div class="row collections">
                  	<div class="col-md-6">
                    <img src="${ pageContext.request.contextPath }/resources/myPageResources/img/bg6.jpg" class="img-raised">
                    <img src="${ pageContext.request.contextPath }/resources/myPageResources/img/bg11.jpg" alt="" class="img-raised">
                  </div>
                  <div class="col-md-6">
                    <img src="${ pageContext.request.contextPath }/resources/myPageResources/img/bg7.jpg" alt="" class="img-raised">
                    <img src="${ pageContext.request.contextPath }/resources/myPageResources/img/bg8.jpg" alt="" class="img-raised">
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="profile" role="tabpanel">
              <div class="col-md-10 ml-auto mr-auto">
                <div class="row collections">
                  <div class="col-md-6">
                    <img src="${ pageContext.request.contextPath }/resources/myPageResources/img/bg6.jpg" class="img-raised">
                    <img src="${ pageContext.request.contextPath }/resources/myPageResources/img/bg11.jpg" alt="" class="img-raised">
                  </div>
                  <div class="col-md-6">
                    <img src="${ pageContext.request.contextPath }/resources/myPageResources/img/bg7.jpg" alt="" class="img-raised">
                    <img src="${ pageContext.request.contextPath }/resources/myPageResources/img/bg8.jpg" alt="" class="img-raised">
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="messages" role="tabpanel">
              <div class="col-md-10 ml-auto mr-auto">
                <div class="row collections">
                  <div class="col-md-6">
                    <img src="${ pageContext.request.contextPath }/resources/myPageResources/img/bg3.jpg" alt="" class="img-raised">
                    <img src="${ pageContext.request.contextPath }/resources/myPageResources/img/bg8.jpg" alt="" class="img-raised">
                  </div>
                  <div class="col-md-6">
                    <img src="${ pageContext.request.contextPath }/resources/myPageResources/img/bg7.jpg" alt="" class="img-raised">
                    <img src="${ pageContext.request.contextPath }/resources/myPageResources/img/bg6.jpg" class="img-raised">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="footer footer-default">
      <div class=" container ">
        <nav>
          <ul>
            <li>
              <a href="https://www.creative-tim.com">
                Creative Tim
              </a>
            </li>
            <li>
              <a href="http://presentation.creative-tim.com">
                About Us
              </a>
            </li>
            <li>
              <a href="http://blog.creative-tim.com">
                Blog
              </a>
            </li>
          </ul>
        </nav>
        <div class="copyright" id="copyright">
          &copy;
          <script>
            document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))
          </script>, Designed by
          <a href="https://www.invisionapp.com" target="_blank">Invision</a>. Coded by
          <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>.
        </div>
      </div>
    </footer>
  </div>
</body>

</html>