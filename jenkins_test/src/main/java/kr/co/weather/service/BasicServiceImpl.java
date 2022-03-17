package kr.co.weather.service;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.weather.dao.Mapper;
import kr.co.weather.domain.LocGrid;
import kr.co.weather.domain.Member;

@Service
public class BasicServiceImpl implements BasicService {
	@Autowired
	private Mapper mapper;

	//입력받은 parameter들을 trim 및 대문자 또는 소문자로 통일 -> 대문자로 통일
	@Override
	public Map<String, Object> idCheck(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<>();
		
		String id = request.getParameter("id").trim().toUpperCase();
		//System.out.println("요청된 id : "+id);
		String result = mapper.idCheck(id);

		//없으면 result = true
		if(result == null) {
			map.put("idcheck", true);
		}else {
			map.put("idcheck", false);
		}
		return map;
	}

	@Override
	public Map<String, Object> emailCheck(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<>();

		String email = request.getParameter("email").trim();
		String result = mapper.emailCheck(email);

		//없으면 result = true
		if(result == null) {
			map.put("emailcheck", true);
		}else {
			map.put("emailcheck", false);
		}
		return map;
	}

	@Override
	public Map<String, Object> nicknameCheck(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<>();

		String nickname = request.getParameter("nickname").trim();
		String result = mapper.nicknameCheck(nickname);
		//없으면 result = true
		if(result==null) {
			map.put("nicknamecheck", true);
		}else {
			map.put("nicknamecheck", false);
		}
		return map;
	}

	//password 해시해서 저장하도록 수정 필요 -> 조회문에서도 함께 수정해야 함
	@Override
	public Map<String, Object> insertMember(HttpServletRequest request, HttpServletResponse response) {
		// id/nick/email check 결과 저장 + false로 초기화
		Map<String, Object> map = new HashMap<>();
		map.put("result", false); //가입 결과
		map.put("idcheck",false); // id 확인 결과
		map.put("emailcheck", false); //email 확인 결과
		map.put("nicknamecheck", false); //nick 확인 결과

		// read parameter
		String id = request.getParameter("id").trim().toUpperCase();
		String email = request.getParameter("email").trim();
		String pw = BCrypt.hashpw(request.getParameter("pw").trim(), BCrypt.gensalt()); //비밀번호 해시
		String nickname = request.getParameter("nickname").trim();
		//addr 추가
		String region_1 = request.getParameter("region_1");
		String region_2 = request.getParameter("region_2");
		try {
			String [] temp = region_2.split(" ");
			if(temp.length>1) region_2=new String(temp[0]+temp[1]);
		}catch(Exception e){	
			//System.out.println(e.getLocalizedMessage());
		}
		String address = region_1 + " " +region_2;

		//id 체크
		String idresult = mapper.idCheck(id);
		if(idresult == null) {
			map.put("idcheck", true);
		}

		//email 체크
		String emailresult = mapper.emailCheck(email);
		if(emailresult == null) {
			map.put("emailcheck", true);
		}

		//nickname 체크
		String nicknameresult = mapper.nicknameCheck(nickname);
		if(nicknameresult == null) {
			map.put("nicknamecheck", true);
		}

		//중복 확인 패스하면 진행,
		if(idresult == null && emailresult == null && nicknameresult == null) {
			//가입 정보 저장
			Member member = new Member();
			member.setMember_id(id);
			member.setMember_email(email);
			member.setMember_pw(pw);
			member.setNickname(nickname);
			member.setAddress(address);

			//회원 가입
			int result = mapper.insertMember(member);
			if(result>0) {
				map.put("result", true);
			}
		}
		return map; //가입 및 중복 결과 리턴
	}

	@Autowired
	private WeatherService wservice;
	
	@Override
	public Map<String, Object> login(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<>();
		//로그인 성공 여부를 먼저 저장
		map.put("result", false);
		
		String id = request.getParameter("id").trim().toUpperCase();
		String pw = request.getParameter("password").trim();
		
		Member member = new Member();
		member.setMember_id(id);
		List<Member> list = mapper.login(member);
		if(list==null) return map; // 해당하는 id가 없는 경우 return
	
		try {
			//id & pass 비교
			for(Member user:list) {
				if(id.equals(user.getMember_id()) && BCrypt.checkpw(pw, user.getMember_pw())) {
					//로그인 성공
					map.put("result", true);
					//필요한 정보 저장
					map.put("id", user.getMember_id());
					map.put("nickname", user.getNickname());
					map.put("group_id", user.getGroup_id());
					map.put("email", user.getMember_email());
					map.put("address", user.getAddress());
					String region_1 = user.getAddress().split(" ")[0];
					String region_2 = user.getAddress().split(" ")[1];
					request.getSession().setAttribute("region_1", region_1);
					request.getSession().setAttribute("region_2", region_2);
					break;
				}
			}
		}catch(Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		//Session에 저장
		request.getSession().setAttribute("userinfo", map);
		request.getSession().setAttribute("LOGIN", true);
		return map;
	}

	//회원정보 수정
	@Override
	public Map<String, Object> modify(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		map.put("result", true);
		String id = request.getParameter("id"); //이미 고정된 값이기 때문에 trim과 upper 생략
		String pw = request.getParameter("pw");
		String region_1 = request.getParameter("region_1");
		String region_2 = request.getParameter("region_2");
		try {
			String [] temp = region_2.split(" ");
			region_2 = temp[0]+temp[1];
		}catch (Exception e) {}
		String address = region_1 + " " + region_2;
		Calendar cal = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		Member member = new Member();
		member.setMember_id(id);
		member.setMember_pw(BCrypt.hashpw(pw, BCrypt.gensalt()));
		member.setAddress(address);
		member.setInfo_modify_date(sdf.format(cal.getTime()));

		try {
			mapper.modify(member);
			request.getSession().setAttribute("region_1", region_1);
			request.getSession().setAttribute("region_2", region_2);
			request.getSession().setAttribute("modify", true);
		}catch(Exception e) {
			//System.out.println(e.getLocalizedMessage());
			map.put("result", false);
		}
		return map;
	}
}
