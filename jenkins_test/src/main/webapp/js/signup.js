window.addEventListener("load", function(event){
	//DOM 객체 찾아오기
	var signup = document.getElementById("signup");
	
	var id = document.getElementById("id");
	var email = document.getElementById("email");
	var pw = document.getElementById("pw");
	var pw1 = document.getElementById("pw1");
	var nickname = document.getElementById("nickname");
	var region_1 = document.getElementById("region_1");
	var region_2 = document.getElementById("region_2");
	
	var msg = document.getElementById("msg");
	var idmsg = document.getElementById("idmsg");
	var emailmsg = document.getElementById("emailmsg");
	var pwmsg = document.getElementById("pwmsg");
	var pw1msg = document.getElementById("pw1msg");
	var nicknamemsg = document.getElementById("nicknamemsg");
	var addressmsg = document.getElementById("addressmsg");
	
	var idcheck = document.getElementById("idcheck");
	var emailcheck = document.getElementById("emailcheck");
	var nicknamecheck = document.getElementById("nicknamecheck");
	
	var signupbtn = document.getElementById("signupbtn");
	//데이터 모두 trim한 값 넘겨주도록 수정해야 함
	
	id.addEventListener("focusout", function(event){
		if(id.value.trim().length < 1){
			idmsg.innerHTML = 'ID는 필수 입력입니다.<br/>';
		}
	});

	email.addEventListener("focusout", function(event){
		if (email.value.trim().length < 1) {
			emailmsg.innerHTML = '이메일은 필수 입력입니다.<br/>';
		} else {
			var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if (!emailRegExp.test(email.value.trim())) {
					emailmsg.innerHTML = '잘못된 이메일 형식입니다.<br/>';
			}
		}
	});
	
	nickname.addEventListener("focusout", function(event){
		if (nickname.value.trim().length < 1) {
			nicknamemsg.innerHTML = '별명은 필수 입력입니다.<br/>';
		} else {
			var nicknameRegExp = /^[a-zA-z가-힣0-9]{2,10}$/;
			if (!nicknameRegExp.test(nickname.value.trim())) {
				nicknamemsg.innerHTML = '닉네임은 2~10자까지 가능합니다.<br/>';
			}
		}
	});
	
	pw.addEventListener("focusout", function(event){
		if (pw.value.trim().length < 1) {
			pwmsg.innerHTML = '비밀번호는 필수 정보입니다.<br/>';
		} else {
			var pwRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=]).*$/;
			if (!pwRegExp.test(pw.value.trim())) {
				pwmsg.innerHTML = '비밀번호는 숫자와 대소문자 그리고 특수문자가 포함되어야 합니다.<br/>';
				pwmsg.style.color = 'red';
			}
		}
	});
	
	pw1.addEventListener("focusout", function(event){
		if (pw1.value.trim().length < 1) {
			pw1msg.innerHTML = '비밀번호를 확인해주세요.<br/>';
		} else if(pw1.value.trim()!=pw.value.trim()){
			pw1msg.innerHTML = '비밀번호가 일치하지 않습니다.<br/>';
		}
	});
	
	//post 방식
	idcheck.addEventListener("click", function(event){
		var url = "idcheck";
		var request = new XMLHttpRequest();
		request.open("post", url, true);
		var formdata = new FormData();
		formdata.append("id", id.value);
		request.send(formdata);
		console.log(formdata);
		request.addEventListener("load", function(e){
			var map = JSON.parse(e.target.responseText);
			if(map.idcheck==false){
				idmsg.innerHTML = "사용 불가능한 ID입니다.";
				id.value="";
				id.placeholder = "새로운 ID를 입력해주세요.";
			 	idmsg.style.color = "Red";
			}else{
				idmsg.innerHTML = "사용 가능한 ID입니다.";
			 	idmsg.style.color = "Blue";
			}
		});
	});
	
	/*
		#idcheck는 post뿐 아니라 get으로도 가능.
		
		var url = "idcheck?id=" + id.value;
		var request = new XMLHttpRequest();
		request.open("get", url, true);
		var formdata = new FormData();
		request.send(formdata);
	*/
	
	//get 방식
	emailcheck.addEventListener("click", function(e){
		var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (!emailRegExp.test(email.value.trim())) {
				emailmsg.innerHTML = '잘못된 이메일 형식입니다.<br/>';
		}else{
			var url="emailcheck?email=" + email.value;
	  		var request=new XMLHttpRequest();
	  		request.open("get", url, true);
	  		request.send('');
	  		request.addEventListener('load', function(e){
	  			var map = JSON.parse(e.target.responseText);
	  			if(map.emailcheck == false){
			 		emailmsg.innerHTML = "사용 불가능한 이메일입니다.";
			 		email.value="";
					email.placeholder = "새로운 이메일을 입력해주세요.";
			 		emailmsg.style.color = "Red";
				}else{
					emailmsg.innerHTML = "사용 가능한 이메일입니다.";
				 	emailmsg.style.color = "Blue";
				}
	  		});
	  	}
	});
	
	nicknamecheck.addEventListener("click", function(e){
		var url="nicknamecheck?nickname=" + nickname.value;
	  	var request=new XMLHttpRequest();
	  	request.open("get", url, true);
	  	request.send('');
	  	request.addEventListener('load', function show(e){
	  		var map = JSON.parse(e.target.responseText);
	  		if(map.nicknamecheck == false){
			 	nicknamemsg.innerHTML = "사용 불가능한 별명입니다.";
			 	nickname.value="";
				nicknamemsg.placeholder = "새로운 별명을 입력해주세요.";
			 	nicknamemsg.style.color = "Red";
			}else{
				nicknamemsg.innerHTML = "사용 가능한 별명입니다.";
			 	nicknamemsg.style.color = "Blue";
			}
	  	})
	});
	
	
	signupbtn.addEventListener("click", function(event){
		var flag = true;
		
		if (id.value.trim().length < 1) {
			idmsg.innerHTML = '이메일은 필수 입력입니다.<br/>';
			flag = false;
		} 
		
		var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (email.value.trim().length < 1 || !emailRegExp.test(email.value.trim())) {
			emailmsg.innerHTML = '잘못된 이메일 형식입니다.<br/>';
			flag = false;
		}

		var pwRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=]).*$/;
		if (pw.value.trim().length < 1 || !pwRegExp.test(pw.value.trim())) {
			pwmsg.innerHTML = '비밀번호는 숫자와 대소문자 그리고 특수문자가 포함되어야 합니다.<br/>다시 확인해주세요.<br/>';
			flag = false;
		}
		
		if (pw.value.trim() !== pw1.value.trim()) {
			pw1msg.innerHTML = '2개의 비밀번호는 같아야 합니다.<br/>';
			flag = false;
		}

		var nicknameRegExp = /^[a-zA-z가-힣0-9]{2,10}$/;
		if (nickname.value.trim().length < 1 || !nicknameRegExp.test(nickname.value.trim())) {
			nicknamemsg.innerHTML = '닉네임은 영문 한글 숫자로 2자 이상 5자 이하이어야 합니다.<br/>다시 확인해주세요.<br/>';
			flag = false;
		}
		
		if (region_1.value.trim()=='시/도' || region_2.value.trim()=='시/군/구'){
			addressmsg.innerHTML = '주소는 필수 입력 사항입니다.<br/>';
			addressmsg.style.color='gray';
			flag=false;
		}
		
		//클라이언트 유효성 검사에 실패하면 전송하지 말고 중지
		if (flag == false) {
			return;
			event.preventDefault();
		}
		
		var url="signup";
	  	var request=new XMLHttpRequest();
		  	
		request.open("post", url, true);
		var formdata = new FormData(signup);
		request.send(formdata);
		
		// 현재 화면 이동이 복불복,,
		request.addEventListener('load', function show(e){
			var map = JSON.parse(request.responseText);
			console.log(map);
			if(map.result == true){
			 	alert("회원가입 성공");
			 	window.location.replace('/');
			}else{
				alert("회원가입 실패");
			 	//location.reload();
			 	if(map.idcheck == false){
			 		idmsg.innerHTML = "사용 불가능한 ID입니다.";
			 		idmsg.style.color = "Red";
			 	}else{
			 		idmsg.innerHTML = "사용 가능한 ID입니다.";
			 		idmsg.style.color = "Blue";
			 	}
			 	if(map.emailcheck == false){
			 		emailmsg.innerHTML = "사용 불가능한 이메일입니다.";
			 		emailmsg.style.color = "Red";
			 	}else{
			 		emailmsg.innerHTML = "사용 가능한 이메일입니다.";
			 		emailmsg.style.color = "Blue";
			 	}
			 	if(map.nicknamecheck == false){
			 		nicknamemsg.innerHTML = "사용 불가능한 닉네임입니다.";
			 		nicknamemsg.style.color = "Red";
			 	}else{
			 		nicknamemsg.innerHTML = "사용 가능한 닉네임입니다.";
			 		nicknamemsg.style.color = "Blue";
			 	}
			 }
		 });
	});
});