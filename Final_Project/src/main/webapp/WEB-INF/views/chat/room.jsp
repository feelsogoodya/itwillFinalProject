<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" xmlns:v-on="http://www.w3.org/1999/xhtml" xmlns:v-bind="http://www.w3.org/1999/xhtml">
<head>
    <title>Websocket Chat</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/channels.css" type="text/css">
</head>


<body>
<div id="app">
	<div class="GlobalChannelList wrap_chat">
		<div>
			<div class="talk_header">
				<!---->
				<div class="title_area">
					<div class="tit_room">
						<strong class="tit">내 채팅</strong>
					</div>
					<!---->
				</div>
				<div class="talk_header_btn">
					<button type="button" aria-label="채팅 설정" class="link_add">
					<i class="material-symbols-outlined"></i>
						<svg aria-hidden="true" class="svg-icon ico-gnb-more">
							<use xlink:href="#ico-gnb-create"></use>
						</svg>
					</button>
				</div>
			</div>
			<div class="ListCommon">
				<div class="cont_channel">
					<div class="box_empt">
						<div class="inner_empt">
							<strong class="txt">참여 중인 채팅이 없습니다.</strong>
						</div>
					</div style="overflow: auto">
						<ul class="list-group"></ul>
					<div></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- <div class="container" style="height: 100%;"> -->
<!--     <div class="row"> -->
<!--         <div class="col-md-12" style="width: 100%;height: 44px;margin-bottom: auto;background-color: #CE93D8;"> -->
<!-- 	        <div style="position: relative;margin: 0 86px;text-align: center;box-sizing: border-box;"> -->
<!-- 		        <div style="margin: 0;padding: 0;font-size: 18px;line-height: 44px;"> -->
<!-- 		            <strong style="display: inline-block;vertical-align: top;max-width: 80%;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;font-weight: bold;"> -->
<!-- 		            	내 채팅 -->
<!-- 		            </strong> -->
<!-- 		        </div> -->
<!-- 	        </div> -->
<!--         </div> -->
<!--     </div> -->
<!--     <div class="input-group"> -->
<!--         <div class="input-group-append"> -->
<!--             <button class="btn btn-primary" id="reset" type="button" onclick="reset()">새로고침</button> -->
<!--         </div> -->
<!--     </div> -->
<!--     <ul class="list-group">  -->
<!--     </ul> -->
<!-- </div> -->
</body>
<!-- JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
<script type="text/javascript">

function reset() {
	$.ajax({
		url : "${pageContext.request.contextPath }/chat/rooms",
		type : "GET",
		data : {
			memberId : '${sessionScope.memId}'
		},
		success : function(data) {
			if(data.length !== 0){
				$('.box_empt').hide();
				$('.list-group').empty();
				$(data).each(function() {
					var str = "<a href='${pageContext.request.contextPath }/chat/room/enter/"+ this.roomId + "'> <li class='list-group-item list-group-item-action'>";
	
					switch('${sessionScope.memId}'){
						case this.buyerId:
							str += this.sellerNickname;
							break;
						case this.sellerId:
							str += this.buyerNickname;
					}
					
					str += " - " + this.productTitle + "<br>" + this.date + "</li></a>";
					
					$('.list-group').append(str);
				});
			}
		}
	});
}
reset();
</script>

</html>