package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	
	int selectFilmListByActor(); 
	
	// actorOne
	List<Film> selectFilmTitleListByActor(int actorId);
}
