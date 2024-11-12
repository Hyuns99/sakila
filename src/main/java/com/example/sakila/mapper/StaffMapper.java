package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper
public interface StaffMapper {
	
	int updateStaff(Staff staff); // 업데이트문 하나로 모든 컬럼을 개별수정 가능
	
	int selectStaffCount();
	
	List<Staff> selectStaffList(Map<String, Object> map); // 스텝 리스트와 beginRow, rowPerPage 등 받아올게 많기때문에 map으로 설정
	
	int insertStaff(Staff staff);
	
	// staffOne
	Map<String, Object> selectStaffOne(int staffId);
	
	// 로그인
	Staff login(Staff staff);
	
}
