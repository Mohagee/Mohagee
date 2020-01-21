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
						<form class="form-inline mr-auto">
						  <input class="form-control mr-sm-2" type="text" placeholder="내용 입력" 
						  style="font-family:cookierun; font-size : 15px;"  aria-label="Search">
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
                            <h3>Happy Clients</h3>
                        </div>
                        <div class="col-sm-3 text-center wow bounceIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                            <h1 class="timer bold" data-to="12" data-speed="3000" data-from="0"></h1>   
                            <h3>Years in Business</h3> 
                        </div>
                        <div class="col-sm-3 text-center wow bounceIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                            <h1 class="timer bold" data-to="432" data-speed="3000" data-from="0"></h1> 
                            <h3>Cups of Coffee</h3>
                        </div>
                        <div class="col-sm-3 text-center wow bounceIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                            <h1 class="timer bold" data-to="145" data-speed="3000" data-from="0"></h1> 
                            <h3>Total Project</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#action-->

    <section id="features">
        <div class="container">
            <div class="row">
                <div class="single-features">
                    <div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <img src="${ pageContext.request.contextPath }/resources/images/home/image1.png" class="img-responsive" alt="">
                    </div>
                    <div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h2>공연</h2>
                        <P>아름다운 공연의 세레나데를</P>
                    </div>
                </div>
                <div class="single-features">
                    <div class="col-sm-6 col-sm-offset-1 align-right wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h2>뿌뿌뿌</h2>
                        <P>빠빠빠</P>
                    </div>
                    <div class="col-sm-5 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <img src="${ pageContext.request.contextPath }/resources/images/home/image2.png" class="img-responsive" alt="">
                    </div>
                </div>
                <div class="single-features">
                    <div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <img src="${ pageContext.request.contextPath }/resources/images/home/image3.png" class="img-responsive" alt="">
                    </div>
                    <div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h2>Happiness</h2>
                        <P>랄랄라랄랄라~~ 해피니스~~~ 내가 행복하게 사는 비결을 좀 말핼볼까~~</P>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <!--/#features-->

    <section id="clients">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="clients text-center wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
                        <p><img src="${ pageContext.request.contextPath }/resources/images/home/clients.png" class="img-responsive" alt=""></p>
                        <h1 class="title">여기에 차트넣으면 될거같아요</h1>
                        <p>금주의 인기 취미!!<br> 여러분의 선택은? </p>
                    </div>
                    <div class="clients-logo wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="${ pageContext.request.contextPath }/resources/images/home/client1.png" class="img-responsive" alt=""></a>
                        </div>
                        <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="${ pageContext.request.contextPath }/resources/images/home/client2.png" class="img-responsive" alt=""></a>
                        </div>
                         <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="${ pageContext.request.contextPath }/resources/images/home/client3.png" class="img-responsive" alt=""></a>
                        </div>
                         <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="${ pageContext.request.contextPath }/resources/images/home/client4.png" class="img-responsive" alt=""></a>
                        </div>
                         <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="${ pageContext.request.contextPath }/resources/images/home/client5.png" class="img-responsive" alt=""></a>
                        </div>
                         <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="${ pageContext.request.contextPath }/resources/images/home/client6.png" class="img-responsive" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </section>
    <!--/#clients-->

    <section id="team">
        <div class="container">
            <div class="row">
                <h1 class="title text-center wow fadeInDown" data-wow-duration="500ms" data-wow-delay="300ms">개발진 소개</h1>
                <p class="text-center wow fadeInDown" data-wow-duration="400ms" data-wow-delay="400ms">Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br>
                Ut enim ad minim veniam, quis nostrud </p>
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
                                                <li><a href="#">개발자 프로필로 이동</a></li>
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
                                        <h2>John Doe</h2>
                                        <p>CEO &amp; Developer</p>
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
                                        <h2>John Doe</h2>
                                        <p>CEO &amp; Developer</p>
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
                                        <h2>John Doe</h2>
                                        <p>CEO &amp; Developer</p>
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
		$(function(){
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
		})
	</script>
</body>
</html>