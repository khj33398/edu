package kr.co.weather;

import java.util.Map;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.co.weather.service.BasicService;

@Controller
public class BasicController {
	@Autowired
	private BasicService basicService;
	
	//////////////// View Control
	//return 할 view 뒤에 .page를 기입하면 tiles/basic.jsp 파일의 레이아웃 안 body 영역에 해당 view를 띄울 수 있음
	//메인 페이지
	@GetMapping("/")
	public String home() {
		return "map.page";
	}

	//관리자 페이지 -> 로그인 기능 구현 후 수정
	@GetMapping("/adminpage")
	public String adminpage() {
		return "adminpage.page";
	}

	@GetMapping("/userpage")
	public String userpage() {
		return "userpage.page";
	}
	
	//회원가입
	@GetMapping("/signup")
	public String signup() {
		return "signup.page";
	}
	
	//로그인
	@GetMapping("/signin")
	public String login() {
		return "signin.page";
	}
	
	//로그아웃
	@GetMapping("/signout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//회원정보
	@GetMapping("/profile")
	public String profile() {
		return "profile.page";
	}

}
