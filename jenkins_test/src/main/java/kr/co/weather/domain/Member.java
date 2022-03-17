package kr.co.weather.domain;

import java.time.LocalDateTime;
import java.util.Date;

//member_num 삭제, address 추가
public class Member {
	private String member_id;
	private String member_pw;
	private String member_email;
	private String signup_date;
	private String info_modify_date;
	private String nickname;
	private String group_id;
	private String address;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getSignup_date() {
		return signup_date;
	}
	public void setSignup_date(String signup_date) {
		this.signup_date = signup_date;
	}
	public String getInfo_modify_date() {
		return info_modify_date;
	}
	public void setInfo_modify_date(String info_modify_date) {
		this.info_modify_date = info_modify_date;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address; 
	}

	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_pw=" + member_pw + ", member_email=" + member_email
				+ ", signup_date=" + signup_date + ", info_modify_date=" + info_modify_date + ", nickname=" + nickname
				+ ", group_id=" + group_id + ", address=" + address + "]";
	}

}
