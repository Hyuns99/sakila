package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;

@Mapper
public interface ActorMapper {
	
	// 삭제
	int deleteActor(int actorId);
	
	// 수정
	int updateActor(Actor actor);
	
	// filmOne
	List<Actor> selectActorListByFilm(int filmId);
	
	// actorOne
	Actor selectActorOne(int actorId); 
	
	// actorList
	List<Actor> selectActorList(Map<String, Object> map);
	int selectActorCount(); // 페이징
	
	int insertActor(Actor actor);
}
