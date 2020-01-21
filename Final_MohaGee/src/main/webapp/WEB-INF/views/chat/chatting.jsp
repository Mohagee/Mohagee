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

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	
	<style>
		.getRoomList{
		    padding: 5px 0px 5px 5px;
		    margin-bottom: 5px;
		    border-bottom: 1px solid #efefef;
		    font-size: 12px;
		}
	</style>
	
	<title>채팅방</title>

</head>

<body>
	
	<c:import url="../common/header.jsp"/>
	
    <!-- 세팅 -->
    <input type="hidden" id="userId" value = "${member.userId }" /><!-- 아이디 -->
    <input type="hidden" id="room" value="${room }" /> <!-- 현재 접속한 방 이름 -->
    
    <!-- 방 이름 / 방 만들기 / 방 나가기 -->
    
    <table style="width: 900px; margin : auto; background-image: url(${ pageContext.request.contextPath }/resources/images/art-background.jpg);">
    
    
    <tr>
    	<td align="center" style="width: 600px; color: white;">
    		<!-- 방 이름 -->
    		<h2 style = "color : lightyellow;">
    			방 이름 : 
    			<c:if test="${room == 'all' }">
    			<b>전체 채팅방</b>
    			</c:if>
    			<c:if test="${room != 'all' }">
    				<b>${room }</b>
    			</c:if>
    		</h2>
    	</td>	
    	
    	<td align="center" style="width: 300px;"> 
    		<!-- 방 만들기 / 방 나가기 버튼 -->
    		<input type="button" class="btn btn-light" value="방 만들기" id="createRoom"/>
    		&nbsp;&nbsp;
    		<input type="button" class="btn btn-light" value="전체 채팅방으로 이동" id="backBtn"/>
    		&nbsp;&nbsp;
    	</td>
    
    </tr>
    
    </table>
    
    <!-- 채팅방 구현 부분 -->
    <table style="height : 600px; width: 900px; margin: auto; padding: 0;" class="table table-info">
    
    <!-- 채팅창 부분 -->
    <col width="200px;"/><!-- 귓속말 영역 -->
    <col width="400px;"/><!-- 메세지 입력 영역 -->
    
    <!-- 리스트 영역 -->
    <col width="300px;"/> <!-- 보내기 영역 -->    
    
    <tr height="600px;">
    	<!-- 채팅 내용 출력 -->
    	<td style="width:550px;" colspan="2">
    		
    		<div style="width:100%; height: 550px; over-flow-y:scroll; over-flow-x:inherit;" id="output"></div>
    		
    	</td>
    
    <!-- 채팅방 목록 -->
    <td style="width: 300px;">
    	<!-- 채팅방 -->
    	<form action="MoveChatRoom.do" method="post" id="moveChatForm">
    		<input type="hidden" name="roomName" value=""/>
    		
    		<div class="ui message blue" style="width: 300px; height: 100px;
    				over-flow-y:scroll; over-flow-x: inherit;" id="room">
    			
    			<!-- 전체 채팅방 -->
    			<div class="getRoomList" id="getRoomList">
    				<div class="item">
    					<div class="content">
    						<b title="전체 채팅방">전체 채팅방</b>
    					</div>
    				</div>
    			</div>
    		</div>
    	</form>
    	
    		<input type="text" style="width: 200px; height: 32px;"
    				placeholder="방 제목" id="searchRoonText" />
    		&nbsp;&nbsp;&nbsp;
    		<input type="button" value="검색" class="btn btn-primary" style="width: 80px; height: 30px;"
    				id="searchRoonBtn" />
			  
			 <!-- 방만들기 form -->
			  <form action="createChatRoom.do" method="post" id="createForm">
			  	<input type="hidden" id="chkRoomName" value=""/> <!-- 방 제목 중복 확인 -->
			  
			  <!-- 방만들기 클릭시 -->
			  <div style="width: 300px; height: 500px; display: none; id="showCreateRoom">
			  
			  	<!-- 방 만들기 테이블 -->
			  	<table style="width: 100%; height: 100%">
			  		<col width="80px;"/>
			  		
			  		<!-- 방제목 -->
			  		<tr style="padding: 1px; margin: 1px;">
			  			<th>방 제목</th>
			  				<td>
			  					<input type="text" name="name" placeholder="방이름" size="8"
			  							style="font-weight: bold; width: 100%; height: 15px;" />
			  				</td>			  		
			  		</tr>
			  		
			  		<!-- 비밀번호 -->
			  		<tr>
			  			<th>비밀번호</th>
			  			<td>
			  				<input type="text" name="pwd" placeholder="방 비밀번호" size="8"
			  						style="font-weight: bold; width: 100%; height: 15px;"
			  						title="작성하지 않을시 공개방으로 생성" />
			  			</td>
			  		</tr>
			  		
			  		<tr>
			  			<th>참여인원</th>
			  			<td>
			  				<a href="#none">
			  					<img src="${ pageContext.request.contextPath }/resources/images/back_arrow.png"
			  						onclick="count_back()" width="13px" title="1명 감소" />
			  				</a> 
			  				
			  				<input type="text" name="totalcount" value="4" size="2" readonly="readonly"
			  					id="count" style="height: 15px; font-weight: bold; background-color: #FFF8DC;" />
			  					
			  				<a href="#none">
			  					<img src="${ pageContext.request.contextPath }/resources/images/next_arrow.png"
			  						onclick="count_next()" width="13px" title="1명 증가" />
			  				</a>
			  			</td>
			  		</tr>
			  		
			  		<!-- 입력부 -->
			  		<tr>
			  			<th>내용</th>
			  			<td>
			  				<input type="text" name="content" placeholder="내용" class="ui message"
			  					style="font-wight: bold; width: 100%; height: 15px;"/>
			  			</td>
			  		</tr>
			  		
			  		<!-- 버튼 -->
			  		<tr>
			  			<td colspan="2">
			  				<input type="button" id="submitBtn" value="방만들기" class="ui primary button" />
			  				<input type="button" id="backBtn" value="돌아가기" class="ui warning button" />
			  			</td>
			  		</tr>
			  	</table>
			  </div>
			</form>
			  
			<!-- 채팅 참여자 출력 -->  
			    	
			<div style="width: 100%; height: 400px; 
					over-flow-y:scroll;" class="ui message" id="listPeople">
			</div>	
    </td>
    
    </tr>
    <!-- 입력 창 -->
    <tr height="100px;">
    	<!-- 귓속말할 대상의 아이디 입력 -->
    	<td>
    		<input type="text" id="wisper" value="" style="width: 100%; height: 100%; 
    				font-weight: bold;" class="ui message blue" name="chatInput" placeholder="내용 입력" />
    	</td>
    	
    	<td>
    		<input type="button" value="보내기" id="buttonMessage"
    			style="width: 100%; height: 100%;" class="ui primary button" />
    	</td>
    </tr>
    </table>
    
    <script type="text/javascript">
    	var sock = null;
    	var id = '${login.id}';
    	$(document).ready(function(){
    		$("#textID").focus(); //처음 접속시, 메세지 입력창 focus 시켜준다고 합니다
    		
    		// 서버로 접속할땐 localhost 설정(관리자)
    		// 본인의 서버로 접속할 경우 admin으로 들어가야만 채팅 가능
    		if(id == 'admin'){
    			ws = new WebSocket("ws://localhost:8088/moghagee/echo.do");
    		} else{
    			// 그 외 회원은 admin을 제외한 다른 아이디로 접속 시, 채팅 참여가 가능함.
    			ws = new Websocket("ws://192.168.20.215:8088/mohagee/echo.do");
    		}
    		
    		
    		// 서버로 메세지
    		ws.onopen = function(){
    			//처음 접속시에만 채팅방에 추가
    			$("output").append("<b>채팅방에 참여했습니다.<b> : " + $("room").val() + "<br>");
    			
    			//보내기 버튼 눌렀을 때
    			$("#buttonMessage").click(function(){
    				var msg = $('input[name=chatInput]').val().trim("!%/"); //메세지
    				
    				var wisper = $("#wisper").val().trim("!%/"); //귓속말 대상자
    				
    				var room = $("#room").val().trim("!%/"); //방이름 (전체방 : all)
    				
    				
    				// 전체에게 보낼때
    				if(wiper == "" && msg != ""){
    					//소켓으로 메세지 전달
    					ws.send(msg + "!%/" + "" + "!%/" + room);
    					$("#output").append("<i class = 'user icon'></i> + <b style='color:blue'>[${login.id}]</b> : " + msg + "<br>");
    					
    					$("#output").scrollTop(99999999); //글 입력시 무조건 하단으로!
    					
    					$("#textID").val(""); //입력창 내용 지우기
    					$("#textID").focus(); //입력창 포커스 획득
    					
    				} else if(wisper != "" && msg != ""){
    					// 귓속말
    					// 본인의 경우
    					if($("#userId").val() == wisper){
    						alert("본인에게는 보낼 수 없습니다.");
    						$("#wisper").focus();
    					} else {
    						//본인이 아닐 경우에만 메세지 전달
    						ws.send(msg + "!%/" + wiper + "!%/" + room) ; // 현재 메세지 + 귓속말 대상 + 방정보
    						
    						$("#output").append("<i class='glyphicon glyphicon-user'></i>"
    											+ "<b style = 'color:blue'>[${login.id}]</b> : "
    											+ "[<b>" + wiper + "</b>]님에게 귓속말 : " + msg + "<br>");
    											$("#output").scrollTop(99999999);
    											$("#textID").val("");
    											$("#textID").focus();
    						
    					}
    					
    				}
    				
    			});
    			
    			// 엔터키 입력처리
    			$("#textID").keypress(function(event){
    				if(event.which == "13"){
    					event.preventDefault();
    					
    					var msg = $('input[name=chatInput]').val().trim("!%/"); // 메세지
    					
    					var wisper = $("wisper").val().trim("!%/"); // 귓속말 대상자
    					
    					var room = $("#room").val().trim("!%/"); //방 이름 (전체방 : all)
    					
    					
    					//전체에게 보낼 때
    					if(wisper == "" && msg != ""){
    						//소켓으로 메세지 전달
    						
    						ws.send(msg + "!%/" + "" + "!%/" + room);
    						
    						$("#output").append("<i class = 'glyphicon glyphicon-user'></i>" 
    										+"<b style='color:blue'>[${login.id}]</b> : " + msg + "<br>");
    						
    						$("#output").scrollTop(99999999); //글 입력 시 무조건 하단!
    						
    						$("#textID").val(""); // 입력창 내용 지우기
    						$("#textID").focus(); // 입력창 포커스 획득
    						
    					} else if(wisper != "" && msg != "") {
    						// 귓속말
    						// 본인에게 보낼경우
    						if($("#userId").val() == wisper){
        						alert("본인에게는 보낼 수 없습니다.");
        						$("#wisper").focus();
        					} else {
        						//본인이 아닐 경우에만 메세지 전달
        						ws.send(msg + "!%/" + wiper + "!%/" + room) ; // 현재 메세지 + 귓속말 대상 + 방정보
        						
        						$("#output").append("<i class='glyphicon glyphicon-user'></i>"
        											+ "<b style = 'color:blue'>[${login.id}]</b> : "
        											+ "[<b>" + wiper + "</b>]님에게 귓속말 : " + msg + "<br>");
        											$("#output").scrollTop(99999999);
        											$("#textID").val("");
        											$("#textID").focus();
        					}
    						
    					}
    					
    					
    				}
    			});
    			
    			// 방 검색
    			$("#searchRoonBtn").click(function(){
    				
    				// 검색어
    				var text = $("searchRoomText").val().trim("!%/&");
    				ws.send("!%/&" + text);
    				
    				$("#searchRoomText").val("");
    				
    			});
    			
    		};
    		
    		//서버로부터 받은 메세지 보내주기
    		ws.onmessage = function(message){
    			
    			// 메세지
    			var jsonData = JSON.parse(message.data);
    			
    			if(jsonData.message != null){
    				$("output").append(jsonData.message + "<br>");
    				$("output").scrollTop(99999999);
    			}
    			
    			// 접속자 리스트
    			var jsonData2 = JSON.parse(message.data);
    			if(jsonData2.list != null){
    				$("#listPeople").html(jsonData2.list);
    			}
    			
    			// 방 정보
    			var jsonData3 = JSON.parse(message.data);
    			if(jsonData3.room != null){
    				alert(jsonData3.room);
    				var roomSplit = jsonData3.room.split(',');
    				
    				var str = "<div class = 'item'><div class = 'content'>"
    						+ "<b title = '전체 채팅방입니다' class = 'chatRoom'"
    						+ "onclick = \" moveRoom('all',0,10000,'null')\">"
    						+ "전체 채팅방 </b> (총 " + roomSplit[0] + "명 참여)</div></div>";
    			}
    			
    			for(i = 1; i < roomSplit.length; i++){
    				var spl = roomSplit[i].split("/");
    				
    				if(spl[0] == '방이 존재하지 않습니다.'){
    					str += "<div class = 'item'><div class='content'><b title = '방이 존재하지 않습니다.'>" 
    							+ spl[0] + "</b></div></div>";
    				} else {
    					// 방이름 : spl[0], 남은 인원수 : spl[1], 전체인원수 : spl[2], 방내용 : spl[3]
    					str += "<div class = 'item'><div class='content'><b title = '"
    							+ spl[3] + "' class='chtRoom' "
    							+ "onclick=\"moveRoom('"+ spl[0] + "','" + spl[1] + "','" + spl[2] + "','" + spl[4] + "')\">"
    							+ spl[0] + "</b> (" + spl[1] + "/" + spl[2] + ")</div></div>";
    				}
    				
    			}
    			
    			$("#getRoomList").html(str);
    			
    			// moveRoom(room, remaincount, totalcount, pwd)
    			
    			
    		}
    		
    	};
    	
    	// 닫힐 때
    	ws.onclose = function(event){};
    		
    	});
    
    </script>
    
    <!-- 방이동 처리함수 -->
    <script type="text/javascript">
    	function moveRoom(room, remaincount, totalcount, pwd){
    		
    		var currentRoom = $("#room").val(); // 현재 자신이 있는 방
    	
    		if(room == currentRoom){
    			// 들어가고자 하는 방 = 현재 자신의 방
    			alert("현재 선택하신 방에 있습니다.");
    		} else {
    			// 방 이동 처리
    			if(remaincount < totalcount){
    				if(pwd != 'null'){
    					var chkPwd = prompt("비밀번호를 입력하세요.");
    					
    					if(chkPwd == pwd){
    						$("[name = 'roomName']").val(room);
    						$("#moveChatForm").attr("target", "_self").submit();
    					} else {
    						alert("비밀번호가 틀렸습니다.");
    					}
    				} else {
        				// 비밀번호가 없다면 바로 이동
        				$("[name = 'roomName']").val(room);
        				$("#moveChatForm").attr("target","_self").submit();
        			
    			} 
    		} else {
    			alert("인원 수가 가득찼습니다.");
    		}
    			
    	} 
    		
    		
    	
    	};
    
    </script>
    
    
    <script>
    	// 방 만들기
    	$("#createRoom").click(function(){
    		$("#listPeople").slideToggle(300);
    		$("#showCreateRoom").slideToggle(300);
    	});
    	
    	// 방 나가기
    	$("#backBtn").click(function(){
    		location.href = "chat.do";
    	});
    	
    </script>
    
    <!-- 방제목 중복확인 -->
    <script type="text/javascript">
    	$("[name = 'name']").blur(function(){
    		var name = $("[name = 'name']").val();
    			if(name != ""){
    				$.ajax({
    					type : "post",
    					url : "./checkRoom.do",
    					async : true,
    					data : "name = " + name,
    					success : function(msg){
    						if(msg == "1"){
    							$("#chkRoomName").val(name);
    						} else if(msg == "0"){
    							alert("이미 존재하는 방이름 입니다.");
    							$("[name = 'name']").val("");
    							$("[name = 'name']").focus();
    						}
    					}
    				});
    			}
    	});
    </script>
    
    <!-- 인원수 증가, 감소 버튼 누를 시 실행되는 스크립트 -->
    <script type="text/javascript">
    	function count_back(){
    		var count = $("#count").val();
    		count = (Number(count) - 1);
    		if(count >= 2){
    			$("#count").val(count);
    		}
    	};
    	
    	function count_next(){
    		var count = $("#count").val();
    		count = (Number(count) + 1);
    		if($("#count").val() < 30){
    			$("#count").val(count);
    		}
    	};
    	
    </script>
    
    <!-- 버튼 처리 -->
    <script type="text/javascript">
    	$("#submitBtn").click(function(){
    		if($("[name = 'name']").val().length < 1){
    			alert("방제목을 입력하세요.");
    			$("[name = 'name']").val().focus();
    		} else if ($("[name = 'name']").val() == "all"){
    			alert("해당 방제목은 사용할 수 없습니다.");
    		} else if ($("[name = 'name']").val() == ""){
    			alert("이미 방이 존재합니다.");
    			$("[name = 'name']").focus();
    		} else if($("[name = 'name']").val().length < 1){
    			alert("방을 설명하기 위한 내용을 입력하세요.");
    			$("[name = 'name']").focus();
    		} else {
    			// form 처리
    			$("#createForm").attr("target","_self").submit();
    		}
    	});
    	
    	$("#backBtn").click(function(){
    		$("form").each(function(){
    			this.reset();
    		});
    		
    		$("#listPeople").slideToggle(300);
    		$("#showCreateRoom").slideToggle(300);
    	});
    </script>
    
    <!-- 접속자 명단에서 아이디 클릭 시 귓속말에 바로 세팅 -->
    <script type="text/javascript">
    	function insertWisper(id){
    		if($("#userId").val() == id){
    			alert("본인에게는 귓속말을 할 수 없습니다.");
    		} else {
    			$("wisper").val(id);
    		}
    	}
    </script>
    
    <script type="text/javascript">
    	$("#wisper").click(function(){
    		$("#wisper").val("");
    	});
    </script>
    
    
    
    
    <c:import url="../common/footer.jsp"/>
    
</body>
</html>














