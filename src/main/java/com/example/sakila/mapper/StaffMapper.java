package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper
public interface StaffMapper {
	// staffOne
	Staff selectStaffOne(int staffId);
	
	// 로그인
	Staff login(Staff staff);
	
}
