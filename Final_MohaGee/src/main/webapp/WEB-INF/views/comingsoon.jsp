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
    <title>Coming Soon | Triangle</title>
    
    <c:import url="common/commonUtil.jsp"/>

</head>
<body>
    <div class="logo-image">                                
       <a href="${ pageContext.request.contextPath }/gotoIndex.do"><img class="img-responsive" src="${ pageContext.request.contextPath }/resources/images/logo.png" alt=""> </a> 
    </div>
     <section id="coming-soon">        
         <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">                    
                    <div class="text-center coming-content">
                        <h1>아직 완성 되지 않았습니다.</h1>
                        <p>
                            최대한 빠른 시일내에 완성 시키겠습니다. 양해 부탁드립니다.
                        </p>
                    </div>                    
                </div>
                <div class="col-sm-12">
                    <div class="time-count">
                        <ul id="countdown">
                            <li class="angle-one">
                                <span class="days time-font">00</span>
                                <p>Days</p>
                            </li>
                            <li class="angle-two">
                                <span class="hours time-font">00</span>
                                <p>Hours</p>
                            </li>
                            <li class="angle-three">
                                <span class="minutes time-font">00</span>
                                <p class="minute">Mins</p>
                            </li>                            
                            <li class="angle-four">
                                <span class="seconds time-font">00</span>
                                <p>Secs</p>
                            </li>               
                        </ul>   
                    </div>
                </div>
            </div>
        </div>       
    </section>
    <section id="subscribe">
        <div class="container">
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><i class="fa fa-envelope-o"></i> 빠른정보를 원하시면 이메일을 입력해주세요</h2>
                            <p>업데이트가 완료되는대로 이메일을 발송해드리겠습니다.</p>
                        </div>
                        <div class="col-sm-6 newsletter">
                            <form id="newsletter">
                                <input class="form-control" type="email" name="email"  value="" placeholder="이메일을 입력해주세요">
                                <i class="fa fa-check"></i>
                            </form>
                            <p>저희는 절대 스팸메일을 발송하지 않습니다.</p>
                        </div>    
                    </div>
                </div>     
            </div>
        </div> 
    </section>

    <section id="coming-soon-footer" class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="text-center">
                    <p>&copy; Your Company 2014. All Rights Reserved.</p>
                    <p>Designed by <a target="_blank" href="http://www.themeum.com">Themeum</a></p>
                </div>
            </div>
        </div>       
    </section>
    
    <script type="text/javascript">
        //Countdown js
     $("#countdown").countdown({
            date: "10 march 2015 12:00:00",
            format: "on"
        },      
        function() {
            // callback function
    });
</script>
</body>
</html>