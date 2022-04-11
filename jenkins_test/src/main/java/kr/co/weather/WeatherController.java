package kr.co.weather;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.binding.MapperMethod.ParamMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.weather.dao.Mapper;
import kr.co.weather.domain.LocGrid;
import kr.co.weather.domain.Location;
import kr.co.weather.domain.Weather;
import kr.co.weather.service.WeatherService;

@Controller
public class WeatherController {
	
	@Autowired
	private WeatherService wservice;
	
	@Autowired
	private Mapper mapper;
	
	//기온 예측 데이터 -> python(flask) 서버에서 데이터 가져오기
	@GetMapping("/getanalysis")
	public String getAnalysis() {
		return "getanalysis.page";
	}
	
	@ResponseBody
	@PostMapping("/getanalysis")
	public Map<String, Object> getAnalysis(HttpServletRequest request){
		Map<String, Object> map = wservice.getAnalysis(request);
		return map;
	}
	
	//기간별 날씨 정보
	@GetMapping("/periodweather")
	public String periodweather() {
		return "periodweather.page";
	}
	
	@ResponseBody
	@PostMapping("/periodweather")
	public Map<String, Object> periodweather(HttpServletRequest request) {
		return wservice.selectWeatherPeriod(request);
	}
	
	//초단기 실황 -> 1일 이내만 가능
	@GetMapping("/getultrasrtncst")
	public String getultrasrtncst() {
		return "/api/getultrasrtncstform.page";
	}
	
	@PostMapping("/getultrasrtncst")
	public String getultrasrtncst(HttpServletRequest request, Model model) throws IOException, ParseException {
		String region_1 = request.getParameter("region_1");
		String region_2 = request.getParameter("region_2");
		try {
			String [] temp = region_2.split(" ");
			if(temp.length>1) {
				region_2 = new String();
				for (String str : temp) {
					region_2 += str;
				}
			}
		}catch(Exception e) {
			System.out.println(e.getLocalizedMessage());
		}

		LocGrid locGrid = mapper.selectLocGrid(region_1, region_2);
		String nx = locGrid.getGrid_x()+"";
		String ny = locGrid.getGrid_y()+"";
		//추후 지역 전체 데이터 테이블 생성하고 거기서 불러오도록 수정
		try {
			Weather list = wservice.getultrasrtncst(nx, ny);
			String date = list.getBaseDate();
			date = new String(date.substring(0, 4)+"년 "+date.substring(4,6)+"월 "+date.substring(6,8)+"일");
			String time = list.getBaseTime();
			time = new String(time.substring(0,2)+":"+time.substring(2,4));
			String loc = region_1+" "+region_2;
			model.addAttribute("date", date);
			model.addAttribute("time", time);
			model.addAttribute("loc", loc);
			model.addAttribute("list", list);
		}catch(Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		//return "/api/getultrasrtncst.page";
		return "/api/getultrasrtncstform.page";
	}	
	
}
