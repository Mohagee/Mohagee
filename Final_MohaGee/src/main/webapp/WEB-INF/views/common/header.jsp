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
                    <div class="text-center">
                        <a href="" class="btn btn-info btn-rounded mb-4" data-toggle="modal" data-target="#modalJoinForm">
                            Join
                        </a>
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
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background-color:#f0ad4e;">
        <h4 class="modal-title w-100 font-weight-bold" style="color : snow;">Sign In</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <!-- <span aria-hidden="true">&times;</span> -->
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
        <i class="fas fa-envelope prefix grey-text"></i>
        <label data-error="wrong" data-success="right" for="defaultForm-email">ID</label>
          <input type="email" id="defaultForm-email" class="form-control validate" placeholder="example@example.com">
        </div>
        <br>
        <div class="md-form mb-4">
          <i class="fas fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="defaultForm-pass">PW</label>
          <input type="password" id="defaultForm-pass" class="form-control validate" placeholder="Your Password">
        </div>

      </div>
      <div class="modal-footer d-flex justify-content-center">
        <input type="submit" class="btn btn-warning btn-rounded mb-4" value="Login" >
      </div>
    </div>
  </div>
</div>
<!-- Modal -->

<!-- Join Modal -->
<div class="modal fade" id="modalJoinForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background-color:#5bc0de;">
        <h4 class="modal-title w-100 font-weight-bold" style="color : snow;">Sign Up</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <!-- <span aria-hidden="true">&times;</span> -->
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
        <i class="fas fa-envelope prefix grey-text"></i>
        <label data-error="wrong" data-success="right" for="defaultForm-email">ID</label>
          <input type="email" id="defaultForm-email" class="form-control validate" placeholder="example@example.com">
        </div>
        <br>
        <div class="md-form mb-4">
          <i class="fas fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="defaultForm-pass">PW</label>
          <input type="password" id="defaultForm-pass" class="form-control validate" placeholder="Password">
        </div>
        <br>
        <div class="md-form mb-4">
            <i class="fas fa-lock prefix grey-text"></i>
            <label data-error="wrong" data-success="right" for="defaultForm-pass">Name</label>
            <input type="text" id="defaultForm-pass" class="form-control validate" placeholder="Name">
        </div>
        <br>
        <div class="md-form mb-4">
            <i class="fas fa-lock prefix grey-text"></i>
            <label data-error="wrong" data-success="right" for="defaultForm-pass">NickName</label>
            <input type="text" id="defaultForm-pass" class="form-control validate" placeholder="NickName">
        </div>
        <br>
        <div class="md-form mb-4">
            <i class="fas fa-lock prefix grey-text"></i>
            <label data-error="wrong" data-success="right" for="defaultForm-pass">Phone</label>
            <input type="text" id="defaultForm-pass" class="form-control validate" placeholder="Phone">
        </div>

      </div>
      <div class="modal-footer d-flex justify-content-center">
        <input type="submit" class="btn btn-info" value="Join" >
      </div>
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
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <!-- <li class="active"><a href="index.html">홈</a></li> -->
                        <li class=""><a href="${ pageContext.request.contextPath }/gotoBlogdetails.do">blogdetails</a>
                        </li>                    
                        <li class="dropdown"><a href="${ pageContext.request.contextPath }/gotoComingSoon.do">coming-soon</a>
                        </li>
                        <li class="dropdown"><a href="${ pageContext.request.contextPath }/gotoPortfolioDetails.do">portfolio-details</a>
                        </li>
                        <li class="dropdown"><a href="${ pageContext.request.contextPath }/gotoPortfolio.do">portfolio</a>
                        </li>                         
                        <li class="dropdown"><a href="${ pageContext.request.contextPath }/goto404.do">404</a>
                        </li>                   
                    </ul>
                </div>
                <div class="search">
                    <form role="form">
                        <i class="fa fa-search"></i>
                        <div class="field-toggle">
                            <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </header>
