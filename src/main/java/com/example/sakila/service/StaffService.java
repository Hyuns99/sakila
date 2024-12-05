package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.vo.Staff;

@Service
@Transactional // spring에서 예외가 발생할 시 롤백
public class StaffService {
	@Autowired
	private StaffMapper staffMapper;
	
	public Map<String, Object> getStaffOne(int staffId) {
		return staffMapper.selectStaffOne(staffId);
	}
	
	public int getListPage(int rowPerPage) {
		int count = staffMapper.selectStaffCount();
		int lastPage = count / rowPerPage;
		if(lastPage % rowPerPage != 0) {
			lastPage++;
		}
		return lastPage;
	}
	
	public List<Staff> getStaffList(Map<String, Object> paraMap) {
		return staffMapper.selectStaffList(paraMap);
	}
	
	public int addStaff(Staff paramStaff) {
		return staffMapper.insertStaff(paramStaff);
	}
	
	public int modifyStaff(Staff paramStaff) {
		return staffMapper.updateStaff(paramStaff);
	}
	
	public Staff login(Staff paramStaff) {
		return staffMapper.login(paramStaff);
	}
}
