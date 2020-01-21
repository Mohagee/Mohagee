package com.kh.mohagee.chat.websocket;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.mohagee.chat.model.service.ChatService;
import com.kh.mohagee.chat.model.vo.Chat;
import com.kh.mohagee.chat.model.vo.ChatMember;
import com.kh.mohagee.chat.util.ChatUtil;
import com.kh.mohagee.member.model.vo.Member;



public class WebSocket extends TextWebSocketHandler {
	
	//service 접근 (db 처리)
	@Autowired
	ChatService chatService;
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocket.class);
	
	// 서버에 연결된 사용자들을 저장
	private List<WebSocketSession> sessionList = new ArrayList<>(); // 메세지 날려주는 웹소켓 전용 세션
	private Map<WebSocketSession, String> mapList = new HashMap<>(); // 실제 세션의 아이디 정보, web소켓정보
	private Map<WebSocketSession, String> roomList = new HashMap<>(); // 실제 세션의 아이디 정보, room정보
	
	private List<String> userList = new ArrayList<>(); //접속자 명단을 개개인별로 뿌려주기 위해서..
	
	
	// 연결되었을 때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		logger.info("채팅방 연결 성공! / Run Time : " + new Date());
		
		// 1. 들어온 사람의 실제 로그인 아이디 정보
		Map<String, Object> map = session.getAttributes();
		Member mem = (Member)map.get("login");
		String userId = mem.getUserId();
		
		// 2. 들어온 아이디로 어느 방에 있는 지 확인한다.
		ChatMember userRoom 
					= chatService.getRoomMember(new ChatMember(0, userId, "" , ""));
		
		// 3. 들어온 아이디로 찾은 방 이름을 웹소켓 세션에 추가
		roomList.put(session, userRoom.getRoom());
		System.out.println(userId + "님이" + userRoom.getRoom() + "방에 들어왔습니다.");
		
		// 4. 이전 방 정보 DB에서 수정
		//System.out.println("변경 전 :" + userRoom.getPriroom()); //변경전
		String priroom = userRoom.getRoom();
		chatService.updateRoomMember(new ChatMember(0, userId, "", priroom));
		
		//System.out.println("변경 후 : " + userRoom.getRoom()); //변경전
		
		
		// mapList(해당 세션의 실제 아이디 값을 저장하기 위해 map으로 저장)
		mapList.put(session, userId); // 세션 : key , 유저아이디 : value
		
		// 5. map을 사용하지 않아도 될 경우를 대비
		sessionList.add(session); //세션값 넣기 (session : id=0~, url 주소 : echo.do)
		
		logger.info("세션 추가 : " + session.getId() + "접속자 아이디 : " + mem.getUserId()
					+ "현재 채팅 접속자" + sessionList.size() + "명");
		
		
		// 6. 입장 시 해당 방 인원 수를 증가
		chatService.updateChatCountInc(new Chat(0, userRoom.getRoom(), "", 0, 0, ""));
		
		
		// 7.모든 유저들에게 서로 다른 메세지 전달
		for(int i = 0; i < sessionList.size(); i++) {
			
			String roomName = roomList.get(sessionList.get(i));
			
			if(userRoom.getRoom().equals(roomList.get(sessionList.get(i)))) {
				sessionList.get(i).sendMessage(new TextMessage(JsonDataOpen(userId)));
			}
			
			userList = informUser(mapList, roomName);
			
			System.out.println("현재 방에 참석 중인 사람 수 : " + userList.size());
			ChatUtil chatUtil = new ChatUtil();
			
			String userListMessage = chatUtil.split(userList);
			
			sessionList.get(i).sendMessage(new TextMessage(JsonUser(userListMessage)));
			
			String roomNames = getRoomName();
			sessionList.get(i).sendMessage(new TextMessage(JsonRoom(roomNames)));
			
		}
		
		// 없는 방은 삭제처리
		chatService.deleteChat();
		
	}
	
	// 통신 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
		Map<String, Object> map = session.getAttributes();
		Member mem = (Member)map.get("login");
		String userId = mem.getUserId();
		
		ChatMember member = chatService.getRoomMember(new ChatMember(0, userId, "", ""));
		
		System.out.println("접속 끊기 이전 방 : " + member.getPriroom());
		
		roomList.remove(session);
		mapList.remove(session);
		sessionList.remove(session);
		logger.info("세션 삭제 : " + session.getId() + ",아이디 삭제 : " + userId + ", 채팅 남은 사람 수 : " + sessionList.size());
		
		chatService.updateChatCountDec(new Chat(0, member.getPriroom(), "", 0, 0, ""));
		
		
		for(int i = 0 ; i < sessionList.size(); i++) {
			
			String roomName = roomList.get(sessionList.get(i));
			
			Iterator<WebSocketSession> roomIds = roomList.keySet().iterator();
			
			while(roomIds.hasNext()) {
				WebSocketSession roomId = roomIds.next();
				
				String value = roomList.get(roomId);
				
				if(member.getPriroom().equals(value)) {
					roomId.sendMessage(new TextMessage(jsonDataClose(userId)));
				}
				
			}
			
			userList = informUser(mapList, roomName);
			
			ChatUtil chatUtil = new ChatUtil();
			
			String userListMessage = chatUtil.split(userList);
			
			sessionList.get(i).sendMessage(new TextMessage(JsonUser(userListMessage)));
			
			String roomNames = getRoomName();
			sessionList.get(i).sendMessage(new TextMessage(JsonRoom(roomNames)));
			
		}
		
		
	}
	
	// 서버가 클라이언트로부터 메세지를 받았을때
	@Override //WebSocketMessage<?>
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		Map<String, Object> map = session.getAttributes();
		Member mem = (Member)map.get("login");
		String userId = mem.getUserId();
		
		
		//검색어로 들어왔을 경우
		if(message.getPayload().contains("!%/&")) {
			
			System.out.println(message.getPayload());
			
			String searchRoom = message.getPayload().replaceAll("!%/&", "");
			
			System.out.println(searchRoom);
			
			String roomNames = "";
			
			if(searchRoom.equals("")) {
				roomNames = getRoomName();
			} else {
				roomNames = getRoomName(searchRoom);
			}
			
			for(WebSocketSession webSocketSession : sessionList) {
				//자신한테만 보내도록
				if(session.getId().equals(webSocketSession.getId())) {
					webSocketSession.sendMessage(new TextMessage(JsonRoom(roomNames)));
				}
			}
			
		} else {
			
			System.out.println(message.getPayload());
			
			String msgArr[] = new String[3];
			msgArr = message.getPayload().split("!%/");
			
			System.out.println("보낸 메시지 : " + msgArr[0] + ", 귓속말 대상자 : " + msgArr[1] + ", 방의 이름 : " + msgArr[2]);
			
			if(!msgArr[1].equals("")) {
				Iterator<WebSocketSession> sessionIds = mapList.keySet().iterator();
				// 기존에 저장된 접속자 명단
				
				while(sessionIds.hasNext()) {
					WebSocketSession sessionId = sessionIds.next();
					String value = mapList.get(sessionId);
					
					if(value.equals(msgArr[1])) {
						sessionId.sendMessage(new TextMessage(JsonWisper(userId, msgArr[0])));
					}
					
				}
				
			} else {
				// 귓속말로 하지 않았을 경우
				
				for(WebSocketSession webSocketSession : sessionList) {
					
					//같은 방일때만
					if(msgArr[2].equals(roomList.get(webSocketSession))) {
						
						if(!session.getId().equals(webSocketSession.getId())) {
							webSocketSession.sendMessage(new TextMessage(JsonData(userId, msgArr[0])));
						}
						
					}
					
				}
				
			}
			
			logger.info("메세지 : " + message);
			
		}
		
	}
	
	


	//json 형태로 메세지 변환(일반 메세지)
	public String JsonData(String id, Object msg) {
		JsonObject jsonObject = Json.createObjectBuilder()
						.add("message","<i class='user icon'> </i>"
							+ "<a href = '#none' onclick=\"insertWisper('" + id + "')\"><b>["+id+"]</b></a> : " + msg).build();
		
		StringWriter write = new StringWriter();
		
		try(JsonWriter jsonWriter = Json.createWriter(write)){
			jsonWriter.write(jsonObject);
		};
		
		return write.toString();
	}
	
	//json 형태로 메세지 변환 (접속 알림)
	public String JsonDataOpen(String id) {
		JsonObject jsonObject = Json.createObjectBuilder()
				.add("message","<i class='user icon'> </i>"
						+ "<a href = '#none' onclick=\"insertWisper('" + id + "')\">" + "<b>["+id+"]</b>님이 <b style='color:blue'>접속</b>하셨습니다.</a> ").build();
		
		StringWriter write = new StringWriter();
		
		try(JsonWriter jsonWriter = Json.createWriter(write)){
			jsonWriter.write(jsonObject);
		}
		
		return write.toString();
	}
	
	public String jsonDataClose(String id) {
		JsonObject jsonObject = Json.createObjectBuilder()
				.add("message","<i class='user icon'> </i>"
						+ "<a href = '#none' onclick=\"insertWisper('" + id + "')\">" + "<b>["+id+"]</b>님이 <b style='color:red'>퇴장</b>하셨습니다.</a> ").build();
		
		StringWriter write = new StringWriter();
		
		try(JsonWriter jsonWriter = Json.createWriter(write)){
			jsonWriter.write(jsonObject);
		};
		
		return write.toString();
		
	}

	public String JsonWisper(String fromId, Object msg) {
		JsonObject jsonObject = Json.createObjectBuilder()
				.add("message","<i class='user icon'> </i>"
						+ "<a href = '#none' onclick=\"insertWisper('" + fromId + "')\">"
						+ "<i class = 'user icon'></i> "
						+ "<b style='color:green'>["  // 아이디를 클릭하면 귓속말아이디 세팅
						+ fromId + "]</b>님의 귓속말</a> : " + msg + "").build();
		
		StringWriter write = new StringWriter();
		
		try(JsonWriter jsonWriter = Json.createWriter(write)){
			jsonWriter.write(jsonObject);
		};
		
		return write.toString();
	}
	
	
	//json 형태로 유저 정보 보내기
	public String JsonUser(String id) {
		JsonObject jsonObject = Json.createObjectBuilder().add("list", id).build();
		
		StringWriter write = new StringWriter();
		
		try(JsonWriter jsonWriter = Json.createWriter(write)){
			jsonWriter.write(jsonObject);
		};
		
		return write.toString();
	}
	
	//json 형태로 방 정보 날리기
	public String JsonRoom(String roomNames) {
		
		JsonObject jsonObject = Json.createObjectBuilder().add("room", roomNames).build();
		
		StringWriter write = new StringWriter();
		
		try(JsonWriter jsonWriter = Json.createWriter(write)){
			jsonWriter.write(jsonObject);
		};
		
		return write.toString();
	}

	private List<String> informUser(Map<WebSocketSession, String> mapList, String room) throws Exception {

		// 맵을 이용해 세션을 통해서 아이디 값을 value로 가져와서 list에 담는다
		
		List<String> list = new ArrayList<>();
		
		Iterator<WebSocketSession> sessionIds = mapList.keySet().iterator();
		
		while(sessionIds.hasNext()) {
			WebSocketSession sessionId = sessionIds.next();
			String value = mapList.get(sessionId); // 실제 아이디값
			
			String userRoom = roomList.get(sessionId);
			
			if(userRoom.equals(room)) {
				System.out.println("아이디 : " + value + ", 방이름 : " + userRoom);
				list.add(value);
			}
			
		}

		
		return list;
	}
	
	
	//DB로부터 존재하는 방정보 String 형태로 가져오기
	public String getRoomName() throws Exception {
		
		List<Chat> roomList = chatService.getRoomList();
		
		String room = sessionList.size() + "";
		
		for(int i = 0; i < roomList.size(); i++) {
			room += ",";
			room += roomList.get(i).getName() + "/";
			room += roomList.get(i).getRemaincount() + "/";
			room += roomList.get(i).getTotalcount() + "/";
			room += roomList.get(i).getContent() + "/";
			room += roomList.get(i).getPwd();
		}
		
		//room = room.subString(0, room.length() - 1) ; //뒤의 문자열 자르기
		
		// logger.info(room);
		
		return room;
	}



	public String getRoomName(String name) throws Exception {
		
		List<Chat> roomList = chatService.searchRoomList(name);
		
		String room = sessionList.size() + "";
		
		// 검색했는데 방이 없을 경우
		if(roomList.size() < 1) {
			room += ",방이 존재하지 않습니다. / / / /null";
		} else {
			// 방이 있을 경우
			
			for(int i = 0; i < roomList.size(); i++) {
				room += ",";
				room += roomList.get(i).getName() + "/";
				room += roomList.get(i).getRemaincount() + "/";
				room += roomList.get(i).getTotalcount() + "/";
				room += roomList.get(i).getContent() + "/";
				room += roomList.get(i).getPwd();
			}
			
		}
		
		//room = room.subString(0, room.length() - 1) ; //뒤의 문자열 자르기
		
		logger.info(room);
		
		return room;
	}
	




	

}
