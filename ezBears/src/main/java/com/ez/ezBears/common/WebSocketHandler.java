package com.ez.ezBears.common;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/*
* WebSocket Handler 작성
* 소켓 통신은 서버와 클라이언트가 1:n으로 관계를 맺는다. 따라서 한 서버에 여러 클라이언트 접속 가능
* 서버에는 여러 클라이언트가 발송한 메세지를 받아 처리해줄 핸들러가 필요
* TextWebSocketHandler를 상속받아 핸들러 작성
* 클라이언트로 받은 메세지를 log로 출력하고 클라이언트로 환영 메세지를 보내줌
* */
@Component
public class WebSocketHandler extends TextWebSocketHandler {
    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // 클라이언트로부터 메시지 수신 처리
        String payload = message.getPayload();
        // 수신한 메시지를 원하는 방식으로 처리
        // 예: 다른 연결된 클라이언트에게 메시지 브로드캐스팅
        // session.sendMessage(new TextMessage("서버에서 보낸 메시지: " + payload));
    }
}