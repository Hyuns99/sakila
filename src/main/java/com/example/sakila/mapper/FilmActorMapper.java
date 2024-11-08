package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {
	// actor가 출연한 영화 모두 삭제
	int deleteFileByActor(int actorId);
	
	// 개별 삭제
	int deleteFileActor(FilmActor filmActor);
	
	// 추가
	int insertFileActor(FilmActor filmActor);
}
