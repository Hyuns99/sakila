package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FilmCategoryMapper {
	// film 삭제시 film_category도 같이 삭제
	Integer deleteFilmCategoryByFilm(Integer filmId);
	
	Integer deleteFilmCategoryByCategory(Integer categoryId);
}
