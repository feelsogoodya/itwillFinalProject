

//<!-- 이미지 추가버튼 스크립트 -->--------------------

	var preview_array  = [false, false, false, false, false, false];
	
	function img_preview() {

		for(var i=0; i<preview_array.length; i++){
			
			
			/* i가 0일때 */
			if(i==0){
				
				/* 0번사진 비어있으면 */
				if(preview_array[0]==false){
					
					/* 섬네일사진 */
					/* 0번사진 인풋태그 호출 */
					
					send_0();
					
					return;
				}
			}
			
			
			/* i가1일때 */
			if(i==1){
				
				/* 1번사진이 비어있으면 */
				if(preview_array[1]==false){
					
					/* 1번사진 인풋태그 호출 */
					send_1();
					
					return;
				}
			}
			
			/* i가 2일때 */
			if(i==2){
				
				/* 2번사진 비어있으면 */
				if(preview_array[2]==false){
					
					/* 2번사진 인풋태그 호출 */
					send_2();
					return;
				}
			}
			
			/* i가 3일때 */
			if(i==3){
				
				/* 3번사진 비어있으면 */
				if(preview_array[3]==false){
					
					/* 3번사진 인풋태그 호출 */
					send_3();
					return;
				}
			}
			
			/* i가 4일때 */
			if(i==4){
				
				/* 4번사진 비어있으면 */
				if(preview_array[4]==false){
					
					/* 4번사진 인풋태그 호출 */
					send_4();

					return;
				}
			}
			
			/* i가 5일때 */
			if(i==5){
				
				/* 5번사진 비어있으면 */
				if(preview_array[5]==false){
					
					/* 5번사진 인풋태그 호출 */
					send_5();
					
					return;
				}
			}
			
			
			
					
		}/*  for end */
		
		alert("더이상 등록할 수 없습니다.");
		return;
		
	}/* 프리뷰 end */

//-----------------------------------------------------





//<!-- 이미지 장수 표현 함수 -->-----------------------
	function img_num() {
		
		var img_number = 0;
		
		for(var i=0; i<preview_array.length; i++ ){
			if(preview_array[i]==true){
				img_number++;
			}
			
		}
		/* 이미지 장수 표시 */
		$("#img_number").html('('+ img_number + '/6)');
		
	}
	
	function send_0() {
		
		
		$("#sumimage").click();
	
			
	}
	
	$(function(){
		
		$("#sumimage").on('change',function(){
			
			if( $("#sumimage")[0].files[0]==undefined) {
				
				
				return;
			
			}
			
			imgcheck0(this);
			
		})
		
	});
//-----------------------------------------------------------






//<!-- 이미지 미리보기 -->-----------------------------------

	function imgcheck0(input) {
		
		/* 이미지 확장자 파일체크 */
		var file_kind = input.value.lastIndexOf('.');
		var file_name = input.value.substring(file_kind+1,input.length);
		var file_type = file_name.toLowerCase();

		var check_array = new Array( 'jpg','png','jpeg' );

		$('#sumimage').val();
		
		if(check_array.indexOf(file_type)==-1){
			
			/* 사용자에게 알려주고 */
			alert('이미지 파일만 선택할 수 있습니다.');

			/* 실제 업로드 되는 input태그 vlaue값 지우기 */
			$('#sumimage').val('');
			
			return;
		
		} 

		
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
		        $('#imgup_sum').attr('src', e.target.result);
		        
		        $("#img_preview0").css("display","inline-block");
				$("#imgup_sum").show();
		        $("#del_sum").show();
		       
				preview_array[0] = true;
				
				/* 이미지넘버 변경 */
				img_num();
			
			
	        }
	        
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	
	
	/* 1번사진 */
	
	function send_1() {

		$("#imageFile1").click();
		
	}
	
	$(function(){
		
		$("#imageFile1").on('change',function(){
			
			/* 파일선택 취소했을때 */
			if( $("#imageFile1")[0].files[0]==undefined) {
				
				
				return;
			}
			
			imgcheck1(this);
			
		})
		
	});
	
	function imgcheck1(input) {
		
		/* 이미지 확장자 파일체크 */
		var file_kind = input.value.lastIndexOf('.');
		var file_name = input.value.substring(file_kind+1,input.length);
		var file_type = file_name.toLowerCase();

		var check_array = new Array( 'jpg','png','jpeg' );

		
		if(check_array.indexOf(file_type)==-1){
			
			alert('이미지 파일만 선택할 수 있습니다.');
			
			
			/* 실제 업로드 되는 input태그 vlaue값 지우기 */
			$('#imageFile1').val('');
			
			return;
		
		} 
		
		
		
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	        
	        	$('#imgup_1').attr('src', e.target.result);
	        	//배열에 트루값주기, 트루면 업로드 못함
	        
	        	$("#img_preview1").css("display","inline-block");
	        	$("#imgup_1").show();
	        	$("#del_img1").show();
	        	
	        	preview_array[1] = true;
				
	        	/* 이미지넘버 변경 */
	        	img_num();
	        	
	        }
	        
	        reader.readAsDataURL(input.files[0]);
	    }
	}

	/* 2번사진 */

	function send_2() {
		$("#imageFile2").click();
	}
	
	$(function(){
		
		$("#imageFile2").on('change',function(){
			
			/* 파일선택 취소했을때 */
			if( $("#imageFile2")[0].files[0]==undefined) {
				
				return;
			}
			
			imgcheck2(this);
			
		})
		
	});
	
	
	
	function imgcheck2(input) {
		
		/* 이미지 확장자 파일체크 */
		var file_kind = input.value.lastIndexOf('.');
		var file_name = input.value.substring(file_kind+1,input.length);
		var file_type = file_name.toLowerCase();

		var check_array = new Array( 'jpg','png','jpeg' );

		
		if(check_array.indexOf(file_type)==-1){
			
			alert('이미지 파일만 선택할 수 있습니다.');
			
			
			/* 실제 업로드 되는 input태그 vlaue값 지우기 */
			$('#imageFile2').val('');
			
			return;
		
		} 
		
		
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
				$('#imgup_2').attr('src', e.target.result);
				
				 $("#img_preview2").css("display","inline-block");
				$("#imgup_2").show();
				$("#del_img2").show();
				
				preview_array[2] = true;
	        	/* 이미지넘버 변경 */
				img_num();
	       
	        }
	        
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	
	/* 3번사진 */
	
	function send_3() {
		$("#imageFile3").click();
	}
	
	$(function(){
		
		$("#imageFile3").on('change',function(){
			
			/* 파일선택 취소했을때 */
			if( $("#imageFile3")[0].files[0]==undefined){
				
				return;
			}
			
			imgcheck3(this);
			
		})
		
	});

	function imgcheck3(input) {
		
		/* 이미지 확장자 파일체크 */
		var file_kind = input.value.lastIndexOf('.');
		var file_name = input.value.substring(file_kind+1,input.length);
		var file_type = file_name.toLowerCase();

		var check_array = new Array( 'jpg','png','jpeg' );

		
		if(check_array.indexOf(file_type)==-1){
			
			alert('이미지 파일만 선택할 수 있습니다.');
			
			
			
			/* 실제 업로드 되는 input태그 vlaue값 지우기 */
			$('#imageFile3').val('');
			
			return;
		
		}
		
		
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
				$('#imgup_3').attr('src', e.target.result);
				
				 $("#img_preview3").css("display","inline-block");
				$("#imgup_3").show();
				$("#del_img3").show();
				
				preview_array[3] = true;
	        	/* 이미지넘버 변경 */
				img_num();
	       
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	
	/* 4번사진 */
	
	function send_4() {
		$("#imageFile4").click();
	}
	
	$(function(){
		
		$("#imageFile4").on('change',function(){
			
			/* 파일선택 취소했을때 */
			if( $("#imageFile4")[0].files[0]==undefined){
				
				return;
			}
			
			imgcheck4(this);
			
		})
		
	});

	function imgcheck4(input) {
		
		/* 이미지 확장자 파일체크 */
		var file_kind = input.value.lastIndexOf('.');
		var file_name = input.value.substring(file_kind+1,input.length);
		var file_type = file_name.toLowerCase();

		var check_array = new Array( 'jpg','png','jpeg' );

		
		if(check_array.indexOf(file_type)==-1){
			
			alert('이미지 파일만 선택할 수 있습니다.');
			
			
			/* 실제 업로드 되는 input태그 vlaue값 지우기 */
			$('#imageFile4').val('');
			
			return;
		
		}
		
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	
				$('#imgup_4').attr('src', e.target.result);
				 $("#img_preview4").css("display","inline-block");
				$("#imgup_4").show();
				$("#del_img4").show();
				
				preview_array[4] = true;
	        	/* 이미지넘버 변경 */
				img_num();
				
	       
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	
	/* 5번사진 */
	
	function send_5() {
		$("#imageFile5").click();
		
	}
	
	$(function(){
		
		$("#imageFile5").on('change',function(){
			
			/* 파일선택 취소했을때 */
			if( $("#imageFile5")[0].files[0]==undefined){
				
				return;
			}
			
			imgcheck5(this);
			
		})
		
	});

	function imgcheck5(input) {
		
		/* 이미지 확장자 파일체크 */
		var file_kind = input.value.lastIndexOf('.');
		var file_name = input.value.substring(file_kind+1,input.length);
		var file_type = file_name.toLowerCase();

		var check_array = new Array( 'jpg','png','jpeg' );

		
		if(check_array.indexOf(file_type)==-1){
			
			alert('이미지 파일만 선택할 수 있습니다.');
			
			
			/* 실제 업로드 되는 input태그 vlaue값 지우기 */
			$('#imageFile5').val('');
			
			return;
		
		}
		
		
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
		        	
		        $('#imgup_5').attr('src', e.target.result);
		        
		        $("#img_preview5").css("display","inline-block");
				$('#imgup_5').show();
		        $("#del_img5").show();
				
		        preview_array[5] = true;
		        /* 이미지넘버 변경 */
		        img_num();
	       
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}

//-----------------------------------------------------------





//<!-- 이미지미리보기삭제 -->--------------------------------

	function del_sum() {
		/* alert('썸네일이미지 지움'); */
		/* 실제 DB에 들어가는 input value 지움 */
		$('#sumimage').val('');
		
        $("#img_preview0").css("display","none");
		$('#imgup_sum').hide();
		$("#del_sum").hide(); 
		
		/* 썸네일 비움 */
		preview_array[0] = false;
		
		/* 이미지 넘버변경 */
		img_num();
		
		return;
	}


	function del_img1() {
		/* alert('1번이미지 지움'); */
		
		$('#imageFile1').val('');
		
		$("#img_preview1").css("display","none");
		$('#imgup_1').hide();
		$("#del_img1").hide();
		
		/* 1번사진 비움 */
		preview_array[1] = false;
		
		/* 이미지 넘버변경 */
		img_num();
		
		return;
	}
	
	function del_img2() {
		/* alert('2번이미지 지움'); */
		
		$('#imageFile2').val('');
		
		$("#img_preview2").css("display","none");
		$('#imgup_2').hide();
		$("#del_img2").hide();
		
		/* 2번사진 비움 */
		preview_array[2] = false;
		
		/* 이미지 넘버변경 */
		img_num();
		
		return;
	}
	
	function del_img3() {
		/* alert('3번이미지 지움'); */
		
		$('#imageFile3').val('');
		$("#img_preview3").css("display","none");
		$('#imgup_3').hide();
		$("#del_img3").hide(); 
		
		/* 3번사진 비움 */
		preview_array[3] = false;
		
		/* 이미지 넘버변경 */
		img_num();
		 
		return;
	}
	function del_img4() {
		/* alert('4번이미지 지움'); */
		
		$('#imageFile4').val('');
		$("#img_preview4").css("display","none");
		$('#imgup_4').hide();
		$("#del_img4").hide();
		
		/* 4번사진 비움 */
		preview_array[4] = false;
		
		/* 이미지 넘버변경 */
		img_num();

		return;
	}
	function del_img5() {
		/* alert('5번이미지 지움'); */
		
		$('#imageFile5').val('');
		$("#img_preview5").css("display","none");
		$('#imgup_5').hide();
		$("#del_img5").hide(); 
		
		/* 5번사진 비움 */
		preview_array[5] = false;
		
		/* 이미지 넘버변경 */
		img_num();
		
		return;
	}
//-----------------------------------------------------------



//<!-- 주소API -->-------------------------------------------
	function addrFind() {
		
		var width = 500; //팝업의 너비
		var height = 300; //팝업의 높이
		
		
	    new daum.Postcode({
	        oncomplete: function(data) {
	         
	            $("#productLoca").val(data.address);
	        },
	    
	    	theme: {
		        searchBgColor: "#7dd87d", //검색창 배경색
		        queryTextColor: "white" //검색창 글자색
		    },
		    
		    width: width, 
		    height: height
		    
	    
	    
	    }).open({
	        left: (window.screen.width / 2) - (width / 2),
	        top: (window.screen.height / 2) - (height / 2) - 200
	    });
		
	}

//-----------------------------------------------------------

// 	var regular_han = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z]/;



//<!-- 가격 함수 (실시간 콤마, 한글입력불가) -->------------
// 	$(function() {
//  
//  		$("#productPrice").on("propertychange change keyup paste input", function() {
// 			
// 			
// 			var productPrice = $(this).val() ;
// 			
// 			if(productPrice<100 ){
// 				$("#price_under").show();
// 				$("#price_under").text('100원 이상만 입력하세요.').css('color','red');
// 		 		$("#productPrice").css('outline','1px solid red');
// 				$("#productPrice").css('border-color','red');
// 				
// 			}
// 			
// 			if(productPrice>=100 || productPrice=='' ){
// 				$("#price_under").hide();
// 	 			$("#productPrice").css('border-color','black');
// 				$("#productPrice").css('outline','black');
// 			}
// 			

// 		});

// 	})
	
//----------------------------------------------------------



//<!-- 실시간 글자수 체크 코드 -->--------------------------	
	
	
 	function numberMaxLength(e) {
 		if (e.value.length > e.maxLength) {
 			e.value = e.value.slice(0, e.maxLength);
 		}
 	}

	$(function() {

		$("#productTitle").on("propertychange change keyup paste input", function() {

			var productTitle = $(this).val().length;

			/* console.log(productTitle); */

			$("#name_length").html(productTitle + '/40')

		});

	})

	$(function() {

		$("#productContent").on("propertychange change keyup paste input", function() {

			var productContent = $(this).val().length;

			$("#exp_length").html(productContent + '/1000')

		});

	})
//----------------------------------------------------------	
