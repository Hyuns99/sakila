package com.example.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.CategoryMapper;
import com.example.sakila.vo.Category;

@Service
@Transactional
public class CategoryService {
	@Autowired CategoryMapper categoryMapper;
	
	public int getAddCategory(Category category) {
		return categoryMapper.insertCategory(category);
	}
	
	public int getCategoryCount(int rowPerPage) {
		int count = categoryMapper.selectCategoryCount();
		int lastPage = count / rowPerPage;
		if(lastPage % count != 0) {
			lastPage++;
		}
		return lastPage;
	}
	
	public List<Category> getCategoryList() {
		return categoryMapper.selectCategoryList();
	}
}
