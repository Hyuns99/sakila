package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {
	// 삭제
	int deleteFileActor(FilmActor filmActor);
	
	// 추가
	int insertFileActor(FilmActor filmActor);
}
