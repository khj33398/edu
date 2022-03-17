/**
 * 
 */ 
 window.addEventListener("load", function(event){
	//DOM 객체 찾아오기
	var loginform = document.getElementById("loginform");
	var loginbtn = document.getElementById("loginbtn");
	
	var id = document.getElementById("id");
	var pw = document.getElementById("password");
	
	var msg = document.getElementById("msg");
	
	loginbtn.addEventListener("click", function(event){
		var flag = false;
		
		if (id.value.trim().length < 1) {
			msg.innerHTML = 'ID는 필수 입력입니다.<br/>';
			flag = true;
		} 
		
		if (pw.value.trim().length < 1) {
			msg.innerHTML += '비밀번호는 필수 입력입니다.<br/>';
			flag = true;
		} 
		
		if(flag == true){
			return;
		}
		   
		var url="signin";
		var request=new XMLHttpRequest();
		request.open("post", url, true);
		var formdata = new FormData(loginform);
		request.send(formdata);
		
		request.addEventListener('load', function(e){
			 console.log(e.target.responseText);
			 var map = JSON.parse(e.target.responseText);
			 if(map.result == true){
			 	alert("Welcome "+map.nickname+"!");
			 	location.href="/";
			 	//localStorage.setItem('LOGIN', true);
			 	//location.href = "/?LOGIN="+map.nickname;
			 }else{
			 	msg.innerHTML = "잘못된 이메일이거나 비밀번호가 틀렸습니다.";
			 }
		  });
	});
	
});