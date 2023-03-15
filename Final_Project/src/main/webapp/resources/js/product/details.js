function pay() {

	alert("거래하시겠습니까?");
	
	var tmpWindow = window.open('about:blank')
    tmpWindow.location = "https://openapi.openbanking.or.kr/v2.0/transfer/deposit/acnt_num" +
            			 "response_type=code&"+
            			 "client_id=5a1d6ed2-a2ed-4bde-9937-471aa3b19bc6&"+ // 
            			 "redirect_uri=http://localhost:8080/market/transaction&"+
            			 "scope=login inquiry transfer&"+
            			 "state=12345678123456781234567812345678&"+
            			 "auth_type=0"
}


function heart() {
	 
    var icon = this.querySelector('i');
    var productNum = this.getAttribute('data-productnum');
    if (icon.classList.contains('far')) {  // 하트 생성
      icon.classList.remove('far');
      icon.classList.add('fas');
		$.ajax( {
			url:'${pageContext.request.contextPath}/product/addWish',
			data:{ 'productNum' : productNum,
						'memId': $('.getMemId').val()
				 },
			success: function(rdata){ 
			}
		});
    } else { //하트제거
      icon.classList.remove('fas');
      icon.classList.add('far');
      $.ajax( {
			url:'${pageContext.request.contextPath}/product/removeWish',
			data:{ 'productNum' : productNum,
						'memId': $('.getMemId').val()
				 },
			success: function(rdata){ 
			}
		});
    }
}