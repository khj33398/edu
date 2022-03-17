window.addEventListener("load", function(event){
	//DOM 객체 찾아오기
	var memberinfo = document.getElementById("memberinfo");
	
	var id = document.getElementById("id");
	var pw = document.getElementById("pw");
	var pw1 = document.getElementById("pw1");
	var region_1 = document.getElementById("region_1");
	var region_2 = document.getElementById("region_2");
	
	var pwmsg = document.getElementById("pwmsg");
	var pw1msg = document.getElementById("pw1msg");
	var addressmsg = document.getElementById("addressmsg");
	
	var modfiy = document.getElementById("modify");
	
	
	pw.addEventListener("focusout", function(event){
		if (pw.value.trim().length < 1) {
			//pwmsg.innerHTML = '비밀번호는 필수 정보입니다.<br/>';
		} else {
			var pwRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=]).*$/;
			if (!pwRegExp.test(pw.value.trim())) {
				pwmsg.innerHTML = '비밀번호는 숫자와 대소문자 그리고 특수문자가 포함되어야 합니다.<br/>';
				pwmsg.style.color = 'red';
			}else{
				pwmsg.innerHTML = "";
			}
		}
	});
	
	pw1.addEventListener("focusout", function(event){
		if (pw1.value.trim().length < 1) {
			//pw1msg.innerHTML = '비밀번호를 확인해주세요.<br/>';
		} else{
			if(pw1.value.trim()!=pw.value.trim()){
				pw1msg.innerHTML = '비밀번호가 일치하지 않습니다.<br/>';
			}else{
				pw1msg.innerHTML = "";
			}
		}
	});
	

	modify.addEventListener("click", function(event){
		var flag = true;

		var pwRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=]).*$/;
		if (pw.value.trim().length < 1 || !pwRegExp.test(pw.value.trim())) {
			pwmsg.innerHTML = '비밀번호는 숫자와 대소문자 그리고 특수문자가 포함되어야 합니다.<br/>다시 확인해주세요.<br/>';
			flag = false;
		}else{
			pwmsg.innerHTML = "";
		}
		
		if (pw.value.trim() !== pw1.value.trim()) {
			pw1msg.innerHTML = '2개의 비밀번호는 같아야 합니다.<br/>';
			flag = false;
		}else{
			pw1msg.innerHTML = "";
		}
		
		/*
		if (region_1.value.trim()=='시/도' || region_2.value.trim()=='시/군/구'){
			addressmsg.innerHTML = '주소는 필수 입력 사항입니다.<br/>';
			addressmsg.style.color='gray';
			flag=false;
		}
		*/
		
		//클라이언트 유효성 검사에 실패하면 전송하지 말고 중지
		if (flag == false) {
			return;
			event.preventDefault();
		}
		
		var url="modify";
	  	var request=new XMLHttpRequest();
		  	
		request.open("post", url, true);
		var formdata = new FormData(memberinfo);
		request.send(formdata);
		
		//현재 비밀번호를 체크하고 전송하도록 수정 필요
		request.addEventListener('load', function show(e){
			var map = JSON.parse(request.responseText);
			console.log(map);
			if(map.result == true){
			 	alert("회원 정보 수정이 완료되었습니다.");
			}else{
				alert("회원 정보 수정이 실패되었습니다.");
			}
			location.href="/";
		 });
	});
});