function statechange(e){
	var seoul = ["서울"];
	var gyeonggi = ["동두천","파주","백령도","인천","수원","강화","양평","이천"];
	var gangwon = ["속초","북춘천","철원","대관령","춘천","북강릉","강릉","동해","원주","영월","인제","홍천","태백","정선군"];
	var jeollanamdo = ["광주","목포","여수","흑산도","완도","순천","영광군","보성군","강진군","장흥","해남","고흥","광양시","진도군"];
	var jeollabukdo = ["군산","전주","고창","부안","임실","정읍","남원","장수","고창군","순창군"];
	var chungcheongnamdo = ["서산","대전","홍성","천안","보령","부여","금산"];
	var chungcheongbukdo = ["충주","청주","추풍령","제천","보은"];
	var gyeongsangnamdo = ["울산","창원","부산","통영","진주","김해시","북창원","양산시","의령군","함양군","거창","합천","밀양","산청","거제","남해"];
	var gyeongsangbukdo = ["울릉도","울진","안동","상주","포항","대구","봉화","영주문경","청송군","영덕","의성","구미","영천","경주시"];
	var jeju = ["제주","고산","성산","서귀포"];
	var sejong = ["세종"];
	var target = document.getElementById("loc_detail");
			
	if(e.value=="서울") var d = seoul;
	else if(e.value=="경기도") var d = gyeonggi;
	else if(e.value=="강원도") var d = gangwon;
	else if(e.value=="전라남도") var d = jeollanamdo;
	else if(e.value=="전라북도") var d = jeollabukdo;
	else if(e.value=="충청남도") var d = chungcheongnamdo;
	else if(e.value=="충청북도") var d = chungcheongbukdo;
	else if(e.value=="경상남도") var d = gyeongsangnamdo;
	else if(e.value=="경상북도") var d = gyeongsangbukdo;
	else if(e.value=="제주도") var d = jeju;
	else if(e.value=="세종") var d = sejong;
			
	target.options.length=0;
			
	for (x in d){
		var opt = document.createElement("option");
		opt.value= d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}
}