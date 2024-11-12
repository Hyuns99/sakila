package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FilmCategoryMapper {
	// filmOne에 출력될 카테고리리스트
	List<Map<String, Object>> selectFilmCategoryListByFilm(Integer FilmId);
	
	// film 삭제시 film_category도 같이 삭제
	Integer deleteFilmCategoryByFilm(Integer filmId);
	
	Integer deleteFilmCategoryByCategory(Integer categoryId);
}
