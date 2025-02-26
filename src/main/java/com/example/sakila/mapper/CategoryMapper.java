package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Category;

@Mapper
public interface CategoryMapper {
	// addCategory
	int insertCategory(Category category);
	
	// lastPage
	int selectCategoryCount();
	
	// categoryList
	List<Category> selectCategoryList();
}
