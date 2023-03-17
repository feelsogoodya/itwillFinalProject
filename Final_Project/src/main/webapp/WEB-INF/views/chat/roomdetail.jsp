<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" xmlns:v-on="http://www.w3.org/1999/xhtml">
<head>
    <title>가지마켓 : 채팅방</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">


	<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/channels.css" type="text/css">
    <style>
        [v-cloak] {
            display: none;
        }
    </style>
</head>
<body>
<div class="container" id="app" v-cloak>
	<div class="talk_header">
		<!---->
		<div style="color: #ab47bc; float:left; font-size:36px;  margin-left:5px;  margin-top:5px; " class="fas fa-bars" id="goList"></div>
		<div class="title_area">
			<div class="tit_room">
				<strong class="tit">${chatRoomMap.productTitle}</strong>
			</div>
			<!---->
		</div>
	</div>
	<div class="list-scroll" style="height:500px; overflow-x: hidden; overflow-y: scroll;">
	    <ul class="list-group">
	        <li class="list-group-item" v-for="message in messages" :style="messageStyle(message)">
	            {{message.sender}}<br>
	            {{message.message}}<br>
	            {{message.sendTime}}
	        </li>
	    </ul>
	</div>
    <div class="input-group">
        <div class="input-group-prepend">
            <label class="input-group-text">내용</label>
        </div>
        <input type="text" class="form-control" v-model="message" v-on:keypress.enter="sendMessage">
        <div class="input-group-append">
            <button class="btn btn-primary" type="button" @click="sendMessage" style="background: #CE93D8;">보내기</button>
        </div>
    </div>
</div>
<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.0"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>

<script>
    // websocket & stomp initialize
    var sock = new SockJS("http://localhost:8080${pageContext.request.contextPath }/ws");
    var stomp = Stomp.over(sock);
    var reconnect = 0;
    // vue.js
    var vm = new Vue({
        el: '#app',
        data: {
            roomId: '',
            room: {},
            sender: '',
            message: '',
            sendTime: '',
            messages: []
        },
        created() {
            this.roomId = '${roomId}';
            this.sender = '${sessionScope.memId}' === '${chatRoomMap.sellerId}' ?  '${chatRoomMap.sellerNickname}' : '${chatRoomMap.buyerNickname}';
        },
        methods: {
            sendMessage: function() {
            	stomp.send("/app/chat/message", {}, JSON.stringify({roomId:this.roomId, sender:this.sender, message:this.message}));
                this.message = '';
            },
            recvMessage: function(recv) {
                this.messages.push({"type":recv.type,"sender":recv.sender,"message":recv.message,"sendTime":recv.sendTime});
                this.$nextTick(() => {
                	$('.list-scroll').scrollTop($('.list-scroll')[0].scrollHeight);
                });
            },
            messageStyle: function(message) {
                var style = {};
                style.wordWrap = "break-word";
                if (message.sender === '${sessionScope.memNname}') {
                  style.textAlign = 'right';
                }
                return style;
              }
        }
    });

    function connect() {
        // pub/sub event
        stomp.connect({}, function(frame) {
        	console.log(vm.$data.roomId);
        	$('.list-scroll').scrollTop($('.list-scroll')[0].scrollHeight);
        	stomp.subscribe("/user/chat/room/"+vm.$data.roomId, function(message) {
                var recv = JSON.parse(message.body);
            	vm.recvMessage(recv);
            });
        }, function(error) {
            if(reconnect++ <= 5) {
                setTimeout(function() {
                    console.log("connection reconnect");
                    sock = new SockJS("http://localhost:8080${pageContext.request.contextPath }/ws");
                    stomp = Stomp.over(sock);
                    connect();
                },10*1000);
            }
        });
    }
    
    $('#goList').on('click', function () {
		location.href="${pageContext.request.contextPath}/chat/list";
	});
    <c:if test="${sessionScope.memId eq null}">
    	alert("로그인 후 사용할 수 있습니다.");
    	location.href="${pageContext.request.contextPath}/member/login";
    </c:if>
    <c:forEach items="${chatHistory}" var="item">
    	vm.$data.messages.unshift({"type":"TALK", "sender":'${item.sender}',"message":'${item.message}',"sendTime":'${item.sendTime}'});
    </c:forEach>
    connect();
</script>
</body>
</html>