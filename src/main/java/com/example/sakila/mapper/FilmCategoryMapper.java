package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmCategory;

@Mapper
public interface FilmCategoryMapper {
	// filmOne에서 장르 삭제하는 메소드
	Integer deleteFilmCategory(FilmCategory filmCategory);
	
	// filmOne에서 장르 추가하는 메소드
	Integer insertFilmCategory(FilmCategory filmCategory);
	
	// filmOne에 출력될 카테고리리스트
	List<Map<String, Object>> selectFilmCategoryListByFilm(Integer FilmId);
	
	// film 삭제시 film_category도 같이 삭제
	Integer deleteFilmCategoryByFilm(Integer filmId);
	
	Integer deleteFilmCategoryByCategory(Integer categoryId);
}
