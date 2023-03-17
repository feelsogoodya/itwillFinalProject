<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" xmlns:v-on="http://www.w3.org/1999/xhtml" xmlns:v-bind="http://www.w3.org/1999/xhtml">
<head>
    <title>가지마켓 : 채팅목록</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <!-- CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/channels.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
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
			</div>
			<div class="ListCommon">
				<div class="cont_channel">
					<div class="box_empt">
						<div class="inner_empt">
							<strong class="txt">참여 중인 채팅이 없습니다.</strong>
						</div>
					</div>
					
					<div style="overflow: auto; word-wrap:break-word;">
						<ul class="list-group"></ul>
					</div>
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
			$('.list-group').empty();
			$('.box_empt').show();
			if(data.length !== 0){
				$('.box_empt').hide();
				$(data).each(function(index, item) {
					var str = "<li class='list-group-item list-group-item-action' value='" + this.roomId + "'>";
					var nick = null;
					switch('${sessionScope.memId}'){
						case this.buyerId:
							str += this.sellerNickname;
							nick = this.buyerNickname;
							break;
						case this.sellerId:
							str += this.buyerNickname
							nick = this.sellerNickname;
					}
					
					str += " - " + this.productTitle + "<br>" + this.date + "<div style='font-size:48px; margin-left:340px;' value='" + this.roomId + "' class='fas fa-times' id='deleteRoom'></div>" + "</li>";
					
					$('.list-group').append(str);
					$("#deleteRoom").click(function(e) {
						e.stopPropagation();
						if(confirm("해당 채팅방을 삭제하시겠습니까?")){
							$.ajax({
								url : "${pageContext.request.contextPath}/chat/delete",
								type : "POST",
								data : {
									roomId : item.roomId,
									productNum : item.productNum,
									sender : '${sessionScope.memId}',
									senderNick : nick
								},
								success : function(){
									alert("삭제가 성공했습니다.");
									reset();
								}
							});
						}
					});
				});
			}
		}
	});
}


function deleteRoom(e) {
	e.stopPropagation();
	if(confirm("해당 채팅방을 삭제하시겠습니까?")){
		$.ajax({
			url : "${pageContext.request.contextPath}/chat/delete",
			type : "POST",
			data : {
				roomId : item.roomId,
				productNum : item.productNum,
				sender : '${sessionScope.memId}',
				senderNick : nick
			},
			success : function(){
				alert("삭제가 성공했습니다.");
				$('.list-group').empty();
				reset();
			}
		});
	}
}

$(".list-group").off("click", "li").on("click", "li", function() {
	location.href="${pageContext.request.contextPath }/chat/room/enter/" + $(this).attr("value");
});


<c:if test="${sessionScope.memId eq null}">
	alert("로그인 후 사용할 수 있습니다.");
	location.href="${pageContext.request.contextPath}/member/login";
</c:if>
reset();
</script>

</html>