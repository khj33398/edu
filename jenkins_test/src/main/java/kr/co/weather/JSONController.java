package kr.co.weather;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.weather.service.BasicService;

@RestController
public class JSONController {
	@Autowired
	private BasicService basicService;
	
	//Data Control -> RestController

	@PostMapping("/signup")
	public Map<String, Object> insertMember(HttpServletRequest request, HttpServletResponse response){
		return basicService.insertMember(request, response);
	}
	
	@PostMapping("/idcheck")
	public Map<String, Object> idCheck(HttpServletRequest request, HttpServletResponse response){
		return basicService.idCheck(request, response);
	} 
	
	@GetMapping("/emailcheck")
	public Map<String, Object> emailCheck(HttpServletRequest request, HttpServletResponse response){
		return basicService.emailCheck(request, response);
	} 

	@GetMapping("/nicknamecheck")
	public Map<String, Object> nicknameCheck(HttpServletRequest request, HttpServletResponse response){
		return basicService.nicknameCheck(request, response);
	} 
	
	@PostMapping("/signin")
	public Map<String, Object> login(HttpServletRequest request, HttpServletResponse response, Model model){
		return basicService.login(request, response);
	}
	
	@PostMapping("/modify")
	public Map<String, Object> modify(HttpServletRequest request){
		return basicService.modify(request);
	}

}
