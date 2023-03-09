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


