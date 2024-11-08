package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	int insertFilm(Film film);
	
	Map<String, Object> selectFilmOne(int filmId);
	
	int selectFilmListByActor(); 
	
	// actorOne
	List<Film> selectFilmTitleListByActor(int actorId);
}
