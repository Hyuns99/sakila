package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	// filmList 페이지네이션
	int selectFilmCount();
	
	// filmList(categoryId가 null이나 0이 아닐 때)
	List<Map<String, Object>> selectFilmListByCategory(Map<String, Object> paraMap);
	
	// filmList(categoryId가 null이나 0일 때)
	List<Map<String, Object>> selectFilmList(Map<String, Object> paraMap);
	
	// /on/actorOne film을 검색 시
	List<Film> selectFilmListByTitle(String searchTitle);
	
	int insertFilm(Film film);
	
	Map<String, Object> selectFilmOne(int filmId);
	
	int selectFilmListByActor(); 
	
	// actorOne
	List<Film> selectFilmTitleListByActor(int actorId);
}
