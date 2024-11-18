package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Inventory;

@Mapper
public interface InventoryMapper {
	// 삭제
	Integer deleteInventoryByKey(Integer inventoryId);
	
	// /on/addInventory
	Integer insertInventory(Inventory inventory);
	
	// 페이지네이션
	Integer selectInventoryCount();
	
	// inventoryList
	List<Map<String, Object>> selectInventoryListByStore(Map<String, Object> paramMap);
	
	// on/removeFilm
	Integer selectCountInventoryByFilm(Integer filmId);
}
