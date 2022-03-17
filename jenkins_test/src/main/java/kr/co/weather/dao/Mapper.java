package kr.co.weather.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import kr.co.weather.domain.*;

@Repository
public interface Mapper {
	//Location 테이블에 데이터 삽입하기 >>done
	@Insert("insert into Location values(#{location_id}, #{location_name}, #{location_state})")
	public int insertLocation(Location location);

	//전체 location 데이터 불러오기
	@Select("select location_id from Location")
	public List<Location> selectAllLocation();
	
	//마지막으로 받아온 날씨 데이터의 일자 불러오기
	@Select("select max(record_date) from record")
	public Date selectLastRecordDate();
	
	//Record 테이블에 날씨 정보 삽입하기(xlsx) >> done
	@Insert("insert into Record(location_id, record_date, avg_tmp, min_tmp, max_tmp, rain_hours, day_rain, max_insta_windspeed, max_windspeed, avg_windspeed, avg_humid, day_snow, accumul_snow) "
			+ "values(#{location_id}, #{record_date}, #{avg_tmp}, #{min_tmp}, #{max_tmp}, #{rain_hours}, #{day_rain}, #{max_insta_windspeed}, #{max_windspeed}, #{avg_windspeed}, #{avg_humid}, #{day_snow}, #{accumul_snow})")
	public int insertRecord(Record record);
	
	//Record 테이블 데이터 불러오기 >> not yet
	@Select("select * from Record where record_id=#{record_id}")
	public Record selectRecord(int record_id);
	
	//위치와 date 기준으로 record 데이터 불러오기 -> 데이터 중복으로 list로 구현. 필요시 selectOne으로 된 메서드 하나 만들어도 됨 >> not yet
	@Select("select * from Record where location_id=#{loc} and record_date=#{date}")
	public List<Record> recordLocDate(@Param("loc") int loc, @Param("date") String date);
	
	//Grid 테이블에서 격자 데이터 불러오기 >> done
	@Select("select grid_cityname, grid_x, grid_y, lat, lon from Grid")
	public List<Grid> selectGrid();
	
	//Warning 테이블에 특보 데이터 삽입하기 >> done
	@Insert("insert into Warning(record_id, alert_wind, alert_rain, alert_snow, alert_cold, alert_hot, alert_dry, warn_wind, warn_rain, warn_snow, warn_cold, warn_hot, warn_dry) "
			+ "values(#{record_id}, #{alert_wind}, #{alert_rain}, #{alert_snow}, #{alert_cold}, #{alert_hot}, #{alert_dry}, #{warn_wind}, #{warn_rain}, #{warn_snow}, #{warn_cold}, #{warn_hot}, #{warn_dry})")
	public int insertWarning(Warning warning);
	
	//Record 테이블에 날씨 정보 삽입하기_csv >> done
	@Insert("insert into Record(location_id, record_date, avg_tmp, min_tmp, max_tmp, rain_hours, day_rain, max_insta_windspeed, max_windspeed, avg_windspeed, avg_humid, day_snow, accumul_snow) "
			+ "values(#{location_id}, #{record_date}, #{avg_tmp}, #{min_tmp}, #{max_tmp}, #{rain_hours}, #{day_rain}, #{max_insta_windspeed}, #{max_windspeed}, #{avg_windspeed}, #{avg_humid}, #{day_snow}, #{accumul_snow})")
	public int insertRecordCsv(Record record);
	
	//LocGrid 테이블에 데이터 삽입(xlsx)
	@Insert("insert into LocGrid(region_1, region_2, grid_x, grid_y) values(#{region_1}, #{region_2}, #{grid_x}, #{grid_y})")
	public int insertLocGrid(LocGrid locGrid);
	
	//LocGrid 테이블 grid_x, grid_y 조회
	@Select("select grid_x, grid_y from LocGrid where region_1=#{region_1} and region_2=#{region_2}")
	public LocGrid selectLocGrid(@Param("region_1") String region_1, @Param("region_2") String region_2);
	

	//////////////////// 분석을 위한 데이터 call
	//location_id 조회
	@Select("select location_id from location where location_name=#{location_name} and location_state=#{location_state}")
	public Location selectLocation(Location location);
	
	//기간별 날씨 데이터 조회
	@Select("select * from record where location_id=#{location_id} and record_date>=#{start} and record_date<=#{end}")
	public List<Record> selectWeatherPeriod(@Param("location_id") int location_id, @Param("start") String start, @Param("end") String end);
	
	// 빠른 검색 & 테스트를 위해 5월 데이터만 부르도록 임의로 지정해 놓음 
	@Select("select * from record where location_id=#{location_id} and month(record_date)=5")
	public List<Record> searchRecord(@Param("location_id") Integer location_id);
	
	
	
	
	//////////////////// Member Query
	//	ID / PW check
	@Select("select member_id from weathermember where member_id = #{id}")
	public String idCheck(String member_id);
	
	@Select("select member_email from weathermember where member_email = #{email}")
	public String emailCheck(String member_email);
		
	@Select("select nickname from weathermember where nickname = #{nickname}")
	public String nicknameCheck(String nickname);
	//Member 테이블에 회원정보 삽입하기 >> not yet
	@Insert("insert into weathermember(member_id, member_pw, member_email, nickname, address) values (#{member_id}, #{member_pw}, #{member_email}, #{nickname}, #{address})")
	public int insertMember(Member member);
		
	//login
	@Select("select * from weathermember where member_id=#{member_id}")
	public List<Member> login(Member member);
	
	//modify
	@Update("update weathermember set member_pw=#{member_pw}, address=#{address}, info_modify_date=#{info_modify_date} where member_id=#{member_id}")
	public void modify(Member member);
	
	
	
	
}
