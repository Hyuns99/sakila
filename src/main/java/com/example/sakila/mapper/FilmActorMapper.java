package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {
	// film 삭제 시 actor 삭제
	Integer deleteFilmActorByFilm(Integer filmId);
	
	// actor가 출연한 영화 모두 삭제
	int deleteFileByActor(int actorId); // delectFilmActorByActor
	
	// 개별 삭제
	int deleteFileActor(FilmActor filmActor);
	
	// 추가
	int insertFileActor(FilmActor filmActor);
}
