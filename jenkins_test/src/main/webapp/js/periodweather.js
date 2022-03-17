window.addEventListener('load', function(event){
	var loc_state = document.getElementById("loc_state");
	var loc_detail = document.getElementById("loc_detail");
	var datepicker_start = document.getElementById("datepicker_start");
	var datepicker_end = document.getElementById("datepicker_end");
	
	var weatherquery = document.getElementById("weatherquery");
	
	weatherquery.addEventListener('click', function(event){
		var url = "periodweather";
		var request = new XMLHttpRequest();
		request.open("post", url, true);
		var formdata = new FormData();
		formdata.append("loc_state", loc_state.value);
		formdata.append("loc_detail", loc_detail.value);
		formdata.append("datepicker_start", datepicker_start.value);
		formdata.append("datepicker_end", datepicker_end.value);
		request.send(formdata);
		console.log(formdata);
		
		request.addEventListener("load", function(e){	
			var map = JSON.parse(e.target.responseText);
			//받아온 데이터 처리 -> linechart와 연관시키기
			var list = map.list;
			console.log(list);
			var temp = Object.entries(list);
			console.log(temp[0][1].record_id);
			var date = [];
			var min_tmp = [];
			var avg_tmp = [];
			var max_tmp = [];
			for(var i=0; i<temp.length; i++){
				date.push(temp[i][1].record_date);
				min_tmp.push(temp[i][1].min_tmp);
				avg_tmp.push(temp[i][1].avg_tmp);
				max_tmp.push(temp[i][1].max_tmp);
			}
			
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