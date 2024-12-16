package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.InventoryMapper;
import com.example.sakila.vo.Inventory;

@Service
@Transactional
public class InventoryService {
	@Autowired InventoryMapper inventoryMapper;
	
	public Integer removeInventoryByKey(Integer inventoryId) {
		return inventoryMapper.deleteInventoryByKey(inventoryId);
	}
	
	public Integer addInventory(Inventory inventory) {
		return inventoryMapper.insertInventory(inventory);
	}
	
	public Integer getInventoryCount(Integer storeId ) {
		// 페이지네이션
		Integer rowPerPage = 10;
		Integer count =  inventoryMapper.selectInventoryCount();
		Integer lastPage = count / rowPerPage;
	    if (count == 0) {
	        return 1;  // If no records, set last page to 1 (or whatever is appropriate)
	    }
	    
	    if (count % rowPerPage != 0) {
	        lastPage++;
	    }
			
		return lastPage;
	}
	
	// inventoryList
	public List<Map<String, Object>> getInventoryListByStore(Integer storeId, Integer currentPage, Integer rowPerPage) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("storeId", storeId);
		paramMap.put("rowPerPage", rowPerPage);
		Integer beginRow = (currentPage - 1) * rowPerPage;
		paramMap.put("beginRow", beginRow);
		
		
		return inventoryMapper.selectInventoryListByStore(paramMap);
	}
	
	public Integer getCountInventoryByFilm(Integer filmId) {
		return inventoryMapper.selectCountInventoryByFilm(filmId);
	}
}
