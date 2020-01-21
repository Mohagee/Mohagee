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
    <title>뭐하지?</title>
    
    <c:import url="views/common/commonUtil.jsp"/>
    
</head>

<body>

   <c:import url="views/common/header.jsp"/>
   
    <section id="home-slider">
        <div class="container">
            <div class="row">
                <div class="main-slider">
                    <div class="slide-text">
                                   
                        <h1 id="indexMyMenu" style="font-family:cookierun;">
                     <c:if test="${!empty member}">  
                     <a href="#" >${ member.nickName } </a>
                  </c:if> Mohagee</h1>
      
                  
                   <!-- 검색 창 -->     
                  <form class="form-inline mr-auto" action="${ pageContext.request.contextPath }/search/indexSearch.do">
                       <input name="indexSearch" class="form-control mr-sm-2" type="text" placeholder="아직 구현 미완성" 
                           style="font-family: cookierun; font-size : 15px; "  aria-label="Search">
                       <button class="btn btn-success btn-rounded btn-sm my-0" type="submit">Search</button>
                  </form>  
               <!--  검색 창 끝 -->
               
                  </div>
                  
                    <img src="${ pageContext.request.contextPath }/resources/images/home/slider/hill.png" class="slider-hill" alt="slider image">
                    <img src="${ pageContext.request.contextPath }/resources/images/home/slider/house.png" class="slider-house" alt="slider image">
                    <img src="${ pageContext.request.contextPath }/resources/images/home/slider/sun.png" class="slider-sun" alt="slider image">
                    <img src="${ pageContext.request.contextPath }/resources/images/home/slider/birds1.png" class="slider-birds1" alt="slider image">
                    <img src="${ pageContext.request.contextPath }/resources/images/home/slider/birds2.png" class="slider-birds2" alt="slider image">
                </div>
            </div>
        </div>
    </section>
    <!--/#home-slider-->

    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="300ms">
                            <img src="${ pageContext.request.contextPath }/resources/images/home/icon1.png" alt="">
                        </div>
                        <h2>공연</h2>
                        <p>여러분의 단조로운 일상에 공연의 풍부함을!</p>
                    </div>
                </div>
                <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="600ms">
                            <img src="${ pageContext.request.contextPath }/resources/images/home/icon2.png" alt="">
                        </div>
                        <h2>음악</h2>
                        <p>여러분의 조용한 일상에 음악의 빵빵한 사운드를!</p>
                    </div>
                </div>
                <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
                            <img src="${ pageContext.request.contextPath }/resources/images/home/icon3.png" alt="">
                        </div>
                        <h2>액티비티</h2>
                        <p>여러분의 무료한 일상에 액티비티의 흥분을!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#services-->


    <section id="action">
        <div class="vertical-center">
             <div class="container">
                <div class="row">
                    <div class="action count">
                        <div class="col-sm-3 text-center wow bounceIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                            <h1 class="timer bold" data-to="99999" data-speed="3000" data-from="0"></h1>   
                            <h3>총 게시글 수</h3>
                        </div>
                        <div class="col-sm-3 text-center wow bounceIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                            <h1 class="timer bold" data-to="12" data-speed="3000" data-from="0"></h1>   
                            <h3>공연게시판</h3> 
                        </div>
                        <div class="col-sm-3 text-center wow bounceIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                            <h1 class="timer bold" data-to="432" data-speed="3000" data-from="0"></h1> 
                            <h3>운동 게시판</h3>
                        </div>
                        <div class="col-sm-3 text-center wow bounceIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                            <h1 class="timer bold" data-to="145" data-speed="3000" data-from="0"></h1> 
                            <h3>여행 게시판</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#action-->


   <!-- TOP3 영역 -->  
    <section id="features">
        <div class="container">
            <div class="row" id="boardTop3">
         <!-- TOP1 -->
                <div class="single-features">
                    <div class="col-sm-7 wow fadeInLeft">
                        <img src="${ pageContext.request.contextPath }/resources/upload/웃는남자1.jpg" class="img-responsive" >
                    </div>
                    <div class="col-sm-4 wow fadeInRight">
                        <h2>top1 제목</h2>
                        <P>최근게시글</P>
                    </div>
                </div>
                
               <!--  TOP2  -->
                <div class="single-features">
                    <div class="col-sm-4 col-sm-offset-1 align-right wow fadeInLeft">
                        <h2>top2 제목</h2>
                        <P>최근게시글</P>
                    </div>
                    <div class="col-sm-7 wow fadeInRight" >
                        <img src="${ pageContext.request.contextPath }/resources/upload/수정-2-1.png" class="img-responsive" >
                    </div>
                </div>
                
              <!--  TOP3  -->
                <div class="single-features">
                    <div class="col-sm-7 wow fadeInLeft" >
                        <img src="${ pageContext.request.contextPath }/resources/upload/수정-5.jpg" class="img-responsive" >
                    </div>
                    <div class="col-sm-4 wow fadeInRight" >
                        <h2>top3 제목</h2>
                        <P>최근게시글최근게시글최근게시글최근게시글최근게시글최근게시글최근게시글
                        최근게시글최근게시글최근게시글최근게시글최근게시글최근게시글최근게시글
                        최근게시글최근게시글최근게시글최근게시글최근게시글최근게시글</P>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <!--/#features-->

   <script>   
   $(function(){
         $.ajax({
            url : '${pageContext.request.contextPath}/top5/top5List.do', // ROWNUM 으로 가져오기 디비에서
            type : 'POST',
            success : function(data) {
               console.log(data);
               var $div = $('#boardTop3'); // 맨 위 div 아이디로 
               $div.empty();
               for(var i in data){ 
                  var div1 = $('<div class="single-features">');
                  var div1_1 = $('<div class="col-sm-7 wow fadeInLeft">');
                  var imgTag = $('<img src="${ pageContext.request.contextPath }/resources/upload/' + data[i].titleFilename + '" class="img-responsive" >');
                  var div1_2 = $('<div class="col-sm-4 wow fadeInRight">');
                  var h2Tag = $('<h2>').text(data[i].bTitle);
                  var pTag = $('<p>').text(data[i].bContent);
                  
                  div1_1.append(imgTag);
                  div1_2.append(h2Tag).append(pTag);
                  
                  div1.append(div1_1).append(div1_2);
                  
                  $div.append(div1);
               }
               
            } , error : function(request) {
               console.log("힘내세요");
               console.log(request);
            }
         });
   });

   </script>
  
  
  
    <section id="team">
        <div class="container">
            <div class="row">
                <h1 class="title text-center wow fadeInDown" data-wow-duration="500ms" data-wow-delay="300ms">개발진 소개</h1>
                <p class="text-center wow fadeInDown" data-wow-duration="400ms" data-wow-delay="400ms"></p>
                <div id="team-carousel" class="carousel slide wow fadeIn" data-ride="carousel" data-wow-duration="400ms" data-wow-delay="400ms">
                    <!-- Indicators -->
                    <ol class="carousel-indicators visible-xs">
                        <li data-target="#team-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#team-carousel" data-slide-to="1"></li>
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="col-sm-3 col-xs-6">
                                <div class="team-single-wrapper">
                                    <div class="team-single">
                                        <div class="person-thumb">
                                            <img src="${ pageContext.request.contextPath }/resources/images/aboutus/1.jpg" class="img-responsive" alt="">
                                        </div>                                        
                                        <div class="social-profile">
                                            <ul class="nav nav-pills">
                                                <li><a href="#"></a></li><!-- 개발자 프로필로 이동시키기 -->
                                            </ul>
                                        </div>
                                    </div>                                   
                                    <div class="person-info">
                                        <h2>Howl</h2>
                                        <p>Developer &nbsp; 김건하</p>
                                    </div>
                                </div>
                            </div>
                            
                            
                            <div class="col-sm-3 col-xs-6">
                                <div class="team-single-wrapper">
                                    <div class="team-single">
                                        <div class="person-thumb">
                                            <img src="${ pageContext.request.contextPath }/resources/images/aboutus/1.jpg" class="img-responsive" alt="">
                                        </div>
                                    </div>
                                    <div class="person-info">
                                        <h2>Alice</h2>
                                        <p>Developer &nbsp; 백혜영</p>
                                    </div>
                                </div>
                            </div>
                            
                            
                            <div class="col-sm-3 col-xs-6">
                                <div class="team-single-wrapper">
                                    <div class="team-single">
                                        <div class="person-thumb">
                                            <img src="${ pageContext.request.contextPath }/resources/images/aboutus/1.jpg" class="img-responsive" alt="">
                                        </div>
                                    </div>
                                    <div class="person-info">
                                        <h2>jjju</h2>
                                        <p>Developer &nbsp; 전영주</p>
                                    </div>
                                </div>
                            </div>
                            
                            
                            <div class="col-sm-3 col-xs-6">
                                <div class="team-single-wrapper">
                                    <div class="team-single">
                                        <div class="person-thumb">
                                            <img src="${ pageContext.request.contextPath }/resources/images/aboutus/1.jpg" class="img-responsive" alt="">
                                        </div>
                                    </div>
                                    <div class="person-info">
                                        <h2>RSPD</h2>
                                        <p> Developer  &nbsp; 유소현</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="item">
                            <div class="col-sm-3 col-xs-6">
                                <div class="team-single-wrapper">
                                    <div class="team-single">
                                        <div class="person-thumb">
                                            <img src="${ pageContext.request.contextPath }/resources/images/aboutus/1.jpg" class="img-responsive" alt="">
                                        </div>
                                    </div>
                                    <div class="person-info">
                                        <h2>HaON</h2>
                                        <p>Developer &nbsp; 송승훈</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left team-carousel-control hidden-xs" href="#team-carousel" data-slide="prev">left</a>
                    <a class="right team-carousel-control hidden-xs" href="#team-carousel" data-slide="next">right</a>
                </div>
            </div>
        </div>
    </section>

   <c:import url="views/common/footer.jsp"/>
   
   <script>
      /* $(function(){
         $.ajax({
            url: "각 게시글 수 뽑아오는 컨트롤러 링크",
            data: {
               "갖고갈 데이터 필요한거 쓰심 되여"
            },
            dataType: "json",
            success: function(data){
               "데이터로 갖고오는값이 각 보드별 게시글수"
               
               "갖고 온 데이터를 각 위치에 맞게 적어주심되요"
            }
         });
      }) */
   </script>
</body>
</html>