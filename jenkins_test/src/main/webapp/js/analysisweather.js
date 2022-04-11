window.addEventListener('load', function(event){
	var loc_state = document.getElementById("loc_state");
	var loc_detail = document.getElementById("loc_detail");
	
	var weatherquery = document.getElementById("weatherquery");
	
	weatherquery.addEventListener('click', function(event){
		var url = "getanalysis";
		var request = new XMLHttpRequest();
		request.open("post", url, true);
		var formdata = new FormData();
		formdata.append("loc_state", loc_state.value);
		formdata.append("loc_detail", loc_detail.value);
		request.send(formdata);
		console.log(formdata);
		
		request.addEventListener("load", function(e){	
			var map = JSON.parse(e.target.responseText);
			//받아온 데이터 처리 -> linechart와 연관시키기
			console.log(map)
			var date = map.date;
			var max_tmp = map.max_tmp;
			var min_tmp = map.min_tmp;
			var avg_tmp = map.avg_tmp;
			//var max_tmp = Object.entries(data);
			//var date = Object.entries(map.date);
			console.log(date)
			console.log(max_tmp)			

			var context = document.getElementById('line-chart').getContext('2d');
			var chart = new Chart(context, {
			  type: 'line',
			  data: {
			    labels: date,
			    datasets: [{ 
			        data: min_tmp,
			        label: "최소 온도",
			        borderColor: "#3e95cd",
			        fill: false
			      }, { 
			        data: avg_tmp,
			        label: "평균 온도",
			        borderColor: "#8e5ea2",
			        fill: false
			      }, { 
			        data: max_tmp,
			        label: "최대 온도",
			        borderColor: "#3cba9f",
			        fill: false
			      }
			    ]
			  },
			  options: {
			    title: {
			      display: true,
			      text: '온도 변화 추이'
			    }
			  }
			});
			
		});
	
	});
});