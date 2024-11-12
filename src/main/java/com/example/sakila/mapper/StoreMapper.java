package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Store;

@Mapper
public interface StoreMapper {
	// storeList 출력
	Map<String, Object> selectStoreListByStaffByAddress(Map<String, Object> map);
	
	// staffList 출력
	List<Store> selectStoreList();
}
